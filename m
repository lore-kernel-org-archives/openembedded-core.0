Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C42CD37BF
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15602.1777645526072816566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F7mH4H8x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zfLFyplx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee6033-5761eb8a-f5d1-428c-9cb9-c9382ed66679-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YW+rqLYXn/0X9tAbwgDpwqcmOl8RYmOEcwEYQSyTOtY=;
	b=F7mH4H8xTfReeJ0bLtvygRA1Zrcp0S9EhY/9PJkPglscIxX+roHWL3WqRJ9ZdiOh
	6yG/bC/enu1EvhdRwPsa+rPE1GhS3aMO/N6vaWJNbpwgvVMTVQwNlTetGxKag81ACK3
	6rrEsVZ7cSUYv5pu8M1BnHEKn7RUs4+DbGnAiwYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YW+rqLYXn/0X9tAbwgDpwqcmOl8RYmOEcwEYQSyTOtY=;
	b=zfLFyplxuW8BCJR8d2i/A3dtQsp5OzFd7vCFYWTL+8LoZXubu0mmkZJFXxtAkWLI
	BUE0CTgVZ5GxYmvAzGcZQIZ8oWmLbMp/A4bqgK+eoJ1NVQM99rqQmnoilWVU1XWDBO0
	Lsu0hjDLs36ApxpE2EpDJ7FS++hLTkTjgKreLr48=
Content-Type: multipart/mixed; boundary="===============0836315200027107329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2026.4.28.13 SUCCEEDED
Message-ID: <0101019de3ee6033-5761eb8a-f5d1-428c-9cb9-c9382ed66679-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236247

--===============0836315200027107329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2026.4.28.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2026.1.14.14-2026..patch
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
From d20657767b399a6b057b5ecf348840fa19160344 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:21:03 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2026.1.14.14 ->
 2026.4.28.13

---
 ...026.1.14.14.bb => python3-trove-classifiers_2026.4.28.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.1.14.14.bb => python3-trove-classifiers_2026.4.28.13.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
index f1b1341246..1ed81eccff 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3"
+SRC_URI[sha256sum] = "c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.47.1


--===============0836315200027107329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info

--===============0836315200027107329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-81766e382026f361b4e4b39a770d0438117c7f9d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:81766e382026f361b4e4b39a770d0438117c7f9d"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 509 Local 483 Mirrors 0 Missed 26 Current 330 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 345 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 355 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 356 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 372 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 383 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 386 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 391 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_populate_lic_setscene)
NOTE: Running setscene task 397 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 424 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 452 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 454 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 465 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 490 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-packaging/26.0/temp/log.do_packagedata_setscene.3662682
NOTE: Running setscene task 494 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 502 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 521 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_setscene)
NOTE: Running setscene task 527 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 894 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1091 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: Running task 1092 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_fetch)
NOTE: Running task 1093 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_recipe_qa: Started
NOTE: recipe libmpc-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1186 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 592 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 604 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 605 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running task 1197 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: Running task 1198 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1199 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 616 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1200 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1201 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Started
NOTE: Running task 1206 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1208 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1209 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 629 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1234 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: Running task 1293 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1298 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1299 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_patch)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running task 1314 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 681 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 682 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 683 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1330 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1332 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pygments-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 701 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 704 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1364 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 726 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 761 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1395 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 776 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 839 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1986 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1987 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1988 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2035 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2058 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pygments-2.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 1dd5abecae71d0b3d1a12a2180e1796f7fa80674a91c4d3d7ce5fcc1042490cd to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '85807aadd2128cf9ae4ec7821c2af6c139a6636dd316be39062ce85f367b571d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1dd5abecae71d0b3d1a12a2180e1796f7fa80674a91c4d3d7ce5fcc1042490cd'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 85807aadd2128cf9ae4ec7821c2af6c139a6636dd316be39062ce85f367b571d -> 1dd5abecae71d0b3d1a12a2180e1796f7fa80674a91c4d3d7ce5fcc1042490cd as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2071 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_configure: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2072 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-pygments-2.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: Running task 2074 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_configure: Succeeded
NOTE: Running task 2075 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_configure_ptest_base)
NOTE: recipe python3-pygments-2.20.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2076 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-pygments-2.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2077 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: Running task 2078 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2079 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2080 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_install)
NOTE: recipe python3-pygments-2.20.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_compile: Succeeded
NOTE: Running task 2082 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_compile_ptest_base)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2083 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2084 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_install)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_install: Succeeded
NOTE: Running task 2086 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2087 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Started
NOTE: Running task 2088 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_package)
NOTE: Running task 2089 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package unihash changed to e0f63c488d79b8da25c2e1d1cec1c1eda6d7065eeac986b9042ab8f67585e7dc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata became valid
NOTE: Running setscene task 839 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_install: Succeeded
NOTE: Running task 2090 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_package)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_package: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package unihash changed to ec108b2998914bc5a7d9a3a9cc2cb0411d21c7a338adddb3d8358a9578c7c1fd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 839 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_create_spdx)
NOTE: Running task 2095 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_package_write_ipk)
NOTE: Running task 2096 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_package_write_deb)
NOTE: Running task 2097 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_package_write_rpm)
NOTE: Running task 2098 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_ipk: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_deb: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2099 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_create_package_spdx)
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_package_spdx: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_package: Succeeded
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_package unihash changed to c7667b373202b53a8bfe9418d20cac24be4a74b667817b33fca40eb19e8f8889
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_qa became valid
NOTE: Running setscene task 835 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 836 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 837 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 838 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-trove-classifiers-2026.4.28.13-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 839 of 839 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 2105 of 2105 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_build)
NOTE: Tasks Summary: Attempted 2105 tasks of which 2048 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-ptest went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:26.2-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0836315200027107329==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2026.1.14.14-2026..patch"

RnJvbSBkMjA2NTc3NjdiMzk5YTZiMDU3YjVlY2YzNDg4NDBmYTE5MTYwMzQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOToyMTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNi4xLjE0LjE0IC0+CiAyMDI2LjQu
MjguMTMKCi0tLQogLi4uMDI2LjEuMTQuMTQuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI2LjQuMjguMTMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjEuMTQuMTQuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI2LjQuMjguMTMuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYuMS4xNC4x
NC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI2LjQuMjguMTMuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYu
MS4xNC4xNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYuNC4yOC4xMy5iYgppbmRleCBmMWIxMzQxMjQ2Li4xZWQ4
MWVjY2ZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNi4xLjE0LjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjQuMjguMTMuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNs
YXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwMDQ5MjU0NWExNDAyYjA5ZDQ4NTg2MDViYTE5MGVhMzMyNDNk
MzYxZTJiMDFjOWMyOTZjZTA2YjVjMzMyNWYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4NWJi
OGE1M2MzZGU3MzMwZDE2OTliODQ0ZWQ5ZmI4MDlhNjAyYTA5YWMxNWRjNzlhZDZkMWE1MDliZTA2
NzYiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIAotLSAKMi40Ny4xCgo=

--===============0836315200027107329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.1.14.14.tar.gz;downloadfilename=trove_classifiers-2026.1.14.14.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.4.28.13.tar.gz;downloadfilename=trove_classifiers-2026.4.28.13.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 113218 to 113532 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2026.1.14.14" to "2026.4.28.13"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2026.1.14.14 [default] to 2026.4.28.13 [default]
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.1.14.14.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info

--===============0836315200027107329==--

