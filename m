Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1077C25B0E
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.3952.1659679409515240035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mDkjMFw1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101826c99fe6e-10242d92-5556-4eb3-8adb-5297593c6809-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M6XNNz5UG1PRsHDxG5QmzDSVZt7/LN9FFbTNfQXjD+E=;
	b=mDkjMFw15TT+n8qiICgF2y07NguGjTzDHYKaHByHbgYZhGWZcDGKA1t/sjyHwRvN
	H1bzH8jsFIBnIiqWCRg7xMwa4hV+e9QI+X1IcHCLc8g5aFZl6UcYhziSQsNSQOfNFEC
	6InWUeNyFE/sUVh8YOBSzu3acUphWnAjkKRiNi5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M6XNNz5UG1PRsHDxG5QmzDSVZt7/LN9FFbTNfQXjD+E=;
	b=doxr6a1wX8X5iaOzQiPhydJwWmHv0ccNI25NHRJfUCVhtsEjUOZ/RDosFbqFjH/P
	aRX1kxR2aLv380m9d4AMNpIOMAezvXWXNFbIBZeEecRQllxi6tUb+bBVQ5wHbbZh/Us
	dj6obVhyIe/ptIV+XIt1ga9RfazDxceggz+dUtdg=
Content-Type: multipart/mixed; boundary="===============3911993020234296865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.11 SUCCEEDED
Message-ID: 
 <010101826c99fe6e-10242d92-5556-4eb3-8adb-5297593c6809-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168923

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.10-1.26.11.patch
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
--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-956adf0d410809fd3e17e18e9ffa2cb479829ee9"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:956adf0d410809fd3e17e18e9ffa2cb479829ee9"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 6 Mirrors 0 Missed 44 Current 347 (12% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1156 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_fetch)
NOTE: Running task 1157 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1177 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_fetch)
NOTE: Running task 1181 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1213 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1237 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1238 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1239 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1240 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1242 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1243 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1244 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1396 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_unpack)
NOTE: Running task 1399 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1400 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_unpack)
NOTE: Running task 1401 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1404 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1405 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1409 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1410 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1411 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1412 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1413 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1414 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1415 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1416 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: Running task 1418 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1419 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1420 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_patch)
NOTE: Running task 1421 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 1422 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1423 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_patch)
NOTE: Running task 1425 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1427 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1428 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1429 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Succeeded
NOTE: Running task 1433 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure)
NOTE: Running task 1447 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic unihash changed to 544fc88d3396e441700392ee0f73afb8512d168f8dbb6c0e7906fbf44057fcf5
NOTE: Running task 1448 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1450 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: Running task 1451 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1452 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_configure)
NOTE: Running task 1453 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1454 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1455 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1460 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_compile)
NOTE: Running task 1462 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1464 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1465 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1466 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1467 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1468 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Succeeded
NOTE: Running task 1473 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Started
NOTE: Running task 1474 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1477 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1478 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1479 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Started
NOTE: Running task 1481 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package)
NOTE: Running task 1482 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1485 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1486 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1488 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1490 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1491 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1492 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1495 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1496 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1497 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1498 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Succeeded
NOTE: Running task 1499 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1500 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: Running task 1502 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1504 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: Running task 1505 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_write_rpm)
NOTE: Running task 1506 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_qa)
NOTE: Running task 1507 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1508 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1510 tasks of which 1384 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.50.1-r0/temp/log.do_packagedata.2052431
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata) failed with exit code '1'

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-956adf0d410809fd3e17e18e9ffa2cb479829ee9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:956adf0d410809fd3e17e18e9ffa2cb479829ee9"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 6 Mirrors 0 Missed 44 Current 347 (12% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1156 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_fetch)
NOTE: Running task 1157 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1177 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_fetch)
NOTE: Running task 1179 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1213 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1238 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1240 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1241 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1242 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1243 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1244 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1245 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1396 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_unpack)
NOTE: Running task 1400 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_unpack)
NOTE: Running task 1401 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1404 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1405 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1409 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1410 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1411 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1412 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1413 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1414 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1415 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Started
NOTE: Running task 1417 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1418 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: Running task 1420 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1421 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1422 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1423 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1424 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_patch)
NOTE: Running task 1426 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 1427 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1428 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1429 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1431 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1433 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic)
NOTE: Running task 1439 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1443 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1444 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic unihash changed to 544fc88d3396e441700392ee0f73afb8512d168f8dbb6c0e7906fbf44057fcf5
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: Running task 1446 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1448 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_configure)
NOTE: Running task 1450 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1452 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1453 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1454 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: Running task 1455 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: Running task 1456 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1463 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1464 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Started
NOTE: Running task 1465 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: Running task 1466 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1467 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1468 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1473 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1478 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install)
NOTE: Running task 1479 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1480 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Started
NOTE: Running task 1481 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: Running task 1482 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Started
NOTE: Running task 1483 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1485 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1486 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1488 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1490 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1491 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1493 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: Running task 1494 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1497 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: Running task 1498 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1499 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: Running task 1500 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1503 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1504 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_write_rpm)
NOTE: Running task 1505 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_qa)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1506 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1508 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1510 tasks of which 1384 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.50.1-r0/temp/log.do_packagedata.2013336
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata) failed with exit code '1'

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.10/site-packages/urllib3-1.26.10.dist-info moved to /usr/lib/python3.10/site-packages/urllib3-1.26.11.dist-info

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.10.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.11.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.10" to "1.26.11"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 732022 to 735383 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.10 [default] to 1.26.11 [default]
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.10/site-packages/urllib3-1.26.10.dist-info moved to /usr/lib/python3.10/site-packages/urllib3-1.26.11.dist-info

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-956adf0d410809fd3e17e18e9ffa2cb479829ee9"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:956adf0d410809fd3e17e18e9ffa2cb479829ee9"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 6 Mirrors 0 Missed 44 Current 347 (12% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1155 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1157 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_fetch)
NOTE: Running task 1177 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_fetch)
NOTE: Running task 1181 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1213 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1238 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1239 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1240 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1241 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1242 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1243 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1245 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1395 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1399 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_unpack)
NOTE: Running task 1400 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_unpack)
NOTE: Running task 1401 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1404 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1405 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1409 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1410 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1411 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1412 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1413 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1414 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1415 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1416 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1417 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1419 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1420 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_patch)
NOTE: Running task 1421 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1422 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1423 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1424 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1425 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: Running task 1426 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1427 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1428 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1430 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Started
NOTE: Running task 1431 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1435 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1436 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic)
NOTE: Running task 1437 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1441 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1442 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1445 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic unihash changed to 544fc88d3396e441700392ee0f73afb8512d168f8dbb6c0e7906fbf44057fcf5
NOTE: Running task 1446 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1448 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: Running task 1450 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1451 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1452 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1453 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1454 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: Running task 1455 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Succeeded
NOTE: Running task 1456 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1458 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: Running task 1460 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1461 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: Running task 1462 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1463 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Started
NOTE: Running task 1464 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1465 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1466 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile)
NOTE: Running task 1467 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1468 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_install)
NOTE: Running task 1473 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1476 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1477 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1480 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: Running task 1481 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package)
NOTE: Running task 1482 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1485 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1486 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1488 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1490 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1491 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_package)
NOTE: Running task 1493 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1496 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1497 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1498 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1499 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1500 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1501 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1503 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1505 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_write_rpm)
NOTE: Running task 1506 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_qa)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1507 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1508 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Started
NOTE: Running task 1510 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1510 tasks of which 1384 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.50.1-r0/temp/log.do_packagedata.2082074
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata) failed with exit code '1'

--===============3911993020234296865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.10-1.26.11.patch"

RnJvbSA3Njc4YzI0ZmI5ZGQ5YzBhNjQyYjI1YjgxYTAxZGU0M2RjZTM2Y2Q3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjozNToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjEwIC0+IDEuMjYuMTEKCi0tLQogLi4uL3tweXRo
b24zLXVybGxpYjNfMS4yNi4xMC5iYiA9PiBweXRob24zLXVybGxpYjNfMS4yNi4xMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzEuMjYuMTAu
YmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTEuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTEuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMS4yNi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMS5iYgppbmRleCBhOGUyMDczZDcxLi5h
OGQ0N2RlMGY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJsbGliM18xLjI2LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cmxsaWIzXzEuMjYuMTEuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9zaGF6b3cvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODc5YmE0ZDFlODk2NTRkOTc2
OWNlMTMxMjFlMGY5NDMxMGVhMzJlOGQyZjhjZjU4N2I3N2MwOGJiY2RiMzBkNiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJlYTZlOGZiMjEwYjE5ZDk1MGZhYjkzYjYwYzkwMDkyMjZjNjNhMjg4MDhi
YzgzODZlMDUzMDFlMjU4ODNhYzBhIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAK
Mi4zMS4xCgo=

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-956adf0d410809fd3e17e18e9ffa2cb479829ee9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:956adf0d410809fd3e17e18e9ffa2cb479829ee9"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 221 Local 177 Mirrors 0 Missed 44 Current 192 (80% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 207 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running task 828 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_fetch)
NOTE: Running task 829 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 830 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_fetch)
NOTE: Running task 831 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 832 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 836 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 837 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 838 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 839 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 840 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 841 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 842 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 896 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 898 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_unpack)
NOTE: Running task 899 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 900 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 901 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 902 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 903 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 904 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 905 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 906 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 907 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: Running setscene task 251 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_setscene)
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 254 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 911 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_patch)
NOTE: Running task 912 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 914 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_patch)
NOTE: Running task 919 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 920 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 926 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 927 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 928 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 929 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 930 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 931 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 947 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 949 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 950 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 951 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 952 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 953 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 954 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 956 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 957 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic unihash changed to 544fc88d3396e441700392ee0f73afb8512d168f8dbb6c0e7906fbf44057fcf5
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 980 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_package_setscene)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 302 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 331 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 365 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1399 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1411 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1461 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1500 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure)
NOTE: Running task 1503 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1504 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1505 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Started
NOTE: Running task 1506 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1507 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1508 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1509 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Started
NOTE: Running task 1510 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1513 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1515 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1516 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_compile)
NOTE: Running task 1517 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1518 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: Running task 1519 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1521 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1522 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1523 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1524 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Started
NOTE: Running task 1525 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: Running task 1529 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1531 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Succeeded
NOTE: Running task 1532 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1533 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1534 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1535 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1536 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Started
NOTE: Running task 1537 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package)
NOTE: Running task 1538 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: Running task 1542 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1543 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Succeeded
NOTE: Running task 1544 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: Running task 1546 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1547 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1548 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: Running task 1550 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1551 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1553 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1554 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: Running task 1555 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1556 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: Running task 1558 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1559 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: Running task 1560 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_write_rpm)
NOTE: Running task 1561 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_qa)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1562 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1564 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1565 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Succeeded
NOTE: Running task 1566 of 1575 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1566 tasks of which 1440 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.50.1-r0/temp/log.do_packagedata.2188184
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata) failed with exit code '1'

--===============3911993020234296865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-956adf0d410809fd3e17e18e9ffa2cb479829ee9"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:956adf0d410809fd3e17e18e9ffa2cb479829ee9"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 6 Mirrors 0 Missed 44 Current 347 (12% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1155 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_fetch)
NOTE: Running task 1157 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1177 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_fetch)
NOTE: Running task 1181 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1213 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1238 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1240 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1241 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1242 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1243 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1244 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1245 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1395 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_unpack)
NOTE: Running task 1399 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1400 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_unpack)
NOTE: Running task 1401 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1404 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1405 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1409 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1410 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1411 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1412 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1413 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1414 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1415 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1416 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: Running task 1418 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1419 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1420 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1421 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_patch)
NOTE: Running task 1422 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1423 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1424 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: Running task 1425 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1426 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1428 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1429 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1430 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1431 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1436 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic)
NOTE: Running task 1437 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1440 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1444 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_lic: Succeeded
NOTE: Running task 1445 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_lic unihash changed to 544fc88d3396e441700392ee0f73afb8512d168f8dbb6c0e7906fbf44057fcf5
NOTE: recipe python3-urllib3-1.26.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1447 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: Running task 1448 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: Running task 1449 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1450 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1451 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: Running task 1453 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1454 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: Running task 1455 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1456 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: Running task 1458 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1459 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_configure_ptest_base)
NOTE: Running task 1460 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1463 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1464 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Started
NOTE: Running task 1465 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1466 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1467 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1468 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Started
NOTE: Running task 1472 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1474 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_compile_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install)
NOTE: Running task 1477 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package)
NOTE: Running task 1478 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1479 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1481 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Started
NOTE: Running task 1482 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1484 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: Running task 1486 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1488 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_install_ptest_base)
NOTE: Running task 1490 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1492 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1493 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1494 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1495 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1497 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: Running task 1498 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1500 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: Running task 1502 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: Running task 1503 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: Running task 1504 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1505 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: Running task 1506 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb:do_package_qa)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1507 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1508 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_qa: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_package: Succeeded
NOTE: Running task 1509 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: Running task 1510 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1511 of 1519 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.50.1-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1511 tasks of which 1384 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.1-r0 to 0:6.50.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.50.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.50.1-r0/temp/log.do_packagedata.2135992
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.50.1.bb:do_packagedata) failed with exit code '1'

--===============3911993020234296865==--

