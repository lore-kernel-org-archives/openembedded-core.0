Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F000F42105
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19827.1776261883381747073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GBpD3yHt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dz2s5wop;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d9175630e-b16b6a38-7df8-4d89-9a6e-d17ecc223e26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NGmI91SAFSlfM/GlxGsqakuhB/sUcdiHIskT2QokIt4=;
	b=GBpD3yHtelBODXHAXaCejXFuPOjLI78ijdn2sBoLpGeR6h4hBRJLVe0UozW34PoY
	+Nz5FRtT4BXaTIKhc6Wrn6MCgKPAoodG5AGTu3wmdz1iLOH8hEnW2nKZiFxQpBGt52g
	1eUBHGSJs5GRgDgEIC2DRpX8V9sHDVxktrn9WQ2E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NGmI91SAFSlfM/GlxGsqakuhB/sUcdiHIskT2QokIt4=;
	b=dz2s5wopuFoqF3Fum1RGXEuRWGtUkDGCX3scHsipXryYPq1qjkIRUDdM6aQyeu62
	dugnRBrv/yXaQuHzR1hqntgpn65cKfvl1Nvv9RFIIJ2vmw24OZ/Vid2+jirfW9N6/t1
	dP91X/KK4HN11aIXaXA0r9lyK5wSWRkWIG7/ANJo=
Content-Type: multipart/mixed; boundary="===============0989871655447254962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.33.1 SUCCEEDED
Message-ID: <0101019d9175630e-b16b6a38-7df8-4d89-9a6e-d17ecc223e26-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235252

--===============0989871655447254962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-requests* to *2.33.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.32.5-2.33.1.patch
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
From 8726df79d71a40c168b8a5c522e7c96015c212f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:52:35 +0000
Subject: [PATCH] python3-requests: upgrade 2.32.5 -> 2.33.1

---
 .../{python3-requests_2.32.5.bb => python3-requests_2.33.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.5.bb => python3-requests_2.33.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.5.bb
rename to meta/recipes-devtools/python/python3-requests_2.33.1.bb
index 43b63e32b1..dbb65ecf69 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
+SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============0989871655447254962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-76628070d342dd57750e5ae4d8bd711a693e3590"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:76628070d342dd57750e5ae4d8bd711a693e3590"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 512 Local 452 Mirrors 0 Missed 60 Current 308 (88% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 318 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 322 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 323 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 374 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 416 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 473 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pytest/9.0.2/temp/log.do_packagedata_setscene.2648507
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 478 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 480 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_setscene)
NOTE: Running setscene task 485 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 492 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 895 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 897 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_fetch)
NOTE: Running task 901 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_fetch)
NOTE: Running task 902 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_fetch)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Started
NOTE: Running setscene task 509 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 536 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 903 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 538 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Started
NOTE: Running task 904 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 545 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 909 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_unpack)
NOTE: Running task 910 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 915 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 556 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1049 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Started
NOTE: Running task 1050 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1051 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_patch)
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: Running task 1058 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Started
NOTE: Running task 1061 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1172 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1177 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1181 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1182 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1193 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Succeeded
NOTE: Running task 1194 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 639 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 640 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1249 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_recipe_spdx)
NOTE: Running task 1250 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_recipe_spdx)
NOTE: Running task 1251 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1252 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Succeeded
NOTE: Running task 1253 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1254 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Started
NOTE: Running setscene task 641 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Succeeded
NOTE: Running setscene task 643 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 644 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 653 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_deploy_source_date_epoch unihash changed to 2fd7b4234fcfbe992a6741ae9fcec94aeca178c074be5944070bfd9ff1d2bdd4
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 661 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch unihash changed to ab2f13d42271edd294eaf117cc842c669c4ade94464f3f4277d7deea46cf2ffe
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_deploy_source_date_epoch unihash changed to e7d7a582a82428fcff1cfc811d14c16c8f810f9f9a2a8379002589148b5ea9a7
NOTE: Running setscene task 676 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running task 1281 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1292 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1294 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1300 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_create_recipe_spdx)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1301 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1333 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 717 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 718 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch unihash changed to 674570e17fc08cf93da7c1c165b578f9305965a409d0f67e1e0fe48d1b168324
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1349 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1356 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 780 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1397 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1431 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 820 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1845 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1846 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1967 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata)
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1975 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_configure)
NOTE: Running task 1977 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: Running task 1978 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_configure)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_configure)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_configure)
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1982 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 1983 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1984 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1986 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_compile)
NOTE: Running task 1987 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 1988 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_compile)
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1995 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1997 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1998 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: Running task 1999 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_install)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Succeeded
NOTE: Running task 2000 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_install)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2001 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_install)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 2003 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: Running task 2004 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Succeeded
NOTE: Running task 2005 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package)
NOTE: Running task 2006 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Succeeded
NOTE: Running task 2007 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package)
NOTE: Running task 2008 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_populate_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_package)
NOTE: Running task 2010 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_sysroot)
NOTE: Running task 2013 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Started
NOTE: Running task 2014 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_ipk)
NOTE: Running task 2015 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_deb)
NOTE: Running task 2016 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_rpm)
NOTE: Running task 2017 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2018 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_spdx)
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_ipk unihash changed to f33ba6e54e51824c87b85a8f32e7eb149681b7e5b0be20181f870a7eef826278
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_deb unihash changed to 02a42eb9dbbaef79ab28c747f1a2ac9a1a7700daad26eef65d9e550761d1cce9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa unihash changed to 2c2c559e143430e863a44e7ccaa869f91943eefe60b2115f48b4555fcb30818b
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_rpm unihash changed to bf7870dab43b8c74c8b536cce5d1cb9d343f9011f747062e05cfc48480450822
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata unihash changed to e1a0cd46ec8995017f7e614380b045a85731ac9bc2f674b5a0f5a1a2943ca377
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2020 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_spdx)
NOTE: Running task 2021 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk)
NOTE: Running task 2022 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata)
NOTE: Running task 2023 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb)
NOTE: Running task 2024 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 2025 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_package)
NOTE: Running task 2027 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata)
NOTE: Running task 2029 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata unihash changed to a31bbdf1abe329b398f10cb63f2122560c477ccaf914c4eaf9356c31ddb38b73
NOTE: Setscene tasks completed
NOTE: Running task 2030 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_create_spdx)
NOTE: Running task 2031 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_ipk)
NOTE: Running task 2032 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_deb)
NOTE: Running task 2033 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_rpm)
NOTE: Running task 2034 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_qa)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_deb: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_packagedata unihash changed to afec0b7d5596745c5f07bb96e6d9776d695093b91f70cb5b94bf312647417f7d
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata unihash changed to 82cddaa0a5f4e7ba3435f33aac57830dfa4c7245176ad34bfc876190add8e467
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb unihash changed to 539a2f766bdfe9753bb7c6db2b86c52c148b992f7fe4cecc11b15ba68334b1ec
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa unihash changed to db0a5b130c3ed87d3a49312151f4367a355ff99df1dad8822ce50b129b1e9c90
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk unihash changed to 9acd4b5fc9dd845fa9b2a59bdd9b69e4d2a9cb1b28b682e42dfc8a7210a23e16
NOTE: Running task 2035 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_spdx)
NOTE: Running task 2036 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2037 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_ipk)
NOTE: Running task 2038 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm unihash changed to e2b25c221675f060ff82b681051b5fdece095c2ab927ae0a6abdf2e1f2c8d933
NOTE: Setscene tasks completed
NOTE: Running task 2039 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_rpm)
NOTE: Running task 2040 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_qa)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_qa unihash changed to b6154bb2902a8ad439c2c95f71f3c00832bbba65fa4299699b9710fb88a3c965
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_deb unihash changed to 48c1173e341e5d71d390d3536fdbf687ca66b83835989633542a841afbdceaf7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_ipk unihash changed to 4c6a2fe67341172378715652ed6ac95f6dd595e1a75bf65a60e4384f00786de0
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_rpm unihash changed to a0480c4bcf3760ae0fb6153ac81d1bf22d212978c747467599fbbe55b5957590
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_ipk unihash changed to 0c8b6fa7c86b49343c9f282e9a559488fa2d8504a02bd8172b0dbf135f6af65b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_qa unihash changed to 76ffc7fa10261a32ed55cffc185fc42f7f21bf8d6793a02009c1b8927ea7a4fe
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_rpm unihash changed to 11b9ed47dfb4b5096c28ca227f998d637d379b3a054ee42f18b8c3eb6ad2a6d2
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_deb unihash changed to 1301f6c886a4b13c8dcae3bf3a7c782a4c82ea93016ae8e3976ba8facd2cc848
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2041 tasks of which 1938 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415085213.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415085213.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.2656402
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:9.0.3-r0 to 0:9.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-9.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.2656402
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata) failed with exit code '1'

--===============0989871655447254962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============0989871655447254962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.32.5-2.33.1.patch"

RnJvbSA4NzI2ZGY3OWQ3MWE0MGMxNjhiOGE1YzUyMmU3Yzk2MDE1YzIxMmYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NTI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlcXVlc3RzOiB1cGdyYWRlIDIuMzIuNSAtPiAyLjMzLjEKCi0tLQogLi4uL3tweXRo
b24zLXJlcXVlc3RzXzIuMzIuNS5iYiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZXF1ZXN0c18yLjMyLjUu
YmIgPT4gcHl0aG9uMy1yZXF1ZXN0c18yLjMzLjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzIuNS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjMzLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJlcXVlc3RzXzIuMzIuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYgppbmRleCA0M2I2M2UzMmIxLi5k
YmI2NWVjZjY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmVxdWVzdHNfMi4zMi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yZXF1ZXN0c18yLjMzLjEuYmIKQEAgLTcsNyArNyw3IEBAIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1w
eXRob24zLXJlcXVlc3RzLnNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiYmEwYmFj
NTZlMTAwODUzZGIwZWE3MWI4MmI0ZGZkNWZlMmJmNmQzNzU0YTg4OTNjM2FmNTAwY2VjN2Q3Y2Yi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTg4MTdmOGM1N2M2MjYzOTY4YmMxMjNkMjM3ZTNiOGIw
OGFjMDQ2ZjU0NTZiZDFlMzA3ZWU4ZjQyNTBkMzUxNyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9z
ZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi40Ny4xCgo=

--===============0989871655447254962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-requests: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.5.tar.gz;downloadfilename=requests-2.32.5.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.33.1.tar.gz;downloadfilename=requests-2.33.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 414958 to 414081 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============0989871655447254962==--

