Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866A2C2FC34
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173813.1692224349625004681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=evC7wuSC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=knM+nwmi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e6218-45b77bac-c051-401a-b854-9f98e58d8565-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CVR2VHgty+frHh1c9sgxmjUPiQt7ING1fwYsxcJrlN4=;
	b=evC7wuSCrIv6Cw3+awUCIDxfvRwMMJrX9Y9gK4a92D0oPIKod3DjMDwxH78gI5fz
	ZdUYnFfJ0Yc2wZUoc2xDAKHS+AMf+hLbM07UP7c/cQoZf8xBeYZAiFdE5+ELmVmauVw
	p4HRATivH4QptwNGmnJuNNw+sKS1DkKK7F6LqKJM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CVR2VHgty+frHh1c9sgxmjUPiQt7ING1fwYsxcJrlN4=;
	b=knM+nwmiExyrK96PHpewTuzTRCLkHSGxq/CM8pbZEDlT+suf0ZRxqqWHK4ja8wN/
	xrX3gVlYVzNTgxz6DO2of5PW8DIpS6IzsBmXE4vYmGE2pa3nuPJ6QpPXWhQRxt9Sc4x
	q4TUCANOxSkBzODbK1slCjb1S++9JHFVd7cvV2Z0=
Content-Type: multipart/mixed; boundary="===============5212009396207607221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.8.7 SUCCEEDED
Message-ID: <0101018a006e6218-45b77bac-c051-401a-b854-9f98e58d8565-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186202

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2023.7.6-2023.8.7.patch
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
From 3ba55bd8b12d1bed1b35f1340e1c1d792f8a88d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 06:31:06 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2023.7.6 -> 2023.8.7

---
 ...ifiers_2023.7.6.bb => python3-trove-classifiers_2023.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.7.6.bb => python3-trove-classifiers_2023.8.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
index 7879dc2031..9aed0d62e4 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.7.6.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8a8e168b51d20fed607043831d37632bb50919d1c80a64e0f1393744691a8b22"
+SRC_URI[sha256sum] = "c9f2a0a85d545e5362e967e4f069f56fddfd91215e22ffa48c66fb283521319a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.39.2


--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-32 sysroot...done.
Removing 74 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a904d631ac8ccf40b8cb71c613be1023fb3c55c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 413 Local 398 Mirrors 0 Missed 15 Current 348 (96% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 390 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 393 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-setuptools/68.0.0/temp/log.do_packagedata_setscene.3243415
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 435 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_package_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 436 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_setscene)
NOTE: Running setscene task 449 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 535 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_fetch)
NOTE: Running task 544 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: Running task 545 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 549 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 550 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_unpack)
NOTE: Running task 551 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 537 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1047 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1210 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: Running task 1214 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Started
NOTE: Running setscene task 548 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 569 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1294 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1295 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic unihash changed to f86d4beb389b11b19282291a77395c542633ead55b0477d19c020961c1c8e2bc
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 704 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1795 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2013 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_collect_spdx_deps)
NOTE: Running task 2043 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2048 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2134 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2148 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2149 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: Running task 2150 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2151 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 2152 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2153 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2154 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2157 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile_ptest_base)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2158 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: Running task 2159 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: Running task 2160 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Succeeded
NOTE: Running task 2161 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2162 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package)
NOTE: Running task 2163 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 9e93ee6f2c59e9b57aa23a1eb8a79a84a7950d2e2173403566c2cc1d97a0e415
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 761 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package unihash changed to ac3968f38f4be6fb839306061d3c38f4a0894db18e1e823b4b922c31f9058042
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 760 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 761 of 761 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_spdx)
NOTE: Running task 2169 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_write_rpm)
NOTE: Running task 2170 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2171 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2172 of 2172 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2172 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a904d631ac8ccf40b8cb71c613be1023fb3c55c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 30 Mirrors 0 Missed 15 Current 707 (66% match, 98% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
Removing 3 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 719 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-setuptools/68.0.0/temp/log.do_packagedata_setscene.3236418
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 750 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_package_setscene)
NOTE: Running task 1286 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_recipe_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1922 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_fetch)
NOTE: Running task 1973 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Started
NOTE: Running task 1985 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_unpack)
NOTE: Running task 2114 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_patch)
NOTE: Running task 2116 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2117 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2118 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2120 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2122 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2132 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata)
NOTE: Running task 2133 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic unihash changed to f86d4beb389b11b19282291a77395c542633ead55b0477d19c020961c1c8e2bc
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2138 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2139 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: Running task 2140 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 7f2a86c791247b75cd9f78fd04f2aeed1a6930b3f0505d2b08bec03d730d95de
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2142 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package unihash changed to 2c5f62c6e86e04344b3ae380c9b6252d5c9b4e777644815a3f7e1bdcc7dbe234
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata became valid
NOTE: Running setscene task 751 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2147 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package)
NOTE: Running task 2148 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2150 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_spdx)
NOTE: Running task 2151 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_write_rpm)
NOTE: Running task 2152 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2153 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2154 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2154 tasks of which 2121 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-trove-classifiers: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.7.6.tar.gz;downloadfilename=trove-classifiers-2023.7.6.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2023.8.7.tar.gz;downloadfilename=trove-classifiers-2023.8.7.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2023.7.6" to "2023.8.7"
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 90400 to 90486 (+0%)
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2023.7.6 [default] to 2023.8.7 [default]
packages/core2-32-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2023.7.6" to "2023.8.7"
Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info moved to /usr/lib/python3.11/site-packages/trove_classifiers-2023.8.7.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info moved to /usr/lib/python3.11/site-packages/trove_classifiers-2023.8.7.dist-info

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a904d631ac8ccf40b8cb71c613be1023fb3c55c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 30 Mirrors 0 Missed 15 Current 707 (66% match, 98% complete)
Removing 2 stale sstate objects for arch qemumips...done.
Removing 3 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 719 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-setuptools/68.0.0/temp/log.do_packagedata_setscene.3230870
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 750 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_package_setscene)
NOTE: Running task 1286 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_recipe_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Started
NOTE: Running task 1982 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1983 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_fetch)
NOTE: Running task 1987 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_unpack)
NOTE: Running task 2114 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_patch)
NOTE: Running task 2116 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2117 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: Running task 2118 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2128 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2131 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2132 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2133 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic unihash changed to f86d4beb389b11b19282291a77395c542633ead55b0477d19c020961c1c8e2bc
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2135 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2136 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2138 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2139 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: Running task 2140 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 63f0e0fc5bfc70aceb43a281bea902b315b51ccdb08a140d028a68218de31792
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2142 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package unihash changed to 3e177c63347f75252c2a44244f431743a9ed83074f135d9a1e69c7863a22493a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 751 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2147 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package)
NOTE: Running task 2148 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2150 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_spdx)
NOTE: Running task 2151 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_write_rpm)
NOTE: Running task 2152 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2153 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2154 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2154 tasks of which 2121 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a904d631ac8ccf40b8cb71c613be1023fb3c55c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 30 Mirrors 0 Missed 15 Current 707 (66% match, 98% complete)
Removing 3 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 719 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-setuptools/68.0.0/temp/log.do_packagedata_setscene.3223586
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 750 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_package_setscene)
NOTE: Running task 1286 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_recipe_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Started
NOTE: Running task 1972 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1978 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2028 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_fetch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_unpack)
NOTE: Running task 2114 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: Running task 2116 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_patch)
NOTE: Running task 2117 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_collect_spdx_deps)
NOTE: Running task 2118 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2128 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: Running task 2131 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2132 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2133 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic unihash changed to f86d4beb389b11b19282291a77395c542633ead55b0477d19c020961c1c8e2bc
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2136 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2137 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2138 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2139 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: Running task 2140 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 7421149485ee3a053ca215204d79f335b5367a6fe956457a29b52a28a93b7e00
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2142 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package unihash changed to ef65f0081296ce0146f50446a915accf079b028ba748241d93a18c5804debdd7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 751 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2147 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package)
NOTE: Running task 2148 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2150 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_spdx)
NOTE: Running task 2151 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_write_rpm)
NOTE: Running task 2152 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2153 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2154 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2154 tasks of which 2121 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4a904d631ac8ccf40b8cb71c613be1023fb3c55c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 29 Mirrors 0 Missed 15 Current 708 (65% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 720 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/68.0.0/temp/log.do_packagedata_setscene.3219178
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 750 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_package_setscene)
NOTE: Running task 1286 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_recipe_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Started
NOTE: Running task 1974 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1975 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_fetch)
NOTE: Running task 1983 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_unpack)
NOTE: Running task 2114 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_patch)
NOTE: Running task 2116 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2117 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Started
NOTE: Running task 2118 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-68.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2128 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: Running task 2131 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Started
NOTE: Running task 2132 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2133 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_lic unihash changed to f86d4beb389b11b19282291a77395c542633ead55b0477d19c020961c1c8e2bc
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: Running task 2138 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2139 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: Running task 2140 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 7d371a31687cdecf08221c0ca7108968f3463aa570667434b2bc1475998823bf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2142 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package unihash changed to 767eddd42948cc8d0860e1a50382535c58cbf15c5fa63f473e5c6017146ebf7b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata became valid
NOTE: Running setscene task 751 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 752 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2147 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package)
NOTE: Running task 2148 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_populate_sysroot)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2150 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_spdx)
NOTE: Running task 2151 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_write_rpm)
NOTE: Running task 2152 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2153 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2023.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2154 of 2154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2154 tasks of which 2121 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:68.1.0-r0 to 0:68.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-68.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5212009396207607221==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2023.7.6-2023.8.7.patch"

RnJvbSAzYmE1NWJkOGIxMmQxYmVkMWIzNWYxMzQwZTFjMWQ3OTJmOGE4OGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDY6MzE6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjMuNy42IC0+IDIwMjMuOC43Cgot
LS0KIC4uLmlmaWVyc18yMDIzLjcuNi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjMuOC43LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyMy43LjYuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDIzLjguNy5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy43LjYuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy44LjcuYmIKc2lt
aWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNy42LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyMy44Ljcu
YmIKaW5kZXggNzg3OWRjMjAzMS4uOWFlZDBkNjJlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjMuNy42LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDIzLjguNy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL3B5cGEvdHJvdmUtY2xhc3NpZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhOGUxNjhiNTFkMjBmZWQ2MDcw
NDM4MzFkMzc2MzJiYjUwOTE5ZDFjODBhNjRlMGYxMzkzNzQ0NjkxYThiMjIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYzlmMmEwYTg1ZDU0NWU1MzYyZTk2N2U0ZjA2OWY1NmZkZGZkOTEyMTVlMjJm
ZmE0OGM2NmZiMjgzNTIxMzE5YSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEgcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============5212009396207607221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info moved to /usr/lib/python3.11/site-packages/trove_classifiers-2023.8.7.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.11/site-packages/trove_classifiers-2023.7.6.dist-info moved to /usr/lib/python3.11/site-packages/trove_classifiers-2023.8.7.dist-info

--===============5212009396207607221==--

