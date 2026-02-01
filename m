Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CC9E65262
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29198.1769951577037261023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UmKcP/0k;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AcEVyBR+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c1955c1b2-5763b59f-6700-4376-8d93-60e944c4103e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qOq70TEhpCwcLVpo9/xQj6F1L5cEQHVNOK3VXdZM1FQ=;
	b=UmKcP/0kesNxETCA3aI92RTEV4YHe2K4mh60P14uJwAdSYhEbXJDZt4f27t8UPiH
	M7xC6smbe0ithwgnLiLpDVfiNP5cRuFDPjP8jCgsO85PQK3KVoZ4V8od336Ml5dSEi9
	0qO3HDlDpGJEuygsX5ITMIhVK/swH2wxyuls43zU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qOq70TEhpCwcLVpo9/xQj6F1L5cEQHVNOK3VXdZM1FQ=;
	b=AcEVyBR+TCfkV8Tt0HUObVxQE6QGpC91FkezRsDsP0/rdcZkQ+qupbK5PqE1JlcP
	PEAaRBPBgXq4NW+DVuDxAOXXSajMO0Sl7dKi7I8m50mVilTBOxPY+RIZDReT3N8OV++
	M9n4jmpQ3Ooi4R4bf6OqMOdWdR+0R0Y2nE79b11k=
Content-Type: multipart/mixed; boundary="===============0073840503651215962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gi-docgen: upgrading to 2026.1 SUCCEEDED
Message-ID: <0101019c1955c1b2-5763b59f-6700-4376-8d93-60e944c4103e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230312

--===============0073840503651215962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gi-docgen* to *2026.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gi-docgen-upgrade-2025.5-2026.1.patch
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
From cd89beb9c49802a3a2397859853675f5c81bbde9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 11:00:00 +0000
Subject: [PATCH] gi-docgen: upgrade 2025.5 -> 2026.1

---
 .../gi-docgen/{gi-docgen_2025.5.bb => gi-docgen_2026.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2025.5.bb => gi-docgen_2026.1.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
index 5338bca214..f4e9f5002e 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.5.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "9eedfa6572cc9929583f926493751adb85805ffb"
+SRCREV = "3142afb34f5dee4889c92d3bc8ec2bd2aabb90b7"
 
 inherit python_setuptools_build_meta
 
-- 
2.47.1


--===============0073840503651215962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info -> /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info/licenses/LICENSES
Changes to packages/x86-64-v3-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info moved to /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info

--===============0073840503651215962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1958 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 465 Local 402 Mirrors 0 Missed 63 Current 274 (86% match, 91% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 337 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 340 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 382 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 420 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-setuptools/80.9.0/temp/log.do_packagedata_setscene.219605
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_package_setscene)
NOTE: Running setscene task 437 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 887 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: Running task 893 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 930 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_recipe_qa)
NOTE: Running task 931 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_recipe_qa)
NOTE: Running task 932 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_recipe_qa)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 933 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: Running task 934 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: Running setscene task 453 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 936 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 937 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1027 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_recipe_qa)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 500 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markdown-3.10.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_recipe_qa: Started
NOTE: Running task 1140 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 503 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1147 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_unpack)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 524 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2026.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1159 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1161 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_fetch)
NOTE: recipe python3-markdown-3.10.1-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1162 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_fetch)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_fetch)
NOTE: Running task 1169 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1170 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1171 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-smartypants-2.0.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch unihash changed to f5fb11a830ca434568e1253f47338aa1f1dac9a3e3a89255813a1f2d1c62c571
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-smartypants-2.0.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 528 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 29b2d2009b0b936ed2d026f93fa18bb3f723303aebc56f4601a0cae395097392
NOTE: recipe gi-docgen-2026.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_patch: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1233 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1234 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_unpack)
NOTE: Running task 1235 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_patch)
NOTE: Running task 1236 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1237 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1238 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 591 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-smartypants-2.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 592 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1257 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1258 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_patch)
NOTE: Running task 1259 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1286 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 625 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1297 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Succeeded
NOTE: Running task 1298 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1299 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_check_backend)
NOTE: Running task 1300 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1306 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gi-docgen-2026.1-r0: task do_unpack: Succeeded
NOTE: Running task 1307 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_patch)
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smartypants-2.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_check_backend: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 632 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_patch: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 642 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 668 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1319 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 675 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1320 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Started
NOTE: Running task 1322 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 678 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2026.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 695 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1329 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_populate_lic)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 697 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_populate_lic: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 717 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 739 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1727 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1732 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1821 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1822 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1823 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1922 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1963 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata)
NOTE: Running task 1968 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1972 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2026.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1973 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1974 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1975 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 1976 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1985 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe python3-markdown-3.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_configure)
NOTE: recipe gi-docgen-2026.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1987 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_configure)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-smartypants-2.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1988 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_configure)
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Started
NOTE: Running task 1989 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_configure)
NOTE: recipe python3-markdown-3.10.1-r0: task do_configure: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Started
NOTE: Running task 1991 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markdown-3.10.1-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure_ptest_base)
NOTE: Running task 1993 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_compile)
NOTE: Running task 1994 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1996 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_compile)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1997 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_compile: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1998 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: Running task 1999 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2000 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2001 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_install: Started
NOTE: Running task 2002 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_install)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2003 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2004 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_install)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package)
NOTE: recipe gi-docgen-2026.1-r0: task do_install: Started
NOTE: Running task 2007 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 2008 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_install)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package: Started
NOTE: Running task 2009 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_package)
NOTE: recipe python3-markdown-3.10.1-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2010 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 2011 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install_ptest_base)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2012 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_install: Succeeded
NOTE: Running task 2013 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_package)
NOTE: Running task 2014 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_package)
NOTE: Running task 2016 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2017 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package)
NOTE: Running task 2018 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot)
NOTE: recipe python3-markdown-3.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2020 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package)
NOTE: Running task 2021 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2026.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_populate_sysroot)
NOTE: Running task 2025 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Started
NOTE: Running task 2026 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2027 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm)
NOTE: Running task 2028 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa)
NOTE: recipe python3-pygments-2.19.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa: Started
NOTE: Running task 2029 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2030 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2031 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2032 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2033 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_deb)
NOTE: Running task 2034 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_rpm)
NOTE: Running task 2035 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_qa)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_package: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2036 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2037 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx)
NOTE: Running task 2039 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa unihash changed to 4d04a45548a92f4586fc9df71db96b3d220554090f28ec610d277813277a0a0d
NOTE: recipe python3-markdown-3.10.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Started
NOTE: Running task 2040 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_create_spdx)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2042 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_create_spdx)
NOTE: Running task 2043 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_package_write_ipk)
NOTE: Running task 2044 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_package_write_deb)
NOTE: Running task 2045 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_package_write_rpm)
NOTE: Running task 2046 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markdown_3.10.1.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2047 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx)
NOTE: recipe python3-markdown-3.10.1-r0: task do_create_spdx: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2048 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_create_spdx)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Started
NOTE: Running task 2049 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk)
NOTE: Running task 2050 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb)
NOTE: Running task 2051 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm)
NOTE: Running task 2052 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa)
NOTE: Running task 2053 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package_write_ipk)
NOTE: Running task 2054 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package_write_deb)
NOTE: Running task 2055 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package_write_rpm)
NOTE: Running task 2056 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-markdown-3.10.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2057 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_package_write_ipk)
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2058 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_package_write_deb)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2059 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_create_package_spdx)
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_qa: Succeeded
NOTE: Running task 2060 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_package_write_rpm)
NOTE: Running task 2061 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_package_qa)
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_deb: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_create_package_spdx: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2026.1-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markdown-3.10.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa unihash changed to f2be06b77bffd3605dbbe959f06f00a631769011e23a63de271016edad547168
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gi-docgen-2026.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2062 of 2062 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gi-docgen/gi-docgen_2026.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2062 tasks of which 1929 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:80.10.2-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0073840503651215962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-dbg: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-dbg: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-dev: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-dev: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-doc: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-doc: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-locale: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-locale: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-src: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-src: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-staticdev: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen-staticdev: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info -> /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info/licenses/LICENSES
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen: PKGSIZE changed from 2361135 to 2361191 (+0%)
packages/x86-64-v3-poky-linux/gi-docgen/gi-docgen: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/gi-docgen: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/gi-docgen: PV changed from "2025.5" to "2026.1"
Changes to packages/x86-64-v3-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.14/site-packages/gi_docgen-2025.5.dist-info moved to /usr/lib/python3.14/site-packages/gi_docgen-2026.1.dist-info

--===============0073840503651215962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gi-docgen-upgrade-2025.5-2026.1.patch"

RnJvbSBjZDg5YmViOWM0OTgwMmEzYTIzOTc4NTk4NTM2NzVmNWM4MWJiZGU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMTowMDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
LWRvY2dlbjogdXBncmFkZSAyMDI1LjUgLT4gMjAyNi4xCgotLS0KIC4uLi9naS1kb2NnZW4ve2dp
LWRvY2dlbl8yMDI1LjUuYmIgPT4gZ2ktZG9jZ2VuXzIwMjYuMS5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9naS1kb2NnZW4ve2dpLWRvY2dlbl8yMDI1LjUuYmIgPT4gZ2ktZG9jZ2Vu
XzIwMjYuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9j
Z2VuL2dpLWRvY2dlbl8yMDI1LjUuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL2dp
LWRvY2dlbl8yMDI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2dpLWRvY2dlbi9naS1kb2NnZW5fMjAyNS41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL2dpLWRvY2dlbl8yMDI2LjEuYmIKaW5kZXggNTMzOGJj
YTIxNC4uZjRlOWY1MDAyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dpLWRvY2dl
bi9naS1kb2NnZW5fMjAyNS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9naS1kb2NnZW4v
Z2ktZG9jZ2VuXzIwMjYuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9naS1kb2NnZW4ucHk7YmVnaW5saW5lPTE7ZW5kbGluZT01O21kNT0yZGMwZjFmMDEy
MDI0NwogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2ktZG9jZ2Vu
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKIAotU1JDUkVWID0gIjllZWRmYTY1NzJj
Yzk5Mjk1ODNmOTI2NDkzNzUxYWRiODU4MDVmZmIiCitTUkNSRVYgPSAiMzE0MmFmYjM0ZjVkZWU0
ODg5YzkyZDNiYzhlYzJiZDJhYWJiOTBiNyIKIAogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19i
dWlsZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============0073840503651215962==--

