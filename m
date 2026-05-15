Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4C8CD4F50
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34749.1778851223006143454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GT6X+9A9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1E0AlqXJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcbe733-449bd55c-0495-46a7-9cce-08848a6c1efb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qp0rbsf5+7n3s82PWb8dP2U/dJuFTxYWwLHhvsx0qKo=;
	b=GT6X+9A9IVykmkRCXj46OHHqf4hg7eScaOgEDxMx324sL09610yG8UQUPxhJD0fU
	ZDdHqj7oOSaRVJSQSNEgFBfE9bdNDyxyqlIoXXcjt99PzPB6qm2f8jKug5SqnKezsLE
	QRWWwRSDTUAquCOAJay6iU/JkXK1UUr5XouFxE2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851244;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qp0rbsf5+7n3s82PWb8dP2U/dJuFTxYWwLHhvsx0qKo=;
	b=1E0AlqXJ+6jM37qe9hue0dknZ7AqFKbV7+cfJH+ZXbcI7JeoWRB0VE0VOkjXM5In
	WPiD6wAXVspStO/XtEoCkX7FLsGzES5NnlLHBGUSvxuFqG4rhdNV/7PS8IrEurj3KKW
	zYl1algvxgxIbx4T4QKB8v8GGEzhCh9USICCG3Ro=
Content-Type: multipart/mixed; boundary="===============3451971389160848769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libksba: upgrading to 1.8.0 SUCCEEDED
Message-ID: <0101019e2bcbe733-449bd55c-0495-46a7-9cce-08848a6c1efb-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237170

--===============3451971389160848769==
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
From 7ecb1eb04ac3f312b927bf02354722c7050645a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:53:51 +0000
Subject: [PATCH] libksba: upgrade 1.6.8 -> 1.8.0

---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch            | 2 +-
 .../libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.8.bb => libksba_1.8.0.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index ef9066cd1f..5ed1d092c6 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 929f7670a6c1e9450f239ee374bb34ac13c13592 Mon Sep 17 00:00:00 2001
+From 3b6a5911f4369b70bf0865d253eade56d30475c8 Mon Sep 17 00:00:00 2001
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


--===============3451971389160848769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ed3a10b63fe09919ab365229d00041eb1261efb8"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:ed3a10b63fe09919ab365229d00041eb1261efb8"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 224 Local 208 Mirrors 0 Missed 16 Current 291 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 331 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 357 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 362 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 970 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_recipe_qa)
NOTE: Running setscene task 406 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 407 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_recipe_qa: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 976 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libgpg-error/1.60/temp/log.do_packagedata_setscene.2534776
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 429 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_package_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 441 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 977 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 999 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libksba-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1012 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1038 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgpg-error-1.60-r0: task do_package_setscene: Started
NOTE: recipe libksba-1.8.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libksba-1.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1045 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1052 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libksba-1.8.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1053 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgpg-error-1.60-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 474 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1054 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.60-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 515 of 515 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1192 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1225 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata)
NOTE: recipe libksba-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata: Started
NOTE: recipe libksba-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_configure)
NOTE: Running task 1259 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libksba-1.8.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f86a1182d9bc950540867457a7a23d791a2ed063ce185e0ddfcd9237204095b0 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b3f1f3b3e4ec5aa9e6dd3e43d337671c71545587f2dd0b19a91865714e00f4a8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f86a1182d9bc950540867457a7a23d791a2ed063ce185e0ddfcd9237204095b0'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b3f1f3b3e4ec5aa9e6dd3e43d337671c71545587f2dd0b19a91865714e00f4a8 -> f86a1182d9bc950540867457a7a23d791a2ed063ce185e0ddfcd9237204095b0 as wanted
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
NOTE: recipe libksba-1.8.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libksba-1.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1283 of 1283 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libksba/libksba_1.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1283 tasks of which 1250 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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

--===============3451971389160848769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libksba: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.8.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.0.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libksba: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 1392032 to 1415000 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.14.8", added "/usr/lib/.debug/libksba.so.8.16.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 33588 to 34015 (+1%)
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGSIZE changed from 216963 to 221059 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGSIZE changed from 992924 to 1013623 (+2%)
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-src: FILELIST: directory renamed /usr/src/debug/libksba/1.6.8/src -> /usr/src/debug/libksba/1.8.0/src, directory renamed /usr/src/debug/libksba/1.6.8/tests -> /usr/src/debug/libksba/1.8.0/tests
packages/x86-64-v3-poky-linux/libksba/libksba-src: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PV changed from "1.6.8" to "1.8.0"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGSIZE changed from 280665 to 288857 (+3%)
packages/x86-64-v3-poky-linux/libksba/libksba: PKGV changed from 1.6.8 [default] to 1.8.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.8", added "/usr/lib/libksba.so.8.16.0"
packages/x86-64-v3-poky-linux/libksba/libksba: PV changed from "1.6.8" to "1.8.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so.8.14.8 moved to /usr/lib/libksba.so.8.16.0

--===============3451971389160848769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.8", added "/usr/lib/libksba.so.8.16.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.8 to libksba.so.8.16.0
  /usr/lib/libksba.so.8.14.8 moved to /usr/lib/libksba.so.8.16.0

--===============3451971389160848769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.6.8-1.8.0.patch"

RnJvbSA3ZWNiMWViMDRhYzNmMzEyYjkyN2JmMDIzNTQ3MjJjNzA1MDY0NWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6NTM6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiB1cGdyYWRlIDEuNi44IC0+IDEuOC4wCgotLS0KIC4uLi9saWJrc2JhL2xpYmtzYmEv
a3NiYS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2ggICAgICAgICAgICB8IDIgKy0KIC4uLi9s
aWJrc2JhL3tsaWJrc2JhXzEuNi44LmJiID0+IGxpYmtzYmFfMS44LjAuYmJ9ICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEve2xpYmtzYmFfMS42LjguYmIg
PT4gbGlia3NiYV8xLjguMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1
cHBvcnQucGF0Y2gKaW5kZXggZWY5MDY2Y2QxZi4uNWVkMWQwOTJjNiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhL2tzYmEtYWRkLXBrZ2NvbmZpZy1zdXBw
b3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYS9rc2Jh
LWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTI5Zjc2
NzBhNmMxZTk0NTBmMjM5ZWUzNzRiYjM0YWMxM2MxMzU5MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gM2I2YTU5MTFmNDM2OWI3MGJmMDg2NWQyNTNlYWRlNTZkMzA0NzVjOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgMyBEZWMgMjAxMiAxODoxNzozMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiBhZGQgcGtnY29uZmlnIHN1cHBvcnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjYuOC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmtzYmEvbGlia3NiYV8xLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS42LjguYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjguMC5iYgppbmRleCAyMDU3MDQ5
MTdlLi45MzhiZGE2N2Y1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2Jh
L2xpYmtzYmFfMS42LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJr
c2JhXzEuOC4wLmJiCkBAIC0yOCw3ICsyOCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9
LyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRl
c3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwZjQ1MTBmMWM3YTY3
OWMzNTQ1OTkwYTMxNDc5ZjM5MWFkNDVkODRlMDM5MTc2MzA5ZDQyZjgwY2Y0MTc0M2Y1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI5NmI5ZGI5MDk1NzQ5ZjJhYTEwNDIwMmQ3YWI3ZmQwOWFkMTA3
MTBlMDA3ODBhNzA5Yzk3NTRiMWExZDkyOTIiCiAKIGRvX2NvbmZpZ3VyZTpwcmVwZW5kICgpIHsK
IAkjIEVsc2UgdGhlc2UgY291bGQgYmUgdXNlZCBpbiBwcmVmZXJlbmNlIHRvIHRob3NlIGluIGFj
bG9jYWwtY29weQotLSAKMi40Ny4xCgo=

--===============3451971389160848769==--

