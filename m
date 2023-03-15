Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57145C7EE26
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.12300.1678895726662374080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZlHDvQN3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010186e5fbbcdb-1555c95b-9e32-4133-bbec-f96fcd772e27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cfBMjDQlcL/7oMMCZf8YNCqaPeZ4P7+RFnnJ0lhkpGY=;
	b=ZlHDvQN3cchlL+VJw1JYdI1rLq00EyBrwqNWO10kFx8xqy71Es2eXnEHwa8uRX9J
	Q7SNp3G0mEz83CnjB3NhsmBLbsybyoJ2APO0p3mh8GVd+ZkYIi3nwJwbTJAsRhazGjD
	T8WGU0sQ75kInt1n0tZ4QCAAK+HEoRCwdg/O7pWg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cfBMjDQlcL/7oMMCZf8YNCqaPeZ4P7+RFnnJ0lhkpGY=;
	b=FLHUtvTUw4CBMjxBzk7fPNpCBzsfvqj2KUmIGL8TTMZ5XFcTCcOxA9uLHemjEtP8
	K2CTzeLvVnzOvbm2QTdw87Ejtn4/pchOe4FDLlcbJBUxACzZPGZOQ7AvRCoyjbTgEfy
	5KiTv/IdQQsnszbTmnFUzrvY14TSCa7X/IVDNvA8=
Content-Type: multipart/mixed; boundary="===============0872083484180172026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.15 SUCCEEDED
Message-ID: <01010186e5fbbcdb-1555c95b-9e32-4133-bbec-f96fcd772e27-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178610

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.14-1.26.15.patch
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
--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 56 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8bc5e4ac1a826359ce3441536c90e98165c4a02f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc5e4ac1a826359ce3441536c90e98165c4a02f"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 71 Local 6 Mirrors 0 Missed 65 Current 336 (8% match, 84% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: Running task 1000 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1096 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1127 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1128 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_fetch)
NOTE: Running task 1147 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1152 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1153 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1154 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1187 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1216 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 1218 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1221 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1222 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1223 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_unpack)
NOTE: Running task 1224 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1225 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1226 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1227 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1228 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1229 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1230 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1231 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1235 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1236 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1237 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1238 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1239 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1240 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1246 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1247 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1260 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1375 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1377 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1378 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1380 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1381 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1382 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1383 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_patch)
NOTE: Running task 1384 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1385 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1386 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1387 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1388 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1389 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: Running task 1390 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1392 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1396 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1397 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: Running task 1400 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1403 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1405 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1406 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic)
NOTE: Running task 1408 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1409 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1413 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1417 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1418 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1419 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1420 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1421 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1422 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure)
NOTE: Running task 1423 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic unihash changed to 10c5ad0d788251d213d9fd00413bb21d6a5b9b3f1ab24903f28b4bd2f2476bee
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1425 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1426 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1427 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1428 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1429 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1430 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1431 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running task 1432 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1434 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1435 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1436 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1438 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1440 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1444 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: Running task 1446 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1447 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1448 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1452 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c9163c9df5aab90477d2fc57e5646c02f7ff0089ef42ac2f71d262b21c2bfa0
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1459 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile_ptest_base)
NOTE: Running task 1461 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1462 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1463 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1464 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1466 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1467 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: Running task 1468 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: Running task 1469 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1471 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: Running task 1472 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1475 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1478 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1482 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: Running task 1483 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1484 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1486 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: Running task 1487 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1488 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: Running task 1489 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: Running task 1490 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1491 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: Running task 1492 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1493 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1498 tasks of which 1347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytest/7.2.1-r0/temp/log.do_packagedata.4044436
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata) failed with exit code '1'

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.15.dist-info

--===============0872083484180172026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.14-1.26.15.patch"

RnJvbSA5NGM1M2M5MzYxMzkxMGJhYjNkNjVhYmMzOGYzMjM5ODdiZDdjOGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6NDI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMS4yNi4xNCAtPiAxLjI2LjE1CgotLS0KIC4uLi97cHl0
aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTUuYmJ9ICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJsbGliM18xLjI2LjE0
LmJiID0+IHB5dGhvbjMtdXJsbGliM18xLjI2LjE1LmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18xLjI2LjE1LmJiCnNp
bWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTUuYmIKaW5kZXggZjM1YTE0MWRmMi4u
ZDJkZTdjNGMwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVybGxpYjNfMS4yNi4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXJsbGliM18xLjI2LjE1LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vc2hhem93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jMjgyM2NiOTk1NDM5Yzk4NGZk
NjJhOTczZDc5ODE1YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3NjkwN2JmOGZkMzU1Y2Rl
Nzc3Mjg0NzEzMTY2MjVhNGQyZjdlNzEzYzEyNWY1MTk1M2JiNWIzZWVjZjRmNzIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOGEzODg3MTdiOTQ3NmY5MzRhMjE0ODRlOGM4ZTYxODc1YWI2MDY0NGQy
OWI5YjM5ZTExZTRiOWRjMWM2YjMwNSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0g
CjIuMzkuMgoK

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8bc5e4ac1a826359ce3441536c90e98165c4a02f"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc5e4ac1a826359ce3441536c90e98165c4a02f"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 71 Local 6 Mirrors 0 Missed 65 Current 336 (8% match, 84% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: Running task 1000 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1096 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1127 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1128 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_fetch)
NOTE: Running task 1147 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1152 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1153 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1154 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1187 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1217 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 1219 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1222 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1223 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1224 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1225 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1226 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1227 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1228 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1229 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1230 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1231 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1232 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1235 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1236 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1237 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1238 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1239 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1240 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1246 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1247 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1260 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1375 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: Running task 1376 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1377 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1378 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1379 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1380 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_patch)
NOTE: Running task 1382 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1383 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 1384 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: Running task 1386 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1387 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1388 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1389 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1390 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1391 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: Running task 1394 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1395 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1398 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1401 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic)
NOTE: Running task 1408 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1412 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1415 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1416 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1417 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1418 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1419 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1420 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1421 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Succeeded
NOTE: Running task 1422 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic unihash changed to 10c5ad0d788251d213d9fd00413bb21d6a5b9b3f1ab24903f28b4bd2f2476bee
NOTE: Running task 1423 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1424 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1425 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1426 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1427 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1428 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 1429 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1430 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1431 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: Running task 1432 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: Running task 1433 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1434 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure_ptest_base)
NOTE: Running task 1435 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1436 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1437 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1438 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1439 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1442 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1443 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1444 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: Running task 1446 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1447 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: Running task 1448 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: Running task 1449 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1450 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: Running task 1452 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6a240e84473ce5d69e3e5bb6e4806cca62ac409bd2721dac7f09fd6cb938d81c
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1459 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1463 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1464 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1466 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: Running task 1468 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: Running task 1469 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: Running task 1470 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_sysroot)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1471 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Started
NOTE: Running task 1472 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: Running task 1476 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1477 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_package)
NOTE: Running task 1481 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1483 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1484 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: Running task 1486 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1487 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1488 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1492 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_packagedata)
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: Running task 1498 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1498 tasks of which 1347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytest/7.2.1-r0/temp/log.do_packagedata.4057975
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata) failed with exit code '1'

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.14.tar.gz;downloadfilename=urllib3-1.26.14.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.15.tar.gz;downloadfilename=urllib3-1.26.15.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.14" to "1.26.15"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 900896 to 902298 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.14 [default] to 1.26.15 [default]
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.15.dist-info

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1793 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1791 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8bc5e4ac1a826359ce3441536c90e98165c4a02f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc5e4ac1a826359ce3441536c90e98165c4a02f"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 5 Mirrors 0 Missed 65 Current 337 (7% match, 84% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: Running task 1000 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1096 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1127 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1128 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_fetch)
NOTE: Running task 1147 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1152 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1153 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1154 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1187 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1217 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: Running task 1218 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 1219 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1222 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1223 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1224 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_unpack)
NOTE: Running task 1225 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1226 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1227 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1228 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1230 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1231 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1232 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1235 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1236 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1237 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1238 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1239 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1240 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1246 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1247 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1260 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: Running task 1375 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 1376 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1377 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: Running task 1378 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_patch)
NOTE: Running task 1379 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1381 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: Running task 1383 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1384 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1385 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1386 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1387 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1388 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1389 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1390 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1391 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: Running task 1393 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1396 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: Running task 1399 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1407 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1408 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1409 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Started
NOTE: Running task 1410 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1411 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1415 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1418 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1419 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1420 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure)
NOTE: Running task 1421 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1422 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1423 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic unihash changed to 10c5ad0d788251d213d9fd00413bb21d6a5b9b3f1ab24903f28b4bd2f2476bee
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1424 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1425 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1426 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1427 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1428 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1429 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1430 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1431 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: Running task 1432 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1434 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1435 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: Running task 1436 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1437 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: Running task 1439 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1440 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1442 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1443 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1445 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1446 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1447 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1448 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 1449 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1452 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bc44602d23f5e90668311c9434de006378849ba78d836815fdaf065c3fe5268c
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1459 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1462 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1463 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1464 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1466 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: Running task 1467 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: Running task 1468 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: Running task 1469 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: Running task 1471 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Started
NOTE: Running task 1472 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1475 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: Running task 1477 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: Running task 1478 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: Running task 1479 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: Running task 1481 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: Running task 1483 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 1484 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1485 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: Running task 1486 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1490 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1491 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1498 tasks of which 1347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytest/7.2.1-r0/temp/log.do_packagedata.4031250
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata) failed with exit code '1'

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8bc5e4ac1a826359ce3441536c90e98165c4a02f"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc5e4ac1a826359ce3441536c90e98165c4a02f"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 71 Local 6 Mirrors 0 Missed 65 Current 336 (8% match, 84% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 943 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: Running task 1000 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1096 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1127 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 1128 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_fetch)
NOTE: Running task 1147 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 1152 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1153 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1154 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 1187 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1215 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: Running task 1217 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1220 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1221 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 1222 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_unpack)
NOTE: Running task 1223 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: Running task 1224 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1225 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1226 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1227 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1228 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: Running task 1229 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1230 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1235 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1236 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1237 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 1238 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1239 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1240 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 1246 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1247 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1260 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1375 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1376 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1377 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1378 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: Running task 1379 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1380 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: Running task 1383 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_patch)
NOTE: Running task 1384 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1385 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1386 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: Running task 1387 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1388 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1389 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: Running task 1390 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: Running task 1393 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1394 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: Running task 1395 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1396 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1397 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1402 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1404 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1412 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Started
NOTE: Running task 1415 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1416 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1417 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1418 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1419 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic unihash changed to 10c5ad0d788251d213d9fd00413bb21d6a5b9b3f1ab24903f28b4bd2f2476bee
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1420 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1421 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1422 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1423 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1424 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1425 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: Running task 1426 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure)
NOTE: Running task 1427 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1428 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: Running task 1429 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: Running task 1431 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1432 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1433 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1434 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: Running task 1435 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1436 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Succeeded
NOTE: Running task 1437 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1438 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1440 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1441 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1442 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: Running task 1444 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1446 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1447 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: Running task 1448 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1449 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1452 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 939d37d6158c1b021c4a4e87625a2c6699a2cf612100fe6402822e98ca499105
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: Running task 1457 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1459 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1463 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1464 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1465 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: Running task 1466 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1467 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1468 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: Running task 1469 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: Running task 1470 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: Running task 1471 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1472 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1474 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: Running task 1475 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: Running task 1478 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1481 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: Running task 1483 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: Running task 1484 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1485 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1486 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1487 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1489 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1490 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: Running task 1492 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1494 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1495 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1550 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1498 tasks of which 1347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytest/7.2.1-r0/temp/log.do_packagedata.4071640
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata) failed with exit code '1'

--===============0872083484180172026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 50 skipped, 0 masked, 0 errors.
Removing 38 recipes from the core2-32 sysroot...done.
Removing 52 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8bc5e4ac1a826359ce3441536c90e98165c4a02f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8bc5e4ac1a826359ce3441536c90e98165c4a02f"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 229 Local 149 Mirrors 0 Missed 80 Current 192 (65% match, 80% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 193 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 678 of 1597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_rust_gen_targets)
NOTE: Running task 715 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 716 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 717 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 718 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_fetch)
NOTE: Running task 734 of 1597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.67.1.bb:do_rust_gen_targets)
NOTE: Running task 763 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 777 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 809 of 1597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_rust_gen_targets)
NOTE: Running task 830 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 831 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_fetch)
NOTE: Running task 832 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_fetch)
NOTE: Running task 833 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_fetch)
NOTE: Running task 834 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_fetch)
NOTE: Running task 835 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 836 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 837 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 844 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 845 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 846 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 847 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 848 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_fetch)
NOTE: Running task 849 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_fetch)
NOTE: Running task 850 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_unpack)
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 919 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_unpack)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_unpack)
NOTE: Running task 922 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: recipe rust-native-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Started
NOTE: Running task 923 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 924 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_unpack)
NOTE: Running task 925 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 926 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 927 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 928 of 1597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Started
NOTE: Running task 929 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: recipe python3-pytest-7.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: Running task 930 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_unpack)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 932 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 933 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 284 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 934 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 935 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: Running task 938 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 939 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: Running task 941 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 942 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: Running task 943 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_patch)
NOTE: Running task 944 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe rust-native-1.67.1-r0: task do_compile: Started
NOTE: Running task 945 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_patch)
NOTE: Running task 946 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 947 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: Running task 948 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Started
NOTE: Running task 957 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 958 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_patch: Succeeded
NOTE: Running task 959 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 960 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 963 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 964 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 965 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_patch: Succeeded
NOTE: Running task 966 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 967 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 968 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 970 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_patch: Succeeded
NOTE: Running task 972 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 307 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: Running task 979 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 984 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 987 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 316 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_lic: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 992 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_lic unihash changed to 10c5ad0d788251d213d9fd00413bb21d6a5b9b3f1ab24903f28b4bd2f2476bee
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 325 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 336 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1001 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1002 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 340 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 355 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 1016 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1017 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1054 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1055 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 372 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1061 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1063 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 376 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running task 1072 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: Running task 1073 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1075 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1079 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1080 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1085 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1086 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1091 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1100 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 396 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 1102 of 1597 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.67.1.bb:do_install)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.67.1-r0: task do_install: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1123 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ba3746df05eabf3927798dd94e2320be4e35e0260cfd0af69bed798de504f77f
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 421 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1288 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1358 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1370 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1383 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1413 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1415 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1416 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1449 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1450 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_configure)
NOTE: Running task 1451 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: Running task 1453 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-psutil-5.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_configure)
NOTE: recipe python3-pytest-7.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Started
NOTE: Running task 1456 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1457 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Started
NOTE: Running task 1458 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 1463 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_configure: Succeeded
NOTE: Running task 1464 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1465 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1466 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1467 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 1469 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1470 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile)
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1471 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1473 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_compile: Succeeded
NOTE: Running task 1474 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 1475 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile: Succeeded
NOTE: Running task 1477 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_compile_ptest_base)
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: Running task 1478 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1480 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1481 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1483 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1484 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1486 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_package)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_populate_sysroot)
NOTE: Running task 1488 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1489 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1491 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_install)
NOTE: Running task 1492 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1493 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1495 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_install_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1497 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1498 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 1499 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1500 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_package)
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1501 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_install_ptest_base)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: Running task 1502 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Started
NOTE: Running task 1504 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata)
NOTE: Running task 1505 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1506 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: Running task 1507 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.1.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Started
NOTE: Running task 1508 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_package)
NOTE: Running task 1509 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1511 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.15-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1514 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: Running task 1515 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Running task 1516 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_package: Succeeded
NOTE: Running task 1517 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.68.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata: Failed
NOTE: recipe python3-pytz-2022.7.1-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe rust-native-1.67.1-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1519 tasks of which 1336 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.2.2-r0 to 0:7.2.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytest/7.2.1-r0/temp/log.do_packagedata.4092440
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata) failed with exit code '1'

--===============0872083484180172026==--

