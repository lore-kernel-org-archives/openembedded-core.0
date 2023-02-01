Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AA2C77B74
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30000.1675272853928444061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TzSP30TW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b1e43-9730dad5-75ee-470c-a94b-dde9407dc18f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mbJqHP6WyPbHRIo359qwiR0zoOPdNumoWYXOKmsK2jU=;
	b=TzSP30TWt4jAWlxNyNe+SVE9BF8KSvaDNoKfuywcXe/z5tGnG/MZSXmfjeVt9Jzz
	dQddX8FRG6tN2myngXW912+qxQaJhx3dmhpp5FfrAR11S8z7EADaGEzosPXV3saN9R/
	90OUolpcSQ7nE81NyrTIH+KtSCO9I4f1BXURZxDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mbJqHP6WyPbHRIo359qwiR0zoOPdNumoWYXOKmsK2jU=;
	b=bctWt7HGppbYf4zwf6npsGTU2NixZjCxOCoIelzYekLwuMc6L2h5iXdhuyfyDI7S
	0FWpWfrLzUIBJFre+przCMCU5tYFiilsFpcbaoAYVYp76lvMsL5CyK8tPk/YMtGg6W6
	ru8ghX836SLkmrpt5iao0AGPhHBhinEjOb5S8B8o=
Content-Type: multipart/mixed; boundary="===============2930623801249419674=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 23.0.0 SUCCEEDED
Message-ID: <010101860e0b1e43-9730dad5-75ee-470c-a94b-dde9407dc18f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176599

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *23.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-22.1.0-23.0.0.patch
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
--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:18ca0a0675a2a58f3c143e321f8d08cb5b6187cd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 5 Mirrors 0 Missed 48 Current 331 (9% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 1004 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1137 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_fetch)
NOTE: Running task 1138 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_fetch)
NOTE: Running task 1156 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1183 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1200 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1201 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1202 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1204 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1205 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1206 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1336 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Started
NOTE: Running task 1337 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: Running task 1338 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1340 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1341 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_unpack)
NOTE: Running task 1344 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: Running task 1346 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1347 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_unpack)
NOTE: Running task 1348 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1350 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Started
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1352 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1353 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1354 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1355 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1356 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1357 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1358 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 1359 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1360 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1361 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_patch)
NOTE: Running task 1362 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1363 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1364 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1365 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: Running task 1366 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1367 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1368 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1369 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1370 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic unihash changed to 1d0ef5238f9f986f359122ea96a3cc7f4ec47d08f74ce5927b14f9cedbc028ef
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1372 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1376 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: Running task 1377 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1378 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1380 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1381 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1382 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1383 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1384 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1386 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Started
NOTE: Running task 1387 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Succeeded
NOTE: Running task 1388 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1389 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1390 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1391 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1392 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: Running task 1393 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1395 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1396 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: Running task 1397 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1398 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: Running task 1399 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1403 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1405 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1406 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1407 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1408 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Succeeded
NOTE: Running task 1409 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1410 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1411 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1413 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1414 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: Running task 1415 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Succeeded
NOTE: Running task 1416 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1417 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1418 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install_ptest_base)
NOTE: Running task 1419 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Started
NOTE: Running task 1421 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1422 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1423 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1426 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1427 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1428 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Succeeded
NOTE: Running task 1429 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1429 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.62.0-r0/temp/log.do_packagedata.2875552
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata) failed with exit code '1'

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-32 sysroot...done.
Removing 47 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:18ca0a0675a2a58f3c143e321f8d08cb5b6187cd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 208 Local 145 Mirrors 0 Missed 63 Current 190 (69% match, 84% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 232 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 678 of 1528 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.0.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 715 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 716 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 717 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 718 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 734 of 1528 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.0.bb:do_rust_gen_targets)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.67.0-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-native-1.67.0-r0: task do_rust_gen_targets: Started
NOTE: recipe rust-native-1.67.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 267 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.67.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 268 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 752 of 1528 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.0.bb:do_compile)
NOTE: Running task 753 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_unpack)
NOTE: Running task 765 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: Running task 779 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 807 of 1528 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_rust_gen_targets)
NOTE: Running task 832 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 833 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_fetch)
NOTE: Running task 834 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_fetch)
NOTE: Running task 835 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 836 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 840 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 841 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 842 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 843 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 844 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 845 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.67.0-r0: task do_compile: Started
NOTE: Running task 903 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_unpack)
NOTE: Running task 906 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_unpack)
NOTE: Running task 907 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 908 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Started
NOTE: Running task 909 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 910 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 911 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 912 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: Running task 913 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 914 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 919 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 920 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 925 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 927 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 928 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Succeeded
NOTE: Running task 929 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 930 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: Running task 931 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_patch)
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 933 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: Running task 934 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 935 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: Running task 936 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 281 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: Running task 949 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 951 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: Running task 954 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 956 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 957 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 958 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 959 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 287 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic unihash changed to 1d0ef5238f9f986f359122ea96a3cc7f4ec47d08f74ce5927b14f9cedbc028ef
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 298 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: Running task 984 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 985 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 315 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 990 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 991 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 992 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1034 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.67.0-r0: task do_compile: Succeeded
NOTE: Running task 1063 of 1528 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.0.bb:do_install)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.67.0-r0: task do_install: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1251 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1252 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1345 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1367 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1368 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1369 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1398 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1400 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1402 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1403 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: Running task 1406 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1407 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1408 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Succeeded
NOTE: Running task 1410 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure_ptest_base)
NOTE: Running task 1412 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1413 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1415 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1416 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: Running task 1417 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1419 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1420 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Succeeded
NOTE: Running task 1421 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile_ptest_base)
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1423 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: Running task 1424 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: Running task 1425 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Started
NOTE: Running task 1426 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 1430 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: Running task 1431 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1432 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1433 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install)
NOTE: Running task 1434 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Succeeded
NOTE: Running task 1436 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1437 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1438 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1439 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Started
NOTE: Running task 1440 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1441 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Succeeded
NOTE: Running task 1442 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1444 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Running task 1447 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_patch: Started
NOTE: Running task 1448 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: Running task 1449 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_rust_gen_targets)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Succeeded
NOTE: Running task 1453 of 1528 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Failed
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe rust-native-1.67.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1453 tasks of which 1318 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.62.0-r0/temp/log.do_packagedata.2944836
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata) failed with exit code '1'

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:18ca0a0675a2a58f3c143e321f8d08cb5b6187cd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 5 Mirrors 0 Missed 48 Current 331 (9% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 1004 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1140 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_fetch)
NOTE: Running task 1141 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_fetch)
NOTE: Running task 1156 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1183 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1203 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1204 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1205 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1206 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1207 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1209 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1336 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: Running task 1337 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: Running task 1338 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_unpack)
NOTE: Running task 1340 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: Running task 1342 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1343 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_unpack)
NOTE: Running task 1344 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1345 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1346 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1347 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1348 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1349 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1350 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1352 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1353 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1354 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1356 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Started
NOTE: Running task 1357 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1361 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1363 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1364 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1365 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1366 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: Running task 1367 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1368 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Started
NOTE: Running task 1370 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic unihash changed to 1d0ef5238f9f986f359122ea96a3cc7f4ec47d08f74ce5927b14f9cedbc028ef
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1374 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1377 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1378 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1380 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1381 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1382 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1383 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1384 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1385 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1386 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1388 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: Running task 1389 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1391 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1392 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: Running task 1393 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1394 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: Running task 1395 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1396 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: Running task 1397 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1398 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile)
NOTE: Running task 1399 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1403 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1405 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Succeeded
NOTE: Running task 1406 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install)
NOTE: Running task 1408 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1409 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: Running task 1410 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1411 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1413 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: Running task 1414 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Succeeded
NOTE: Running task 1415 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1417 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1418 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Succeeded
NOTE: Running task 1419 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1420 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1421 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1425 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1426 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: Running task 1427 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Succeeded
NOTE: Running task 1428 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Started
NOTE: Running task 1429 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1429 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.62.0-r0/temp/log.do_packagedata.2750217
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata) failed with exit code '1'

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyopenssl: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-22.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.0.0.tar.gz"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "22.1.0" to "23.0.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 22.1.0 [default] to 23.0.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 510328 to 513565 (+1%)
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "22.1.0" to "23.0.0"
Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-22.1.0.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.0.0.dist-info

--===============2930623801249419674==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-22.1.0-23.0.0.patch"

RnJvbSAzMDg0NWVmODc0OWExZDg1OWY2MTgwMTllNzQ3OTZjYTA4YTYzNjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMjoyOTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDIyLjEuMCAtPiAyMy4wLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzIyLjEuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yMy4wLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjIuMS4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzIzLjAuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIyLjEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjMuMC4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjIuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjAuMC5iYgppbmRleCA0ZDgzYjhj
N2Q3Li44MjJkMjFhNThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzIyLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjAuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgJHtQWVRIT05fUE59LWNyeXB0b2dyYXBo
eSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhODNiN2IyNzJkZDU5NTIyMmQ2NzJmNWNlMjlh
YTAzMGYxZmI4Mzc2MzBlZjIyOWY2MmU3MmUzOTVjZTg5NjgiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYzFjYzVmODZiY2FjZWZjODRkYWRhN2QzMTE3NWNhZTFiMTUxOGQ1ZjYwZDNkMGJiNTk1YTY3
ODIyYTg2OGE2ZiIKIAogUFlQSV9QQUNLQUdFID0gInB5T3BlblNTTCIKIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwotLSAKMi4zNy4zCgo=

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1699 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:18ca0a0675a2a58f3c143e321f8d08cb5b6187cd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 5 Mirrors 0 Missed 48 Current 331 (9% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 1004 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1140 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_fetch)
NOTE: Running task 1141 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_fetch)
NOTE: Running task 1156 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1183 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1203 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1204 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1205 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1206 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1207 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1208 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1336 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Started
NOTE: Running task 1337 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1338 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1340 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1341 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1342 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_unpack)
NOTE: Running task 1344 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1345 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_unpack)
NOTE: Running task 1346 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: Running task 1348 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1350 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1352 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1353 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1354 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1355 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: Running task 1359 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1360 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 1361 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1362 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1364 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 1365 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1366 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1367 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1368 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic unihash changed to 1d0ef5238f9f986f359122ea96a3cc7f4ec47d08f74ce5927b14f9cedbc028ef
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1374 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1376 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1377 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1378 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1380 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1381 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1382 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1383 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1384 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1385 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: Running task 1386 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Succeeded
NOTE: Running task 1388 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1389 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1390 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1391 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1392 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1393 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1396 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1398 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile)
NOTE: Running task 1399 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1403 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1405 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1406 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1407 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1408 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1409 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Succeeded
NOTE: Running task 1410 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1411 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1413 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1414 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1415 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1416 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1418 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1419 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1420 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1421 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1423 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1424 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1425 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1426 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1427 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Succeeded
NOTE: Running task 1428 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1429 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1429 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.62.0-r0/temp/log.do_packagedata.2705850
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata) failed with exit code '1'

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:18ca0a0675a2a58f3c143e321f8d08cb5b6187cd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 5 Mirrors 0 Missed 48 Current 331 (9% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_fetch)
NOTE: Running task 1004 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_fetch)
NOTE: Running task 1106 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1140 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_fetch)
NOTE: Running task 1141 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_fetch)
NOTE: Running task 1156 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1183 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1204 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1205 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1206 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1207 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1208 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1209 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1336 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Started
NOTE: Running task 1337 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Started
NOTE: Running task 1338 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1341 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1344 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_unpack)
NOTE: Running task 1345 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1346 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1347 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1348 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1350 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1351 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1352 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1353 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1354 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1355 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Started
NOTE: Running task 1358 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1359 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: Running task 1360 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1361 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1364 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1365 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1366 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1367 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: Running task 1368 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: Running task 1369 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_populate_lic unihash changed to 1d0ef5238f9f986f359122ea96a3cc7f4ec47d08f74ce5927b14f9cedbc028ef
NOTE: recipe libstd-rs-1.67.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1373 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1374 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1376 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1377 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1378 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1380 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1382 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1384 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1385 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1386 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1387 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure: Succeeded
NOTE: Running task 1388 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1390 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_configure_ptest_base)
NOTE: Running task 1391 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1393 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1394 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1395 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 1396 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1397 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1398 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1399 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1403 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile: Succeeded
NOTE: Running task 1405 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1406 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1407 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Started
NOTE: Running task 1408 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: Running task 1409 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_compile: Succeeded
NOTE: Running task 1410 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1411 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install)
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1413 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1414 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: Running task 1416 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1417 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1418 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7-r0: task do_install: Succeeded
NOTE: Running task 1419 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1421 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1422 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1423 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Started
NOTE: Running task 1424 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1426 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1427 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1428 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: Running task 1429 of 1481 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.62.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.7-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1429 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.65.2-r0 to 0:6.62.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.62.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.62.0-r0/temp/log.do_packagedata.2811099
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.62.0.bb:do_packagedata) failed with exit code '1'

--===============2930623801249419674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-22.1.0.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.0.0.dist-info

--===============2930623801249419674==--

