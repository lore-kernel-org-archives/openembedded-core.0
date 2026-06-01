Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC53CD6E6C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1562.1780328133923791036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BGLbNPVg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FzGdGrue;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d3d1e8-8dba493e-0194-489e-b91a-01a3cf260725-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nHHhkvRJni4vJHrVaJuMml5bSg3gLq3iDQdvDyHqONI=;
	b=BGLbNPVgi7oeMVhjmJdrbdZDiqPHpZQ27/6nqY/930Cf8XxKPRc0/IeIMy4abRQI
	HQacjoZom/rAyeB93t1zk/3v388e2sGEdh/k1byOpa/x0GFry+tpdGtSeI3nfRy7KYp
	WZwAfH74TQesFNMqKYsmFb1dZs7dW8KvzwY/CtsI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nHHhkvRJni4vJHrVaJuMml5bSg3gLq3iDQdvDyHqONI=;
	b=FzGdGrueLGea/wAnoTJR/FQ7FhkxpZcJyvhbtARWapbWRSLy5Lcx+B5Ly2kb1Btg
	zFbqzq97RZ5jhlMSxsHaLMYxCj2HIKTUBmxfFYoNGbM3DfgFhW4OF46/4UzhZ6gv5Ho
	96LUWJyN7v1hQc5fK+z5zjC81moy4Mp9iWoKRcyo=
Content-Type: multipart/mixed; boundary="===============7993780137953900452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libksba: upgrading to 1.8.0 SUCCEEDED
Message-ID: <0101019e83d3d1e8-8dba493e-0194-489e-b91a-01a3cf260725-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237961

--===============7993780137953900452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libksba* to *1.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.6.8-1.8.0.patch
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
From f9f89177b1fe1e59234713867160bf23faa454fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:57:15 +0000
Subject: [PATCH] libksba: upgrade 1.6.8 -> 1.8.0

---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch            | 2 +-
 .../libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index ef9066cd1f..58d740ee04 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 929f7670a6c1e9450f239ee374bb34ac13c13592 Mon Sep 17 00:00:00 2001
+From 2938534d5edcc1c5c3ff35c4d0baded2a878b6c5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.6.8.bb b/meta/recipes-support/libksba/libksba_1.8.0.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.6.8.bb
rename to meta/recipes-support/libksba/libksba_1.8.0.bb
index 205704917e..938bda67f5 100644
--- a/meta/recipes-support/libksba/libksba_1.6.8.bb
+++ b/meta/recipes-support/libksba/libksba_1.8.0.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5"
+SRC_URI[sha256sum] = "296b9db9095749f2aa104202d7ab7fd09ad10710e00780a709c9754b1a1d9292"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.47.1


--===============7993780137953900452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.8", added "/usr/lib/libksba.so.8.16.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so.8.14.8 moved to /usr/lib/libksba.so.8.16.0

--===============7993780137953900452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8cd4691f4974d87b57f71ca7f804563b9ea77c5f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:8cd4691f4974d87b57f71ca7f804563b9ea77c5f"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 210 Local 195 Mirrors 0 Missed 15 Current 305 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 328 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 351 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 359 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 371 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 378 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 410 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 414 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 979 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_fetch: Started
NOTE: recipe libksba-1.8.0-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 985 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_unpack)
NOTE: Running setscene task 434 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libgpg-error/1.60/temp/log.do_packagedata_setscene.1371255
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 437 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 439 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 440 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 991 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1013 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libksba-1.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1021 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1022 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libksba-1.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1041 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1043 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgpg-error-1.60-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libksba-1.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_deploy_source_date_epoch unihash changed to 51e4fd12b1cf4feec160ff0460dd1b1dc07d17aca876a80fe9b3163707a9ca22
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1052 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1053 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgpg-error-1.60-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 474 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1054 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgpg-error-1.60-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 481 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1192 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1225 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata)
NOTE: recipe libksba-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata: Started
NOTE: recipe libksba-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1258 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_configure)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1260 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 101603b9224ea736ef9fc2700e0c4c95c4dc24ee0b6209d1f791a979e067931f to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '763d6f64f245e8cc180a7b6e32fdd9a911cd44dcf773531c12bb85f240b09773', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '101603b9224ea736ef9fc2700e0c4c95c4dc24ee0b6209d1f791a979e067931f'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 763d6f64f245e8cc180a7b6e32fdd9a911cd44dcf773531c12bb85f240b09773 -> 101603b9224ea736ef9fc2700e0c4c95c4dc24ee0b6209d1f791a979e067931f as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libksba-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1269 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe libksba-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libksba-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1270 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_compile)
NOTE: recipe libksba-1.8.0-r0: task do_compile: Started
NOTE: recipe libksba-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1271 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libksba-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libksba-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1272 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_install)
NOTE: recipe libksba-1.8.0-r0: task do_install: Started
NOTE: recipe libksba-1.8.0-r0: task do_install: Succeeded
NOTE: Running task 1273 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_install_ptest_base)
NOTE: recipe libksba-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libksba-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1274 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package)
NOTE: Running task 1275 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.8.0-r0: task do_package: Started
NOTE: recipe libksba-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 1276 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_packagedata)
NOTE: recipe libksba-1.8.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1277 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_create_spdx)
NOTE: Running task 1278 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package_write_ipk)
NOTE: Running task 1279 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package_write_deb)
NOTE: Running task 1280 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package_write_rpm)
NOTE: Running task 1281 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package_qa)
NOTE: recipe libksba-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe libksba-1.8.0-r0: task do_package_write_ipk: Started
NOTE: recipe libksba-1.8.0-r0: task do_package_write_deb: Started
NOTE: recipe libksba-1.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.8.0-r0: task do_package_qa: Started
NOTE: recipe libksba-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1282 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_create_package_spdx)
NOTE: recipe libksba-1.8.0-r0: task do_create_package_spdx: Started
NOTE: recipe libksba-1.8.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_package_qa unihash changed to 32643c174827c940e1745bff9097909a52b45e64b468e017163020f5c599a4dd
NOTE: recipe libksba-1.8.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1283 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1283 tasks of which 1251 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-src went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-dbg went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-ptest went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-staticdev went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-dev went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-doc went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-cs went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-da went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-de went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-eo went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-es went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-fr went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-hu went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-it went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ja went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-nl went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-pl went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-pt went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ro went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-ru went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-sr went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-sv went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-tr went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-uk went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-vi went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-zh-cn went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error-locale-zh-tw went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: QA Issue: Package version for package libgpg-error went backwards which would break package feeds (from 0:1.61-r0 to 0:1.60-r0) [version-going-backwards]
ERROR: libgpg-error-1.60-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7993780137953900452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.6.8-1.8.0.patch"

RnJvbSBmOWY4OTE3N2IxZmUxZTU5MjM0NzEzODY3MTYwYmYyM2ZhYTQ1NGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDo1NzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmtzYmE6IHVwZ3JhZGUgMS42LjggLT4gMS44LjAKCi0tLQogLi4uL2xpYmtzYmEvbGlia3NiYS9r
c2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4uL2xp
YmtzYmEve2xpYmtzYmFfMS42LjguYmIgPT4gbGlia3NiYV8xLjguMC5iYn0gICAgICAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS97bGlia3NiYV8xLjYuOC5iYiA9
PiBsaWJrc2JhXzEuOC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25maWctc3Vw
cG9ydC5wYXRjaAppbmRleCBlZjkwNjZjZDFmLi41OGQ3NDBlZTA0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1cHBv
cnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhL2tzYmEt
YWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MjlmNzY3
MGE2YzFlOTQ1MGYyMzllZTM3NGJiMzRhYzEzYzEzNTkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAyOTM4NTM0ZDVlZGNjMWM1YzNmZjM1YzRkMGJhZGVkMmE4NzhiNmM1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgog
RGF0ZTogTW9uLCAzIERlYyAyMDEyIDE4OjE3OjMxICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxp
YmtzYmE6IGFkZCBwa2djb25maWcgc3VwcG9ydApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuNi44LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
a3NiYS9saWJrc2JhXzEuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjYuOC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuOC4wLmJiCmluZGV4IDIwNTcwNDkx
N2UuLjkzOGJkYTY3ZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEv
bGlia3NiYV8xLjYuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtz
YmFfMS44LjAuYmIKQEAgLTI4LDcgKzI4LDcgQEAgU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0v
JHtCUE59LyR7QlBOfS0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVz
dCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmNDUxMGYxYzdhNjc5
YzM1NDU5OTBhMzE0NzlmMzkxYWQ0NWQ4NGUwMzkxNzYzMDlkNDJmODBjZjQxNzQzZjUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMjk2YjlkYjkwOTU3NDlmMmFhMTA0MjAyZDdhYjdmZDA5YWQxMDcx
MGUwMDc4MGE3MDljOTc1NGIxYTFkOTI5MiIKIAogZG9fY29uZmlndXJlOnByZXBlbmQgKCkgewog
CSMgRWxzZSB0aGVzZSBjb3VsZCBiZSB1c2VkIGluIHByZWZlcmVuY2UgdG8gdGhvc2UgaW4gYWNs
b2NhbC1jb3B5Ci0tIAoyLjQ3LjEKCg==

--===============7993780137953900452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.8.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.0.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libksba: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.14.8", added "/usr/lib/.debug/libksba.so.8.16.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 1438576 to 1461440 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 33588 to 34015 (+1%)
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGSIZE changed from 221059 to 225155 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-src: FILELIST: directory renamed /usr/src/debug/libksba/1.6.8/src -> /usr/src/debug/libksba/1.8.0/src, directory renamed /usr/src/debug/libksba/1.6.8/tests -> /usr/src/debug/libksba/1.8.0/tests
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGSIZE changed from 992924 to 1013623 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-src: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.8", added "/usr/lib/libksba.so.8.16.0"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGSIZE changed from 309337 to 317529 (+3%)
packages/x86-64-v3-poky-linux/libksba/libksba: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba: PV changed from "1.6.8" to "1.8.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so.8.14.8 moved to /usr/lib/libksba.so.8.16.0

--===============7993780137953900452==--

