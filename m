Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71535C64E7C
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.24558.1665871392776365023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VxUFfIbI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac346f-879db136-9cc7-4c6e-8eb3-fdd6e46a4fb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VzDtOPhzWzI7ve1IAnmk0UJgAlvBvBxD2VYgwhpUJqQ=;
	b=VxUFfIbIa56Ddj7C+/0N09SsYqxMjrDuYojLaLTNjiR0HY7ab9aI19u89gI3fvLF
	eY096o14RnO7jqJhAXjWofnBt7Ma03pI0zQIGVP0AoGCVertzVvRdie8fnSTkyTAXZc
	hEBoNg8YUb0RFXFdAfRIrviopKz9bBlsnbsv43iM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VzDtOPhzWzI7ve1IAnmk0UJgAlvBvBxD2VYgwhpUJqQ=;
	b=VhmX/KI2sb0pxi/RS51WOCcZc56uo7TRb5DJx3R3O2uOhKJknxEe8IA8V404oMpu
	jwGq5Alpe82txx4trirPffJXV5IKqMpgQCp9imfUHK59cxHQrcZC1Fuoj1PsSVjomgj
	XXs4p2sNP+LW2NHYkUdGCpOVHzBB9p/EFm3Viwws=
Content-Type: multipart/mixed; boundary="===============5640793129590434772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 22.1.0 SUCCEEDED
Message-ID: <01010183ddac346f-879db136-9cc7-4c6e-8eb3-fdd6e46a4fb6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171787

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *22.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-22.0.0-22.1.0.patch
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
--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.10/site-packages/pyOpenSSL-22.0.0.dist-info moved to /usr/lib/python3.10/site-packages/pyOpenSSL-22.1.0.dist-info

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:102e65013aff71edc0ee37640493bb57df74191f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 7 Mirrors 0 Missed 40 Current 337 (14% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 384 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1147 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1149 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1169 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1203 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1223 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1224 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1225 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1227 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1228 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1229 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1230 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1356 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-poetry-core-native-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1358 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1359 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1360 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1361 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1363 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1364 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1368 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1369 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1370 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1371 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1372 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1373 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1374 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1375 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1382 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1383 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1385 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1386 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1389 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1390 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1392 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1393 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1394 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1395 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1396 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1397 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1398 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1402 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1403 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic)
NOTE: Running task 1405 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1407 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1408 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1409 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1410 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1412 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1413 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic unihash changed to bbc7a40503f3c37087a51d59d54ec07b3416c95d837d46ba4e8ba38c8488cec5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1414 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1415 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1416 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1417 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1418 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: Running task 1419 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1420 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1421 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: Running task 1422 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: Running task 1423 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1424 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1427 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1429 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: Running task 1430 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1431 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1432 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1438 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1442 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: Running task 1443 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1444 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1448 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1450 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: Running task 1453 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: Running task 1454 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1455 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: Running task 1457 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: Running task 1458 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1459 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1460 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1463 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1464 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1465 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_qa)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1466 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1467 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-iso8601/1.0.2-r0/temp/log.do_packagedata.1480829
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata) failed with exit code '1'

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:102e65013aff71edc0ee37640493bb57df74191f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata_setscene)
NOTE: Running task 1148 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1149 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1169 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1203 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1224 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1225 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1226 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1227 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1228 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1229 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1230 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1365 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1367 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1368 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1369 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1370 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1373 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1376 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1377 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1378 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1379 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1380 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1381 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1382 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1383 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1385 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1386 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 1388 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1389 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1390 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1391 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1393 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1394 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1396 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1397 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1400 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1403 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1405 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic)
NOTE: Running task 1406 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1407 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1408 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1409 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: Running task 1411 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic unihash changed to bbc7a40503f3c37087a51d59d54ec07b3416c95d837d46ba4e8ba38c8488cec5
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1414 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: Running task 1415 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1416 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1417 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1418 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: Running task 1419 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1420 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1421 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1422 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: Running task 1423 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1424 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: Running task 1426 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1427 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1429 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1430 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: Running task 1431 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1432 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1438 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1441 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1443 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1445 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1448 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1450 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: Running task 1451 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1453 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: Running task 1454 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1455 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1456 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: Running task 1458 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: Running task 1459 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: Running task 1460 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1462 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 1463 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1464 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_qa)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1465 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Started
NOTE: Running task 1466 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1468 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-iso8601/1.0.2-r0/temp/log.do_packagedata.1499606
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata) failed with exit code '1'

--===============5640793129590434772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-22.0.0-22.1.0.patch"

RnJvbSAwY2I1YTI5MjRmMDAyMzY2OTQwODYzMDlhZGRiNTc3NTk1MTFhMTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6NTY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyMi4wLjAgLT4gMjIuMS4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yMi4wLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjIuMS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzIyLjAu
MC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yMi4xLjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMi4wLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIyLjEuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIyLjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMi4xLjAuYmIKaW5kZXggZGIwZTgw
OWVmNS4uNGQ4M2I4YzdkNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yMi4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMi4xLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsICR7UFlUSE9OX1BOfS1jcnlwdG9ncmFw
aHkiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2NjBiMWIxNDI1YWFjNGExYmVhMWQ5NDE2OGE4
NWQ5OWYwYjMxNDRjODY5ZGQ0MzkwZDI3NjI5ZDAwODdmMWJmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjdhODNiN2IyNzJkZDU5NTIyMmQ2NzJmNWNlMjlhYTAzMGYxZmI4Mzc2MzBlZjIyOWY2MmU3
MmUzOTVjZTg5NjgiCiAKIFBZUElfUEFDS0FHRSA9ICJweU9wZW5TU0wiCiBpbmhlcml0IHB5cGkg
c2V0dXB0b29sczMKLS0gCjIuMzEuMQoK

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:102e65013aff71edc0ee37640493bb57df74191f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata_setscene)
NOTE: Running task 1150 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1151 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1169 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1203 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1227 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1229 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1230 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1231 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1232 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1233 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1234 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1365 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1367 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1368 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1369 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1370 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1373 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1376 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1377 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1378 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1380 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1381 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1382 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1383 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: Running task 1384 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1385 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1386 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: Running task 1387 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1388 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1389 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1390 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1392 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1393 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1394 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1395 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1396 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1397 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: Running task 1398 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1400 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1404 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1406 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1407 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1409 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1410 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic unihash changed to bbc7a40503f3c37087a51d59d54ec07b3416c95d837d46ba4e8ba38c8488cec5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: Running task 1414 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1415 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1417 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1418 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: Running task 1419 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: Running task 1420 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1421 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1422 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1424 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1426 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1427 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: Running task 1428 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1429 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: Running task 1430 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1431 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1432 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1436 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1437 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1438 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1439 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1441 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: Running task 1443 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1445 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: Running task 1446 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: Running task 1450 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1451 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1453 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1454 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1455 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1456 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1457 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1458 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: Running task 1459 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1460 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1461 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: Running task 1462 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_qa)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1464 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1465 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: Running task 1466 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1467 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1468 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-iso8601/1.0.2-r0/temp/log.do_packagedata.1509344
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata) failed with exit code '1'

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:102e65013aff71edc0ee37640493bb57df74191f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 6 Mirrors 0 Missed 40 Current 338 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata_setscene)
NOTE: Running task 1147 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1148 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1169 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1203 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1224 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 1225 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1226 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1227 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1228 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1229 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1230 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1365 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1367 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1368 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1369 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1370 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1373 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 1376 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1377 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1378 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1379 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1380 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1381 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1382 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1383 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: Running task 1385 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1386 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1388 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1390 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1392 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1393 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1396 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1397 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1398 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1400 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1401 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1409 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1410 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic unihash changed to bbc7a40503f3c37087a51d59d54ec07b3416c95d837d46ba4e8ba38c8488cec5
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: Running task 1413 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: Running task 1414 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1415 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1417 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1418 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1419 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: Running task 1420 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1421 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1422 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: Running task 1424 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1425 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1427 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1428 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1429 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1430 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1431 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1432 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1436 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1438 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1442 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: Running task 1445 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: Running task 1450 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1451 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: Running task 1453 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1454 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1455 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1456 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1457 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: Running task 1459 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1460 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1462 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1464 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_qa)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: Running task 1465 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: Running task 1466 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1468 of 1479 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-iso8601/1.0.2-r0/temp/log.do_packagedata.1489839
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata) failed with exit code '1'

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-32 sysroot...done.
Removing 52 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:102e65013aff71edc0ee37640493bb57df74191f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 169 Mirrors 0 Missed 40 Current 191 (80% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running task 839 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 840 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 841 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 842 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 846 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_fetch)
NOTE: Running task 847 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 848 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 849 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 850 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 851 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 852 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 907 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 908 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 909 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 910 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 911 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_unpack)
NOTE: Running task 912 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 913 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 914 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 915 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 916 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 247 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_package_setscene)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 920 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 921 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 922 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 924 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 927 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_patch)
NOTE: Running task 929 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 930 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 931 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 932 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 933 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 947 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.2-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 949 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic)
NOTE: Running task 951 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 954 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 956 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 957 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_lic unihash changed to bbc7a40503f3c37087a51d59d54ec07b3416c95d837d46ba4e8ba38c8488cec5
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 979 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 285 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 304 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 306 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 381 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1380 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1381 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1429 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1466 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1469 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1470 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1471 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1473 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1474 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1475 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1476 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1477 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1478 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.2-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Started
NOTE: Running task 1481 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1483 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: Running task 1486 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1488 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1489 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1492 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: Running task 1493 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1495 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1496 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1499 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1500 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: Running task 1501 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-psutil-5.9.2-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: Running task 1504 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1506 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1507 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.2.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: Running task 1510 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Started
NOTE: Running task 1511 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: Running task 1514 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: Running task 1516 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: Running task 1517 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1519 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1520 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_qa)
NOTE: Running task 1521 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1523 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1524 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.2-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1524 tasks of which 1411 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:1.1.0-r0 to 0:1.0.2-r0) [version-going-backwards]
ERROR: python3-iso8601-1.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-iso8601/1.0.2-r0/temp/log.do_packagedata.1524481
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata) failed with exit code '1'

--===============5640793129590434772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyopenssl: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-22.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-22.1.0.tar.gz"
packages/core2-32-poky-linux/python3-pyopenssl: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "22.0.0" to "22.1.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 22.0.0 [default] to 22.1.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 401928 to 414267 (+3%)
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "22.0.0" to "22.1.0"
Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.10/site-packages/pyOpenSSL-22.0.0.dist-info moved to /usr/lib/python3.10/site-packages/pyOpenSSL-22.1.0.dist-info

--===============5640793129590434772==--

