Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96078D47CDE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1473.1768526746627321143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fnmxaoVh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HoT59gAQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc468938d-19461165-06ad-4e63-b73f-830a8409c2e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MzGrEW3NgGgjAuA4+3g5aWoaa07U8GkHxnirqHeD/Dk=;
	b=fnmxaoVh4w5T6wC2x6GuciFxq6kTr4RJ/2zcsAkEx9Cr6BmZK6aK2lNbfsp6yvx9
	5tuPBsdc3vtkhHTf1a5r1jn5kAN/Tu75JWeL74t3hi+n3XEDHMCenYEFFS33YyPli35
	8rztbNp0hQvebrtNSmkbt2i6ix57tbV34+A63sPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MzGrEW3NgGgjAuA4+3g5aWoaa07U8GkHxnirqHeD/Dk=;
	b=HoT59gAQMGPKpiojxkfnCA6bguaPLd9EM5lgvwQ4CW1EOopqzEWB0STUyfVmP2NF
	kub1L1FGJUC1T6Mn45Gv5X8U76t/6Z0Kju2XX6pbldjdicXJH7k5m+XUfkc6f+aMqZk
	AoOWRaZdmZU6K4jXTuDxapZs8U8gkDmcmCpSPu0Y=
Content-Type: multipart/mixed; boundary="===============7259959125380676540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.26.0 SUCCEEDED
Message-ID: <0101019bc468938d-19461165-06ad-4e63-b73f-830a8409c2e6-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229464

--===============7259959125380676540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema* to *4.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.25.1-4.26.0.patch
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
From c696b111fad96f5d6e1d91593a625c6cfdb3f260 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:54:00 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.25.1 -> 4.26.0

---
 ...ython3-jsonschema_4.25.1.bb => python3-jsonschema_4.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.25.1.bb => python3-jsonschema_4.26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
index 5ccb829ff4..5a778656af 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85"
+SRC_URI[sha256sum] = "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============7259959125380676540==
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
DISTRO_VERSION       = "5.3.99+snapshot-68ec99a33ed970a82ecd009b25d1ac2c6b3b6b33"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:68ec99a33ed970a82ecd009b25d1ac2c6b3b6b33"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 575 Local 489 Mirrors 0 Missed 86 Current 297 (85% match, 90% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 303 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 342 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 402 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 406 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 449 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 497 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 503 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 508 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-referencing-0.37.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 528 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 530 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_package_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 613 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 619 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1012 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_fetch)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1069 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_fetch)
NOTE: Running task 1076 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: Running task 1077 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_fetch)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1120 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running setscene task 659 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1138 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_recipe_qa)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1222 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: Running task 1223 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 1227 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_fetch)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 1228 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: Running task 1229 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_unpack)
NOTE: Running task 1231 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_recipe_qa: Started
NOTE: Running task 1232 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_fetch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 1240 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_fetch)
NOTE: Running task 1241 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_fetch)
NOTE: Running task 1242 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 1243 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_unpack: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1244 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_patch)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 692 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1255 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_patch)
NOTE: recipe python3-referencing-0.37.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1256 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: Running setscene task 710 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-referencing-0.37.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1276 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 1277 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1280 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1281 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_patch: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_patch: Started
NOTE: Running setscene task 715 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 716 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 732 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1304 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1306 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_unpack)
NOTE: Running task 1309 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1318 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_unpack)
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1323 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_unpack)
NOTE: Running setscene task 738 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1334 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_unpack)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_patch)
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1381 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_fetch)
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_check_backend: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_check_backend: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_unpack: Started
NOTE: Running task 1386 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_check_backend)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_unpack: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_fetch: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 1407 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_patch)
NOTE: Running task 1408 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_patch)
NOTE: Running task 1409 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_patch)
NOTE: Running task 1410 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_patch)
NOTE: recipe python3-six-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1442 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_unpack)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_check_backend: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_check_backend: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_check_backend: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_patch: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_check_backend: Succeeded
NOTE: Running task 1524 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_rust_gen_targets)
NOTE: recipe python3-six-1.17.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_patch)
NOTE: Running task 1526 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_patch: Succeeded
NOTE: Running task 1539 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_patch: Started
NOTE: Running setscene task 779 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 780 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running task 1578 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_check_backend)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 811 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_check_backend: Started
NOTE: recipe python3-six-1.17.0-r0: task do_check_backend: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 819 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 825 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1600 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 832 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 833 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 872 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1967 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2005 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2006 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2007 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2141 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2142 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2143 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2144 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2222 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2278 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_collect_spdx_deps)
NOTE: Running task 2287 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2288 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2289 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2291 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: Running task 2292 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_configure)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_configure)
NOTE: Running task 2294 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2295 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2296 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 2297 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: recipe python3-six-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2298 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure: Started
NOTE: Running task 2299 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure: Started
NOTE: Running task 2300 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Running task 2301 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-referencing-0.37.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_configure: Started
NOTE: Running task 2305 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_configure)
NOTE: Running task 2306 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: Running task 2307 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: Running task 2308 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-six-1.17.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_configure: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_configure: Started
NOTE: Running task 2310 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_configure_ptest_base)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2313 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2319 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-six-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2320 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_compile)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2321 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2322 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_compile)
NOTE: recipe python3-referencing-0.37.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2324 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_compile)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2325 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: Running task 2326 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_compile)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_compile: Started
NOTE: Running task 2327 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2328 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_compile: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_compile: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_configure_ptest_base)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2330 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_compile)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-referencing-0.37.0-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_install)
NOTE: Running task 2335 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: Running task 2336 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_install)
NOTE: Running task 2337 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_install)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_compile_ptest_base)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_install: Started
NOTE: Running task 2339 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.17.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2340 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2341 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_install)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: Running task 2342 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_install)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-six-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_package)
NOTE: Running task 2348 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package)
NOTE: Running task 2349 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package)
NOTE: Running task 2350 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_populate_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2352 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package)
NOTE: Running task 2353 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_populate_sysroot)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_compile_ptest_base)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2355 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_install_ptest_base)
NOTE: Running task 2356 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: Running task 2357 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: Running task 2358 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_install)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2359 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2360 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_populate_sysroot unihash changed to cea1faf309d5df02dbaa5e288932754f5ad163cdad7d5a83b18ff822f923d6d9
NOTE: recipe python3-referencing-0.37.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_populate_sysroot unihash changed to a8a1bd0d5c927f3a468765f398b4e7619a87f0907a534e48998a4b46bef56d0c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_populate_sysroot unihash changed to 839db8eca9e9356288e2d67445cacd4ccc42d011a3fb400786687de8c79b13be
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_populate_sysroot unihash changed to 4c1cfca2970e47734ac4c0127d2e862fe5ee13020e3453525e52288a129d4aad
NOTE: Running task 2361 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package)
NOTE: Running task 2362 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_populate_sysroot)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package: Started
NOTE: Running task 2364 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_populate_sysroot unihash changed to 38c78988575f0e4875a22dd89c1fbc94e2f0da9571caec32aa4f7f15496fb394
NOTE: Setscene tasks completed
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_populate_sysroot unihash changed to e5e82fe9d1a162d4c7178209ea46586afda36f713041236d90dd4ce44ad2972f
NOTE: recipe python3-webcolors-25.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_populate_sysroot unihash changed to 667e53ac1a351dbbe33c2db1a30fd983b367b743dc61e05a09bb1c481b304569
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_populate_sysroot unihash changed to 61bb557f7b0d1d375898d6e7a1cae4cb59b3c5180dbc6f07f4426fe12d77afa2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package unihash changed to 600f1ac2b6b9879c94766b33f7e5fa1bc2b9e19c7629bbbf26e9d0fe879c2b3c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata became valid
NOTE: recipe python3-six-1.17.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package unihash changed to 5b0de01ff84d518846f65a3b33f559aaa1ad7b5aa671920eeb8473bc0373a9f6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package unihash changed to 94a4b4064b02bf91fa57e034fdcc7c797a91d730ec144a31c8b4b5ab3d73f1e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk became valid
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package unihash changed to 9422b3062ae8474946eb9433d1450cabf563b9adfb46aee90793ccd774af6497
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_deb became valid
NOTE: Running setscene task 850 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_package unihash changed to 5c81aeea06b1b8d5aa33e5eaf3ae69a208941a02656fc979d4be31f794a633a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_packagedata became valid
NOTE: Running setscene task 847 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 851 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 853 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 855 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 856 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 857 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 859 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 861 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 868 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_packagedata_setscene)
NOTE: Running task 2365 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_install_ptest_base)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 869 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 872 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package unihash changed to f4a0a423d74d352de6783c1e9655bb3fe5206e50a12690a99bfba5530a65d6a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_packagedata became valid
NOTE: recipe python3-referencing-0.37.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 872 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_packagedata_setscene)
NOTE: Running task 2367 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_package)
NOTE: Running task 2368 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_create_spdx)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package unihash changed to f49c8d1eed49962d2527277401784c4f5ce70628e3ea7046036bded197ff0371
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_qa became valid
NOTE: recipe python3-referencing-0.37.0-r0: task do_create_spdx: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 868 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 871 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_qa_setscene)
NOTE: Running task 2372 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: recipe python3-idna-3.11-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_create_spdx)
NOTE: Running task 2376 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package unihash changed to 5e234924b29b937c527f327081d5cd2837bbff909b975fe3b7023dd78a67555a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa became valid
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package unihash changed to 305936b15aa52d540933762a939c9e1baa2ad434abcaa6c0484172e98834f293
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk became valid
NOTE: Running setscene task 856 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: Running setscene task 861 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 865 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 866 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 867 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 869 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: Running task 2379 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_create_spdx)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 2380 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 870 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_packagedata_setscene)
NOTE: Running task 2384 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-referencing-0.37.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_qa_setscene: Started
NOTE: Running task 2388 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 871 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 872 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2391 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_create_spdx)
NOTE: Running task 2394 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2397 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_spdx)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2400 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_rpm)
NOTE: Running task 2402 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_create_spdx)
NOTE: Running task 2406 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm unihash changed to 0a67d34e49b7f9bae9373bba02ffaff4c5b7b76cc8bfebc40b067e082c44ad32
NOTE: Setscene tasks completed
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package_write_rpm unihash changed to 8a0d4cf95f78623df6401c381f9a61b27191375d84d4acf5ca46698c42c68130
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm unihash changed to 6f6ee2870bfb48383338edb962280fc53423ee74f8da3dabb3c08679624acc15
NOTE: recipe python3-idna-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package_write_rpm unihash changed to a19584294e36a9d3c21ed3f081d8be89a4cdf4f510a5e69ac40f016078768216
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm unihash changed to 50a66b5212eac143bfbafd5f01b2e77c4c191ef3b593bef007fbba193d0f370e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package_write_rpm unihash changed to 6a3f2e4733e6fbc5b24c63c8f7ccdfeee4514f70bbaf7604203a7de546110587
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2433 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.149.0-r0: task do_packagedata: Failed
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2408 tasks of which 2260 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115205330.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115205330.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.149.0/temp/log.do_packagedata.1257924
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.150.2-r0 to 0:6.149.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.149.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.149.0/temp/log.do_packagedata.1257924
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb:do_packagedata) failed with exit code '1'

--===============7259959125380676540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info -> /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/jsonschema/benchmarks/__pycache__/import_benchmark.cpython-313.pyc /usr/lib/python3.13/site-packages/jsonschema/benchmarks/import_benchmark.py"
Changes to packages/x86-64-v3-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info
  /usr/lib/python3.13/site-packages/jsonschema/benchmarks/import_benchmark.py was added
  /usr/lib/python3.13/site-packages/jsonschema/benchmarks/__pycache__/import_benchmark.cpython-313.pyc was added

--===============7259959125380676540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.25.1-4.26.0.patch"

RnJvbSBjNjk2YjExMWZhZDk2ZjVkNmUxZDkxNTkzYTYyNWM2Y2ZkYjNmMjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6NTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC4yNS4xIC0+IDQuMjYuMAoKLS0tCiAuLi55dGhv
bjMtanNvbnNjaGVtYV80LjI1LjEuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjYuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC4y
NS4xLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjI2LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNS4x
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4y
Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNi4wLmJiCmluZGV4
IDVjY2I4MjlmZjQuLjVhNzc4NjU2YWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjI2LjAuYmIKQEAgLTQsNyArNCw3
IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2E2MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFh
ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU0YTk2NTVjZTBkYTBjMGI2N2EwODU4NDdlMDBh
M2E1MTQ0OWUxMTU3ZjRmNzVlOWZiNWFhNTQ1ZTEyMmViODUiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMGMyNjcwN2UyZWZhZDhhYTFiZmM1YjdjZTE3MGYzZmNjYzJlNDkxOGZmODU5ODliYTlmZmE5
ZmFjYjJiZTMyNiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4x
Cgo=

--===============7259959125380676540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonschema: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.25.1.tar.gz;downloadfilename=jsonschema-4.25.1.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.26.0.tar.gz;downloadfilename=jsonschema-4.26.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 465516 to 465484 (-0%)
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.25.1" to "4.26.0"
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 474056 to 476052 (+0%)
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.25.1 [default] to 4.26.0 [default]
packages/x86-64-v3-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info -> /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info, added "/usr/lib/python3.13/site-packages/jsonschema/benchmarks/__pycache__/import_benchmark.cpython-313.pyc /usr/lib/python3.13/site-packages/jsonschema/benchmarks/import_benchmark.py"
Changes to packages/x86-64-v3-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.25.1.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.26.0.dist-info
  /usr/lib/python3.13/site-packages/jsonschema/benchmarks/import_benchmark.py was added
  /usr/lib/python3.13/site-packages/jsonschema/benchmarks/__pycache__/import_benchmark.cpython-313.pyc was added

--===============7259959125380676540==--

