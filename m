Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62944C77B72
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.10296.1676508397787035646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nNdM4Bjl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657affd28-1813cc04-7b8c-416c-81a2-ddabb7eaa0d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1f6uzB+Kpd8cPZL9mTIkYD0XThltvJ8+HkR6Q+8oPkg=;
	b=nNdM4BjlYAAe1DWTva2Zav5VCbgpfNvJOSoPL/T8yM4LtlKD/G31QU0HH+CFN9Sd
	5fjUUjlRdmR7ZRLAQHrnLyUbLlRm4WEJAc//4SGFOcBBFMmIx+7UkTcUs5qArUQY7yZ
	KPBNFXKS+OSspEN1F69MM6L84ZXcJQcJn98tDtfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1f6uzB+Kpd8cPZL9mTIkYD0XThltvJ8+HkR6Q+8oPkg=;
	b=iO8u/HSin2gUCwiraiecFsiQfd9rSaP0VXkoaUcXesQYZbrHikkpFCdToA3B/isf
	i/WEp+qH0hmdUR9q67JrBqd1fIHpR16ZwVS3/c9TlG8xtJTb20s3nY/pkioNo2/AUaV
	CtQIGdsmzoRmZxkkfOaKI1prWTGgxjfs7u1TlKW8=
Content-Type: multipart/mixed; boundary="===============3336647026108043002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 39.0.1 SUCCEEDED
Message-ID: <0101018657affd28-1813cc04-7b8c-416c-81a2-ddabb7eaa0d8-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177255

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography* to *39.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-upgrade-39.0.0-39.0.1.patch
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
--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 72 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1ad329de136fa9ea76211f06023f7477b688496b"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ad329de136fa9ea76211f06023f7477b688496b"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 5 Mirrors 0 Missed 90 Current 351 (5% match, 79% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1008 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_fetch)
NOTE: Running task 1086 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1114 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1115 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_fetch)
NOTE: Running task 1149 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1150 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 1151 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1152 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_fetch)
NOTE: Running task 1153 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1161 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1179 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1185 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1186 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1187 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1188 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1189 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1256 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_fetch)
NOTE: Running task 1257 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1275 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1276 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1277 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_fetch)
NOTE: Running task 1278 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_fetch)
NOTE: Running task 1279 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1280 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1281 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1435 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_unpack)
NOTE: Running task 1437 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1438 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1439 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1440 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1441 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_unpack)
NOTE: Running task 1442 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1443 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1444 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1445 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_unpack)
NOTE: Running task 1446 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1447 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1448 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1450 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: Running task 1452 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Started
NOTE: Running task 1453 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: Running task 1454 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1455 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1456 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1457 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1458 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1459 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1460 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_unpack)
NOTE: Running task 1461 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1462 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Started
NOTE: Running task 1465 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1466 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_patch)
NOTE: Running task 1467 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1468 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1469 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1470 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1471 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1473 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: Running task 1474 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: Running task 1475 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1476 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1477 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_unpack)
NOTE: Running task 1478 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_unpack)
NOTE: Running task 1479 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1480 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1481 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1482 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: Running task 1483 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1484 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1485 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 1486 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Started
NOTE: Running task 1487 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: Running task 1488 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Started
NOTE: Running task 1489 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_patch)
NOTE: Running task 1490 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1491 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1492 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: Running task 1493 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: Running task 1494 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running task 1495 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1496 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1497 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1498 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1499 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1500 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1501 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1502 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1504 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_patch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1507 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1509 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1513 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1514 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1515 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1516 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1518 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1519 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Started
NOTE: Running task 1520 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1521 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1526 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1529 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Started
NOTE: Running task 1530 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1531 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure_ptest_base)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1532 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1533 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1534 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1535 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1536 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1537 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1538 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running task 1539 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1540 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1541 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1542 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1543 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: Running task 1544 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1545 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1546 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1547 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1548 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1549 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_patch)
NOTE: Running task 1551 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1552 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: Running task 1556 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: Running task 1557 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1558 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: Running task 1559 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: Running task 1560 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: Running task 1561 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: Running task 1562 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1563 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1564 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1565 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1566 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: Running task 1568 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1569 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: Running task 1570 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: Running task 1571 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1573 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: Running task 1574 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1575 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: Running task 1576 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: Running task 1577 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Started
NOTE: Running task 1578 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1579 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: Running task 1580 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1581 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Started
NOTE: Running task 1582 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: Running task 1583 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: Running task 1584 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Started
NOTE: Running task 1585 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic unihash changed to d038fcc2c352eb1054da08379567caee65661e8673116a4c925e587477931031
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1588 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1590 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1591 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1592 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1594 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile_ptest_base)
NOTE: Running task 1595 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1596 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: Running task 1598 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: Running task 1599 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1600 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: Running task 1601 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: Running task 1602 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: Running task 1603 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1604 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1605 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_install)
NOTE: Running task 1606 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1607 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: Running task 1608 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1609 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1610 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1611 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1612 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: Running task 1614 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: Running task 1615 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1617 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: Running task 1618 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1619 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1620 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1621 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1622 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1623 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1624 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package)
NOTE: Running task 1625 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: Running task 1626 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 1628 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: Running task 1629 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: Running task 1630 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1631 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1632 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1634 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1636 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: Running task 1637 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1638 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1639 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1640 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: Running task 1642 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: Running task 1643 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1644 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: Running task 1645 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1646 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1647 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1648 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1649 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1650 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1651 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package)
NOTE: Running task 1652 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1654 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1655 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: Running task 1656 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: Running task 1657 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: Running task 1659 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1660 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Started
NOTE: Running task 1661 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1662 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: Running task 1663 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1664 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1666 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: Running task 1667 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: Running task 1668 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Succeeded
NOTE: Running task 1669 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1670 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1671 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1674 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Succeeded
NOTE: Running task 1675 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1680 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1682 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1686 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_package)
NOTE: Running task 1691 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_install)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1698 tasks of which 1408 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography-vectors/39.0.0-r0/temp/log.do_packagedata.2478076
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata) failed with exit code '1'

--===============3336647026108043002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-upgrade-39.0.0-39.0.1.patch"

RnJvbSAyMjZkZjE1NTViYjkyZTFmZmViMDgzMjJlZDRmMzllYmIzMmM5NjMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6NTg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeTogdXBncmFkZSAzOS4wLjAgLT4gMzkuMC4xCgotLS0KIC4uLm4z
LWNyeXB0b2dyYXBoeV8zOS4wLjAuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHlfMzkuMC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3J5cHRvZ3JhcGh5
XzM5LjAuMC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeV8zOS4wLjEuYmJ9ICg5NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eV8zOS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5XzM5LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5XzM5LjAuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8z
OS4wLjEuYmIKaW5kZXggY2NhMTkyYmM4NC4uYWJjOGQ4ZTBlZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8zOS4wLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeV8zOS4w
LjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWJmNDA1YTgwNTZhNjY0N2U3ZDA3N2IwZTdiYzM2YWJhIFwKICAgICAgICAgICAgICAgICAg
ICAiCiBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmOTY0
YzdkY2Y3ODAyZDEzM2U4ZGJkMTU2NTkxNGZhMDE5NGY5ZDY4M2Q4MjQxMTk4OTg4OWVjZDcwMWU4
YWRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQxZjYxOThlZTZkOTE0ODQwNWU0OTg4NzgwMzkw
N2ZlODk2MmEyM2U2YzZmODNlYTdkOThmMWMwZGUzNzU2OTUiCiAKIFNSQ19VUkkgKz0gIlwKICAg
ICBmaWxlOi8vMDAwMi1DYXJnby50b21sLWVkaXRpb24tMjAxOC0yMDIxLnBhdGNoIFwKLS0gCjIu
MzcuMwoK

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-39.0.0.tar.gz file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/asn1/0.13.0 crate://crates.io/asn1_derive/0.13.0 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bumpalo/3.10.0 crate://crates.io/cc/1.0.78 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.23 crate://crates.io/codespan-reporting/0.11.1 crate://crates.io/core-foundation-sys/0.8.3 crate://crates.io/cxx/1.0.85 crate://crates.io/cxx-build/1.0.85 crate://crates.io/cxxbridge-flags/1.0.85 crate://crates.io/cxxbridge-macro/1.0.85 crate://crates.io/iana-time-zone/0.1.53 cr
 ate://crates.io/iana-time-zone-haiku/0.1.1 crate://crates.io/indoc/0.3.6 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/js-sys/0.3.60 crate://crates.io/libc/0.2.139 crate://crates.io/link-cplusplus/1.0.8 crate://crates.io/lock_api/0.4.9 crate://crates.io/log/0.4.17 crate://crates.io/num-integer/0.1.45 crate://crates.io/num-traits/0.2.15 crate://crates.io/once_cell/1.14.0 crate://crates.io/ouroboros/0.15.5 crate://crates.io/ouroboros_macro/0.15.5 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.6 crate://crates.io/paste/0.1.18 crate://crates.io/paste-impl/0.1.18 crate://crates.io/pem/1.1.0 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-hack/0.5.20+deprecated crate://crates.io/proc-macro2/1.0.49 crate://crates.io/pyo3/0.15.2 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crat
 e://crates.io/quote/1.0.23 crate://crates.io/redox_syscall/0.2.16 crate://crates.io/scopeguard/1.1.0 crate://crates.io/scratch/1.0.3 crate://crates.io/smallvec/1.10.0 crate://crates.io/syn/1.0.107 crate://crates.io/termcolor/1.1.3 crate://crates.io/unicode-ident/1.0.6 crate://crates.io/unicode-width/0.1.10 crate://crates.io/unindent/0.1.11 crate://crates.io/version_check/0.9.4 crate://crates.io/wasm-bindgen/0.2.83 crate://crates.io/wasm-bindgen-backend/0.2.83 crate://crates.io/wasm-bindgen-macro/0.2.83 crate://crates.io/wasm-bindgen-macro-support/0.2.83 crate://crates.io/wasm-bindgen-shared/0.2.83 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.5 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-39.0.1.tar.gz file://0002-Cargo.toml-edition-2018-2021.patch file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-me
 mfree.py file://run-ptest crate://crates.io/Inflector/0.11.4 crate://crates.io/aliasable/0.1.3 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/asn1/0.13.0 crate://crates.io/asn1_derive/0.13.0 crate://crates.io/autocfg/1.1.0 crate://crates.io/base64/0.13.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bumpalo/3.10.0 crate://crates.io/cc/1.0.78 crate://crates.io/cfg-if/1.0.0 crate://crates.io/chrono/0.4.23 crate://crates.io/codespan-reporting/0.11.1 crate://crates.io/core-foundation-sys/0.8.3 crate://crates.io/cxx/1.0.85 crate://crates.io/cxx-build/1.0.85 crate://crates.io/cxxbridge-flags/1.0.85 crate://crates.io/cxxbridge-macro/1.0.85 crate://crates.io/iana-time-zone/0.1.53 crate://crates.io/iana-time-zone-haiku/0.1.1 crate://crates.io/indoc/0.3.6 crate://crates.io/indoc-impl/0.3.6 crate://crates.io/instant/0.1.12 crate://crates.io/js-sys/0.3.60 crate://crates.io/libc/0.2.139 crate://crates.io/link-cplusplus/1.0.8 crate://crates.io/lock_api/0.4.9 crate://crat
 es.io/log/0.4.17 crate://crates.io/num-integer/0.1.45 crate://crates.io/num-traits/0.2.15 crate://crates.io/once_cell/1.14.0 crate://crates.io/ouroboros/0.15.5 crate://crates.io/ouroboros_macro/0.15.5 crate://crates.io/parking_lot/0.11.2 crate://crates.io/parking_lot_core/0.8.6 crate://crates.io/paste/0.1.18 crate://crates.io/paste-impl/0.1.18 crate://crates.io/pem/1.1.0 crate://crates.io/proc-macro-error/1.0.4 crate://crates.io/proc-macro-error-attr/1.0.4 crate://crates.io/proc-macro-hack/0.5.20+deprecated crate://crates.io/proc-macro2/1.0.49 crate://crates.io/pyo3/0.15.2 crate://crates.io/pyo3-build-config/0.15.2 crate://crates.io/pyo3-macros/0.15.2 crate://crates.io/pyo3-macros-backend/0.15.2 crate://crates.io/quote/1.0.23 crate://crates.io/redox_syscall/0.2.16 crate://crates.io/scopeguard/1.1.0 crate://crates.io/scratch/1.0.3 crate://crates.io/smallvec/1.10.0 crate://crates.io/syn/1.0.107 crate://crates.io/termcolor/1.1.3 crate://crates.io/unicode-ident/1.0.6 crate://crates.io/u
 nicode-width/0.1.10 crate://crates.io/unindent/0.1.11 crate://crates.io/version_check/0.9.4 crate://crates.io/wasm-bindgen/0.2.83 crate://crates.io/wasm-bindgen-backend/0.2.83 crate://crates.io/wasm-bindgen-macro/0.2.83 crate://crates.io/wasm-bindgen-macro-support/0.2.83 crate://crates.io/wasm-bindgen-shared/0.2.83 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.5 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0"
packages/core2-32-poky-linux/python3-cryptography: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1416992 to 1416828 (-0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1545915 to 1546219 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PKGSIZE changed from 1552915 to 1552810 (-0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "39.0.0" to "39.0.1"
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 39.0.0 [default] to 39.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4136036 to 4136453 (+0%)
packages/core2-32-poky-linux/python3-cryptography/python3-cryptography: PV changed from "39.0.0" to "39.0.1"
Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.11/site-packages/cryptography-39.0.0.dist-info moved to /usr/lib/python3.11/site-packages/cryptography-39.0.1.dist-info

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1694 targets, 49 skipped, 0 masked, 0 errors.
Removing 46 recipes from the core2-32 sysroot...done.
Removing 59 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1ad329de136fa9ea76211f06023f7477b688496b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ad329de136fa9ea76211f06023f7477b688496b"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 250 Local 160 Mirrors 0 Missed 90 Current 210 (64% match, 80% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 301 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 460 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.67.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 757 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_fetch)
NOTE: Running task 798 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 811 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 812 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_fetch)
NOTE: Running task 813 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 814 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 815 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 816 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_fetch)
NOTE: Running task 817 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 819 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 823 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 827 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 828 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 829 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 830 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 831 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running setscene task 314 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 867 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_fetch)
NOTE: Running task 868 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 877 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 878 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 879 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 880 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 881 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 882 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_fetch)
NOTE: Running task 883 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_fetch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 972 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_unpack)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 974 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_unpack)
NOTE: Running task 975 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 976 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 978 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 979 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 980 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 981 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 982 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running setscene task 321 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: Running task 983 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 984 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: Running task 987 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 988 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 989 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Started
NOTE: Running task 990 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 991 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: Running task 992 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: Running task 993 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_unpack)
NOTE: Running task 994 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_unpack)
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: Running task 995 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 325 of 460 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: Running task 1001 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1002 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: Running task 1003 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: Running task 1012 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: Running task 1013 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_patch)
NOTE: Running task 1014 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1016 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1017 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1018 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: Running task 1019 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1020 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1026 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1027 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1028 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1029 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: Running task 1031 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1032 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_patch)
NOTE: Running task 1033 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe cargo-native-1.67.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1034 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1035 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1049 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 343 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running task 1053 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1055 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Succeeded
NOTE: Running task 1056 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1058 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1061 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1063 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: recipe cargo-native-1.67.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 349 of 460 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 367 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1076 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1077 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1078 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1079 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1080 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1081 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 371 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1090 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 380 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.67.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 386 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1112 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1146 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rust-native-1.67.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1180 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1189 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1195 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1196 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic unihash changed to d038fcc2c352eb1054da08379567caee65661e8673116a4c925e587477931031
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1425 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1469 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1474 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1499 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1503 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1504 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1505 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1506 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1514 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1526 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1527 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1528 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1529 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1535 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1536 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1546 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1547 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1548 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1549 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1550 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1552 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure)
NOTE: Running task 1584 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1586 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: Running task 1587 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1588 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1590 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1591 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1592 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1595 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1596 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1597 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: Running task 1598 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: Running task 1600 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1601 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: Running task 1602 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: Running task 1603 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1604 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1605 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1606 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1607 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1608 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1609 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1610 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1611 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Started
NOTE: Running task 1612 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1613 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Started
NOTE: Running task 1614 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: Running task 1615 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: Running task 1616 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: Running task 1618 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Started
NOTE: Running task 1619 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_compile)
NOTE: Running task 1621 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: Running task 1622 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1623 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: Running task 1624 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1625 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: Running task 1626 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_configure)
NOTE: Running task 1627 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1632 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: Running task 1633 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: Running task 1634 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_compile)
NOTE: Running task 1635 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: Running task 1636 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Started
NOTE: Running task 1637 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1638 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1639 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1640 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1641 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1642 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile_ptest_base)
NOTE: Running task 1643 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1644 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: Running task 1645 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1646 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1647 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Started
NOTE: Running task 1648 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_install)
NOTE: Running task 1649 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1650 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1651 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: Running task 1652 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1653 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: Running task 1654 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: Running task 1655 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install)
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1656 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: Running task 1657 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: Running task 1658 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 1661 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1662 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1664 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Succeeded
NOTE: Running task 1666 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1668 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1671 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1672 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: Running task 1673 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1675 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: Running task 1676 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: Running task 1677 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1678 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1679 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: Running task 1680 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: Running task 1682 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: Running task 1683 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1685 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1687 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1688 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_install)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1691 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1693 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: Running task 1695 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: Running task 1696 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: Running task 1697 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Started
NOTE: Running task 1698 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1699 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1701 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 1702 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: Running task 1703 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1705 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1706 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Started
NOTE: Running task 1707 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: Running task 1708 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: Running task 1709 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1710 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1711 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: Running task 1713 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1714 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1715 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package_write_rpm)
NOTE: Running task 1716 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1717 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1718 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1719 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Succeeded
NOTE: Running task 1722 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1723 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1726 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1727 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1729 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1730 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1731 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1732 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1733 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1735 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Succeeded
NOTE: Running task 1736 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1737 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_package)
NOTE: Running task 1738 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1739 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Succeeded
NOTE: Running task 1742 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_install)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Succeeded
NOTE: Running task 1745 of 1749 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1745 tasks of which 1455 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography-vectors/39.0.0-r0/temp/log.do_packagedata.2515062
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata) failed with exit code '1'

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1695 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1693 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1ad329de136fa9ea76211f06023f7477b688496b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ad329de136fa9ea76211f06023f7477b688496b"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 4 Mirrors 0 Missed 90 Current 352 (4% match, 79% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1008 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_fetch)
NOTE: Running task 1086 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1114 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1115 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_fetch)
NOTE: Running task 1149 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1150 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1151 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 1152 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_fetch)
NOTE: Running task 1153 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1161 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1179 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1185 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1186 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1187 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1188 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1189 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1256 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1257 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_fetch)
NOTE: Running task 1275 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_fetch)
NOTE: Running task 1276 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1277 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_fetch)
NOTE: Running task 1278 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1279 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1280 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1281 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1435 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_unpack)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1437 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: Running task 1438 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1439 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1440 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1441 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_unpack)
NOTE: Running task 1442 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1443 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1444 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_unpack)
NOTE: Running task 1445 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1447 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1448 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1450 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: Running task 1452 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1453 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: Running task 1454 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1455 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1456 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1457 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1458 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1459 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1461 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_unpack)
NOTE: Running task 1462 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Started
NOTE: Running task 1463 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1464 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1465 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_patch)
NOTE: Running task 1466 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1467 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1468 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_patch)
NOTE: Running task 1469 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1470 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1471 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: Running task 1473 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1474 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1475 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1476 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_unpack)
NOTE: Running task 1477 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1478 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_unpack)
NOTE: Running task 1479 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1480 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1481 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1482 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1483 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1484 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 1485 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1486 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: Running task 1487 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1488 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_patch)
NOTE: Running task 1489 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: Running task 1490 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: Running task 1491 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1492 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: Running task 1493 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: Running task 1494 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1495 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 1496 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_patch)
NOTE: Running task 1497 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: Running task 1498 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Started
NOTE: Running task 1499 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1500 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1501 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 1502 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1503 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1504 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1506 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: Running task 1508 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1511 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1512 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1515 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1516 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1518 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1519 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1521 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1522 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1524 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1525 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1526 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1527 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1528 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1529 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: Running task 1530 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1531 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Started
NOTE: Running task 1532 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: Running task 1533 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1534 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1536 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1537 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Started
NOTE: Running task 1539 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1540 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1541 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: Running task 1542 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1543 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1544 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1545 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1547 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1549 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_patch)
NOTE: Running task 1550 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1551 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1552 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: Running task 1553 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1555 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1556 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Started
NOTE: Running task 1557 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1558 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1559 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1561 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1562 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1564 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1565 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Started
NOTE: Running task 1566 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1567 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1568 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1569 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1570 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1571 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Started
NOTE: Running task 1572 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1573 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: Running task 1574 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1575 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: Running task 1576 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic)
NOTE: Running task 1577 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: Running task 1578 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1579 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: Running task 1580 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1581 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: Running task 1582 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Started
NOTE: Running task 1583 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: Running task 1584 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic unihash changed to d038fcc2c352eb1054da08379567caee65661e8673116a4c925e587477931031
NOTE: Running task 1586 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Started
NOTE: Running task 1588 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1590 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1592 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1594 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: Running task 1595 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile_ptest_base)
NOTE: Running task 1596 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: Running task 1597 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1598 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Started
NOTE: Running task 1599 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: Running task 1600 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1601 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1602 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_install)
NOTE: Running task 1603 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: Running task 1604 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1605 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1606 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: Running task 1607 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: Running task 1608 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1609 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: Running task 1610 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1615 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1617 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: Running task 1618 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1620 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: Running task 1622 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1623 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1624 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: Running task 1625 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1627 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1628 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1629 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: Running task 1630 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package)
NOTE: Running task 1631 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1632 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: Running task 1634 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Started
NOTE: Running task 1636 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1639 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1640 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1642 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1643 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1644 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1645 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1646 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1647 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1651 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1652 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Succeeded
NOTE: Running task 1654 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1655 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1656 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: Running task 1657 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1658 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: Running task 1659 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: Running task 1660 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1661 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1662 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Started
NOTE: Running task 1663 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1664 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1666 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1667 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: Running task 1668 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package_write_rpm)
NOTE: Running task 1669 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1670 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Succeeded
NOTE: Running task 1674 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1675 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1680 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1682 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1686 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_package)
NOTE: Running task 1691 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_install)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1698 tasks of which 1408 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography-vectors/39.0.0-r0/temp/log.do_packagedata.2382412
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata) failed with exit code '1'

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.11/site-packages/cryptography-39.0.0.dist-info moved to /usr/lib/python3.11/site-packages/cryptography-39.0.1.dist-info

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 55 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1ad329de136fa9ea76211f06023f7477b688496b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ad329de136fa9ea76211f06023f7477b688496b"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 5 Mirrors 0 Missed 90 Current 351 (5% match, 79% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1008 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_fetch)
NOTE: Running task 1086 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1114 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1115 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_fetch)
NOTE: Running task 1149 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1150 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 1151 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1152 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1153 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_fetch)
NOTE: Running task 1160 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1179 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1185 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1186 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1187 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1188 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1189 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1256 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_fetch)
NOTE: Running task 1257 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1274 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: Running task 1275 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1276 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_fetch)
NOTE: Running task 1277 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1278 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1279 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1280 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_fetch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1435 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: Running task 1437 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1438 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_unpack)
NOTE: Running task 1439 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1441 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1442 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1443 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1444 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1445 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1446 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_unpack)
NOTE: Running task 1447 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1448 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1450 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: Running task 1453 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1454 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1455 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1456 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1457 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1458 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1459 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Started
NOTE: Running task 1460 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_unpack)
NOTE: Running task 1461 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1462 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1463 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1464 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1465 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1466 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1467 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1468 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_unpack)
NOTE: Running task 1469 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1470 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1471 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: Running task 1472 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_unpack)
NOTE: Running task 1473 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: Running task 1474 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1475 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1476 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1477 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: Running task 1479 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: Running task 1481 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1482 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: Running task 1484 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1485 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1486 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1487 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 1488 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: Running task 1489 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1490 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_patch)
NOTE: Running task 1491 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1492 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1494 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Started
NOTE: Running task 1495 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: Running task 1497 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: Running task 1498 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_patch)
NOTE: Running task 1499 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Started
NOTE: Running task 1500 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: Running task 1501 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: Running task 1502 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1503 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1504 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Succeeded
NOTE: Running task 1506 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1507 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1508 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1514 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1516 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1517 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1518 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1519 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1521 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1522 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1524 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1525 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: Running task 1527 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Started
NOTE: Running task 1529 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1530 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1531 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1533 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: Running task 1535 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1536 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1537 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure_ptest_base)
NOTE: Running task 1538 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1539 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_configure)
NOTE: Running task 1540 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: Running task 1541 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Started
NOTE: Running task 1542 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1543 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: Running task 1544 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1545 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1546 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1547 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1548 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1549 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: Running task 1550 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1551 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1552 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1553 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: Running task 1555 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1556 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_configure)
NOTE: Running task 1557 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: Running task 1558 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1559 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1560 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1561 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: Running task 1562 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Started
NOTE: Running task 1564 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1565 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1566 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1568 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1569 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1570 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: Running task 1571 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1572 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: Running task 1573 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile)
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Started
NOTE: Running task 1574 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: Running task 1575 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1576 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: Running task 1577 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1578 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1579 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 1580 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: Running task 1581 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: Running task 1582 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_compile)
NOTE: Running task 1584 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: Running task 1585 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: Running task 1587 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic unihash changed to d038fcc2c352eb1054da08379567caee65661e8673116a4c925e587477931031
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1588 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1590 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1594 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: Running task 1595 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile_ptest_base)
NOTE: Running task 1596 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: Running task 1597 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1598 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: Running task 1599 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: Running task 1600 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1601 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install)
NOTE: Running task 1602 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_install)
NOTE: Running task 1603 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: Running task 1604 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: Running task 1605 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1606 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1607 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1608 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: Running task 1610 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: Running task 1611 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: Running task 1615 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1617 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 1618 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: Running task 1619 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1620 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1621 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1622 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1623 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: Running task 1624 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: Running task 1625 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1626 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1627 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1629 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: Running task 1630 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_install)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1631 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: Running task 1632 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: Running task 1633 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Started
NOTE: Running task 1634 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install_ptest_base)
NOTE: Running task 1636 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1637 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1639 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: Running task 1641 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package)
NOTE: Running task 1642 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1644 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: Running task 1645 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: Running task 1646 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Succeeded
NOTE: Running task 1647 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1648 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: Running task 1649 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 1652 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 1654 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1655 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: Running task 1656 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1657 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1658 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Succeeded
NOTE: Running task 1659 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata)
NOTE: Running task 1660 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1661 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 1662 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1663 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1664 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 1666 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1667 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: Running task 1668 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1669 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1670 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1671 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: Running task 1674 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1675 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1680 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1682 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1686 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_package)
NOTE: Running task 1691 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_install)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1698 tasks of which 1408 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography-vectors/39.0.0-r0/temp/log.do_packagedata.2414302
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata) failed with exit code '1'

--===============3336647026108043002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 65 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1ad329de136fa9ea76211f06023f7477b688496b"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ad329de136fa9ea76211f06023f7477b688496b"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 5 Mirrors 0 Missed 90 Current 351 (5% match, 79% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1008 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_fetch)
NOTE: Running task 1086 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1114 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1115 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_fetch)
NOTE: Running task 1149 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1150 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_fetch)
NOTE: Running task 1151 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1152 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 1153 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1161 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1179 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1185 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1186 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1187 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1188 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_fetch)
NOTE: Running task 1189 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_fetch)
NOTE: Running task 1256 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1257 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_fetch)
NOTE: Running task 1275 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_fetch)
NOTE: Running task 1276 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_fetch)
NOTE: Running task 1277 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1278 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1279 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1280 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_fetch)
NOTE: Running task 1281 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1435 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: Running task 1436 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1437 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1438 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1439 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_unpack)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_unpack)
NOTE: Running task 1441 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1442 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1443 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1444 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1445 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1446 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1447 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1448 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1450 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: Running task 1452 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1453 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Started
NOTE: Running task 1454 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1455 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1456 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1457 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_unpack)
NOTE: Running task 1458 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_unpack)
NOTE: Running task 1459 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1461 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_unpack)
NOTE: Running task 1462 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1464 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1465 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1466 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1468 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1469 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1470 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1471 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1472 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1473 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: Running task 1474 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1475 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1477 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_unpack)
NOTE: Running task 1478 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1479 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1480 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_unpack)
NOTE: Running task 1482 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: Running task 1483 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Started
NOTE: Running task 1484 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: Running task 1485 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_patch)
NOTE: Running task 1486 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1487 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_patch)
NOTE: Running task 1488 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1489 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1490 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: Running task 1491 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1492 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: Running task 1493 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Started
NOTE: Running task 1494 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: Running task 1495 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1496 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1497 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: Running task 1498 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1499 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1500 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 1501 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_patch)
NOTE: Running task 1502 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1503 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1504 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1505 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: Running task 1507 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1508 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1510 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1513 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1515 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1516 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1519 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1520 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1521 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1524 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1525 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1529 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1530 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1532 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1533 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1534 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1536 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: Running task 1537 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Started
NOTE: Running task 1538 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1539 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1540 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1541 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1542 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1543 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1544 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: Running task 1545 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: Running task 1546 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1547 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1548 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1549 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1550 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1552 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1553 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1555 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1556 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1557 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_compile)
NOTE: Running task 1560 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Started
NOTE: Running task 1561 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: Running task 1562 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1563 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1564 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1565 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1566 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: Running task 1567 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1568 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: Running task 1569 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: Running task 1570 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Started
NOTE: Running task 1571 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1572 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1573 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1576 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: Running task 1577 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1578 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: Running task 1579 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Started
NOTE: Running task 1580 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: Running task 1581 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: Running task 1584 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1585 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_lic unihash changed to d038fcc2c352eb1054da08379567caee65661e8673116a4c925e587477931031
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1588 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1590 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1594 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: Running task 1595 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_compile_ptest_base)
NOTE: Running task 1596 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1597 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_install)
NOTE: Running task 1598 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: Running task 1599 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1600 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install)
NOTE: Running task 1601 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: Running task 1602 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: Running task 1603 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1604 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: Running task 1605 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1606 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Started
NOTE: Running task 1607 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1608 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1609 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Started
NOTE: Running task 1610 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: Running task 1611 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1613 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1615 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package)
NOTE: Running task 1618 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: Running task 1620 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Started
NOTE: Running task 1621 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Started
NOTE: Running task 1624 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: Running task 1625 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: Running task 1626 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1628 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1630 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: Running task 1631 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1634 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1636 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1637 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1639 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1640 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Started
NOTE: Running task 1642 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: Running task 1643 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1644 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1645 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1646 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1647 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1648 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1650 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1652 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1653 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1654 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1655 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Started
NOTE: Running task 1656 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package_write_rpm)
NOTE: Running task 1657 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1659 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: Running task 1660 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1661 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata)
NOTE: Running task 1662 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1663 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: Running task 1664 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Started
NOTE: Running task 1666 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1667 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1668 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1669 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1670 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1671 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.66.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: Running task 1673 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-67.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1674 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1675 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-67.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1679 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1680 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1682 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1686 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install: Succeeded
NOTE: Running task 1689 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_package)
NOTE: Running task 1691 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_package: Succeeded
NOTE: Running task 1695 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_install)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-39.0.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1698 tasks of which 1408 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.1-r0 to 0:39.0.0-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-39.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography-vectors/39.0.0-r0/temp/log.do_packagedata.2446199
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb:do_packagedata) failed with exit code '1'

--===============3336647026108043002==--

