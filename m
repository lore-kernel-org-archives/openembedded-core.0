Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C028C10FCAD6
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14639.1775054152486170389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PEcGcrJk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VXRevn8X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d49791315-c86558d6-580a-4ad2-8253-2899cb694108-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s/L575gWzhIOcDZGk51LmHmkkRRjkxfnQUB68YpM1J0=;
	b=PEcGcrJkr+B26P6YPQdrz7aqshbe212D67ThEHkuRnobIxvCN8GCp70/lnEt6fxH
	unDbdeozQeJnp9D+y65kphoPaBdI41Q+0mdbbsG6seLbVvVQGiVyXAOISUWgI99DcCQ
	nLOH754Y76nzW8raoMEjBfrrXQCqV29wAN3jOZ04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s/L575gWzhIOcDZGk51LmHmkkRRjkxfnQUB68YpM1J0=;
	b=VXRevn8Xr8Y5Omn+48fhU4ohz/phJURYImm8toD04/9Uv+/B2OwoafSDuBr8j7XQ
	rW0u78lFsiHj6SZfZ117vzdfdc23oeBd+v3w+eDoFgzSQTvNHMjyIxosgyuVlQYdajA
	NjDIPk6q2PqXCtJ4xrtnvnjMhsP6L63Pv11NsohY=
Content-Type: multipart/mixed; boundary="===============0885267970635334910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.33.1 SUCCEEDED
Message-ID: <0101019d49791315-c86558d6-580a-4ad2-8253-2899cb694108-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234388

--===============0885267970635334910==
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
From 25e98a0da1f2d64a12f6c6a4b0dee479bf3fcc92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:23:31 +0000
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


--===============0885267970635334910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE"
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============0885267970635334910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-cd3434a9d0abf546606c7a9e5efb7fa93b6c346a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:cd3434a9d0abf546606c7a9e5efb7fa93b6c346a"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 516 Local 446 Mirrors 0 Missed 70 Current 304 (86% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 363 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 369 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 409 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 423 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 502 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 820 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa)
NOTE: Running task 893 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa)
NOTE: Running task 896 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_recipe_qa)
NOTE: Running task 897 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_recipe_qa)
NOTE: Running task 898 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_recipe_qa)
NOTE: Running task 899 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_recipe_qa)
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 503 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 524 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 528 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 998 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 533 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 999 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1000 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_fetch)
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 549 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1001 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1006 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_fetch)
NOTE: Running task 1007 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1036 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_unpack)
NOTE: Running setscene task 571 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Started
NOTE: Running task 1054 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 585 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 586 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 588 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 591 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1142 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1214 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1217 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1223 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_patch)
NOTE: Running task 1224 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_unpack)
NOTE: Running task 1225 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1231 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1280 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1281 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_recipe_spdx)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 684 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 687 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Started
NOTE: Running setscene task 688 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Started
NOTE: Running setscene task 689 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 691 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Succeeded
NOTE: Running setscene task 694 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 705 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1325 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Succeeded
NOTE: Running task 1328 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1329 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1330 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1351 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1352 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Started
NOTE: Running task 1364 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1365 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1371 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_recipe_spdx)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1377 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 766 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 769 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1388 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1401 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_create_recipe_spdx)
NOTE: Running task 1402 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_create_recipe_spdx)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1403 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch unihash changed to 591dde05ef9a1e8bec07a1915686ce7e76ffa1398d97120ed6cb4e0fbc1b95b8
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch unihash changed to 6297db971db6fce87553fa432abd290d0793628a8382c103283480e86ffe5fec
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch unihash changed to ab2f13d42271edd294eaf117cc842c669c4ade94464f3f4277d7deea46cf2ffe
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 769 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1421 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 803 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1435 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1845 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1846 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1975 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_configure)
NOTE: Running task 1978 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_configure)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_configure)
NOTE: Running task 1980 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Started
NOTE: Running task 1981 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Succeeded
NOTE: Running task 1982 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Succeeded
NOTE: Running task 1983 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_compile)
NOTE: Running task 1984 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 1986 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_compile)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1987 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1988 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1995 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Succeeded
NOTE: Running task 1997 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Started
NOTE: Running task 1998 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1999 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_install)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Succeeded
NOTE: Running task 2000 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2001 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 2003 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Succeeded
NOTE: Running task 2004 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package)
NOTE: Running task 2005 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Started
NOTE: Running task 2007 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package)
NOTE: Running task 2008 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_package)
NOTE: Running task 2010 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2011 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package)
NOTE: Running task 2012 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2014 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_spdx)
NOTE: Running task 2015 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata)
NOTE: Running task 2016 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk)
NOTE: Running task 2017 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb)
NOTE: Running task 2018 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 2019 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Succeeded
NOTE: Running task 2020 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_package)
NOTE: Running task 2021 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata)
NOTE: Running task 2023 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_packagedata)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Started
NOTE: Running task 2024 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2025 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_ipk)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.11-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_deb)
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Started
NOTE: Running task 2027 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_write_rpm)
NOTE: Running task 2028 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package_qa)
NOTE: Running task 2029 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_deb: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_qa: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2030 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_spdx)
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2031 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_spdx)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2032 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_spdx)
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Started
NOTE: Running task 2033 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_ipk)
NOTE: Running task 2034 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_deb)
NOTE: Running task 2035 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_write_rpm)
NOTE: Running task 2036 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_qa)
NOTE: Running task 2037 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_ipk)
NOTE: Running task 2038 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_deb)
NOTE: Running task 2039 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_rpm)
NOTE: Running task 2040 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa)
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_qa: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package_qa unihash changed to 76ffc7fa10261a32ed55cffc185fc42f7f21bf8d6793a02009c1b8927ea7a4fe
NOTE: recipe python3-idna-3.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa unihash changed to 2c2c559e143430e863a44e7ccaa869f91943eefe60b2115f48b4555fcb30818b
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2052 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2041 tasks of which 1929 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401102309.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401102309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.21095
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:7.3.0-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.21095
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata) failed with exit code '1'

--===============0885267970635334910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-requests: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.5.tar.gz;downloadfilename=requests-2.32.5.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.33.1.tar.gz;downloadfilename=requests-2.33.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-requests: PV changed from "2.32.5" to "2.33.1"
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
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 414958 to 414081 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============0885267970635334910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.32.5-2.33.1.patch"

RnJvbSAyNWU5OGEwZGExZjJkNjRhMTJmNmM2YTRiMGRlZTQ3OWJmM2ZjYzkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDoyMzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4zMi41IC0+IDIuMzMuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtcmVxdWVzdHNfMi4zMi41LmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4zMy4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzXzIuMzIuNS5i
YiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMi41LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcmVxdWVzdHNfMi4zMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMy4xLmJiCmluZGV4IDQzYjYzZTMyYjEuLmRi
YjY1ZWNmNjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjMyLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYgpAQCAtNyw3ICs3LDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLXB5
dGhvbjMtcmVxdWVzdHMuc2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGJiYTBiYWM1
NmUxMDA4NTNkYjBlYTcxYjgyYjRkZmQ1ZmUyYmY2ZDM3NTRhODg5M2MzYWY1MDBjZWM3ZDdjZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxODgxN2Y4YzU3YzYyNjM5NjhiYzEyM2QyMzdlM2I4YjA4
YWMwNDZmNTQ1NmJkMWUzMDdlZThmNDI1MGQzNTE3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3Nl
dHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============0885267970635334910==--

