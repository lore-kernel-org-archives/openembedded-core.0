Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509A6C6FD18
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12570.1662040786598636604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I76Lwt0W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182f959c356-a81795ea-a63f-408a-a177-2c5fe74ca0c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fXVBroIExF8H/j/+jttAtHfA8s2MnsUgxeYahXpnEho=;
	b=I76Lwt0Wa3ZwasBtJEqwMrQ0lbjfj+UA3thYvqff256F6P46lSDukYt/z912K5QK
	yiUWd3v7S7u6hiqZZsuo0hahypMyyxc0XIXX5tjCE0EUE8+l7MRKdP3LWaVbxvvvG4t
	aDk2VfaG1wihrjBBhIeCYGxs3FNyPq3Dd38QYryw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fXVBroIExF8H/j/+jttAtHfA8s2MnsUgxeYahXpnEho=;
	b=OVVkTafWlEw4XNE5V//E76J0LEcLv3RpGMAm5P1q/6JRDrTaBte0r3ldOW/YAw6M
	xYh74ALtBhH0j14sNTdwP2MkPzArFLdyVuxemww5+TEQD9THpplosS6NhBA2HoR5+mq
	AeviyD95mzQpFaI5oQzwJC65kWMx9t1+2H6IlVBs=
Content-Type: multipart/mixed; boundary="===============2507834910014643761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.12 SUCCEEDED
Message-ID: 
 <01010182f959c356-a81795ea-a63f-408a-a177-2c5fe74ca0c2-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170183

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.11-1.26.12.patch
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
--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-646e70cfb377eae35da81f75747066df4943cba5"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646e70cfb377eae35da81f75747066df4943cba5"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 3 Mirrors 0 Missed 59 Current 333 (4% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 938 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 996 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_fetch)
NOTE: Running task 1126 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1127 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1128 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1146 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1147 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_fetch)
NOTE: Running task 1148 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1175 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1193 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1194 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1195 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1196 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1197 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1199 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1200 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1339 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_unpack)
NOTE: Running task 1344 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1345 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1346 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1347 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1348 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_unpack)
NOTE: Running task 1352 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1353 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1354 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1358 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1359 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1360 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1361 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1362 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1363 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1364 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1365 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: Running task 1366 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Started
NOTE: Running task 1367 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: Running task 1368 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1370 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1371 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1372 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1373 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_patch)
NOTE: Running task 1374 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1375 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1378 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1379 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1380 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1381 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1384 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1385 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1388 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1391 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1392 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1394 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1395 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1396 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: Running task 1398 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic unihash changed to 0a4d2599b0a752aec8b37e002c85d3d3209419c5a483a08276da3c4b34c2a07b
NOTE: Running task 1399 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1400 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: Running task 1401 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1405 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: Running task 1406 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1408 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1409 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1410 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1411 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: Running task 1413 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: Running task 1414 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1417 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1418 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: Running task 1419 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1420 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1421 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1422 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1423 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: Running task 1430 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: Running task 1433 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1434 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1437 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: Running task 1438 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1439 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1442 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1443 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1444 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1445 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1446 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: Running task 1447 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: Running task 1448 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1449 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1450 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: Running task 1452 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: Running task 1453 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: Running task 1454 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1455 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: Running task 1456 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1457 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: Running task 1459 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: Running task 1460 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1463 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: Running task 1464 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: Running task 1465 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: Running task 1466 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4046135
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-646e70cfb377eae35da81f75747066df4943cba5"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646e70cfb377eae35da81f75747066df4943cba5"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 3 Mirrors 0 Missed 59 Current 333 (4% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 938 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 996 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_fetch)
NOTE: Running task 1126 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1127 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1128 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1146 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1148 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1149 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_fetch)
NOTE: Running task 1175 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1193 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1194 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1195 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1196 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1197 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1198 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1199 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1339 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_unpack)
NOTE: Running task 1344 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1345 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1346 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1347 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1348 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1352 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_unpack)
NOTE: Running task 1353 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1354 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1358 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1359 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1360 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1361 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1362 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1363 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1364 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1365 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: Running task 1367 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1368 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 1370 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1371 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: Running task 1372 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_patch)
NOTE: Running task 1373 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1374 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1375 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1377 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: Running task 1378 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1379 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1380 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1381 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 1384 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1385 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1387 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1388 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1391 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1394 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1395 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic unihash changed to 0a4d2599b0a752aec8b37e002c85d3d3209419c5a483a08276da3c4b34c2a07b
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1398 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1400 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1401 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: Running task 1403 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: Running task 1405 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: Running task 1407 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: Running task 1408 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1409 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_patch)
NOTE: Running task 1410 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1411 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: Running task 1413 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: Running task 1415 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1417 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1419 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: Running task 1420 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: Running task 1421 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1422 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1423 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: Running task 1424 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: Running task 1428 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1430 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1432 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1433 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: Running task 1434 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1437 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: Running task 1438 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1439 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_sysroot)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1442 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1443 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1444 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1445 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1446 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: Running task 1448 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1449 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: Running task 1450 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1452 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: Running task 1453 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1454 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1455 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: Running task 1456 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: Running task 1457 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: Running task 1458 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1459 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1460 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: Running task 1463 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1464 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: Running task 1465 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1466 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4021946
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 33 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-646e70cfb377eae35da81f75747066df4943cba5"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646e70cfb377eae35da81f75747066df4943cba5"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 216 Local 145 Mirrors 0 Missed 71 Current 195 (67% match, 82% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running task 713 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 714 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 715 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 716 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 766 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_fetch)
NOTE: Running task 786 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 845 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 846 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 847 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 848 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 849 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_fetch)
NOTE: Running task 850 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 851 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 855 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 856 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 857 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 858 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 859 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 860 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 861 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: Running task 915 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 917 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 918 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 919 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_unpack)
NOTE: Running task 920 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 921 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 922 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 923 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 924 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 925 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 926 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 927 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 928 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: Running task 929 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_setscene)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Started
NOTE: Running setscene task 279 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 280 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 935 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 937 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: Running task 938 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 939 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 940 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_patch)
NOTE: Running task 941 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 942 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 946 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 947 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: Running task 948 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 949 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 950 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 951 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 962 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 967 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 972 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 973 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 974 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 975 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 976 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 978 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 979 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: Running task 980 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 296 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 989 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 990 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic unihash changed to 0a4d2599b0a752aec8b37e002c85d3d3209419c5a483a08276da3c4b34c2a07b
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 301 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 995 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 308 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1004 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1005 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 310 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1015 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_rust_gen_targets)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1017 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 366 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1070 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1278 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1279 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1353 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1369 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1398 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1399 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1401 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1402 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1435 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1438 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1441 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1443 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: Running task 1444 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: Running task 1447 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: Running task 1448 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1449 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1450 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1451 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1452 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1454 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1456 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1457 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: Running task 1458 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: Running task 1459 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: Running task 1460 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1462 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 1463 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1465 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1466 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1467 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: Running task 1468 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: Running task 1469 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: Running task 1473 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1474 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 1476 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1478 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: Running task 1479 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1480 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Started
NOTE: Running task 1482 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: Running task 1484 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 1486 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 1487 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1489 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1490 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1491 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1496 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1497 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1499 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1500 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: Running task 1501 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1502 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1504 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: Running task 1506 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_patch: Started
NOTE: Running task 1507 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe libstd-rs-1.63.0-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1510 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_rust_gen_targets)
NOTE: Running task 1511 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1512 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1514 of 1567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1514 tasks of which 1345 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4065794
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.11.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.12.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.11" to "1.26.12"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 735383 to 737170 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.11 [default] to 1.26.12 [default]
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.10/site-packages/urllib3-1.26.11.dist-info moved to /usr/lib/python3.10/site-packages/urllib3-1.26.12.dist-info

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-646e70cfb377eae35da81f75747066df4943cba5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646e70cfb377eae35da81f75747066df4943cba5"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 3 Mirrors 0 Missed 59 Current 333 (4% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 938 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 996 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_fetch)
NOTE: Running task 1126 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1127 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1128 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1146 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1148 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1149 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_fetch)
NOTE: Running task 1175 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1192 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1193 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1194 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1195 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1196 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1197 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1199 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1339 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_unpack)
NOTE: Running task 1344 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1345 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1346 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1347 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1348 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1352 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_unpack)
NOTE: Running task 1353 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1354 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1358 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1359 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1360 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1361 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1362 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1363 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1364 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1365 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: Running task 1367 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1368 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1370 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1371 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: Running task 1372 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: Running task 1373 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1374 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1375 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1376 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1378 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1379 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1380 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1381 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1384 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1385 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic)
NOTE: Running task 1390 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1391 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1394 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1395 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1396 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic unihash changed to 0a4d2599b0a752aec8b37e002c85d3d3209419c5a483a08276da3c4b34c2a07b
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: Running task 1398 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: Running task 1401 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: Running task 1402 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1405 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: Running task 1406 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: Running task 1407 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: Running task 1408 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1409 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_patch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1410 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1411 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: Running task 1412 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1413 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Started
NOTE: Running task 1414 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: Running task 1416 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: Running task 1417 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1418 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: Running task 1419 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1420 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: Running task 1421 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: Running task 1422 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: Running task 1423 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: Running task 1429 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1430 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1432 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: Running task 1433 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 1434 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1436 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1438 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1439 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: Running task 1440 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1442 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1443 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1444 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: Running task 1445 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1448 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1449 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: Running task 1450 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1452 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1453 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1454 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1455 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1456 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: Running task 1457 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: Running task 1459 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1460 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1461 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1464 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1466 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: Running task 1468 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4010347
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-646e70cfb377eae35da81f75747066df4943cba5"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646e70cfb377eae35da81f75747066df4943cba5"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 3 Mirrors 0 Missed 59 Current 333 (4% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 938 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_fetch)
NOTE: Running task 996 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_fetch)
NOTE: Running task 1126 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_fetch)
NOTE: Running task 1127 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_fetch)
NOTE: Running task 1128 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_fetch)
NOTE: Running task 1146 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1148 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_fetch)
NOTE: Running task 1149 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_fetch)
NOTE: Running task 1175 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1192 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1194 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_fetch)
NOTE: Running task 1195 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1196 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1197 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_fetch)
NOTE: Running task 1198 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_fetch)
NOTE: Running task 1199 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_fetch)
NOTE: Running task 1339 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_unpack)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_unpack)
NOTE: Running task 1344 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_unpack)
NOTE: Running task 1345 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_unpack)
NOTE: Running task 1346 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_unpack)
NOTE: Running task 1347 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1348 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1351 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_unpack)
NOTE: Running task 1352 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_unpack)
NOTE: Running task 1353 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1354 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1358 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_unpack)
NOTE: Running task 1359 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1360 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1361 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_unpack)
NOTE: Running task 1362 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_unpack)
NOTE: Running task 1363 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_unpack)
NOTE: Running task 1364 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1365 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1366 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1367 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1368 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 1370 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_patch)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Started
NOTE: Running task 1371 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: Running task 1372 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1373 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_patch)
NOTE: Running task 1374 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1375 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1378 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_patch)
NOTE: Running task 1379 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_patch)
NOTE: Running task 1380 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1381 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1384 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1385 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1386 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1387 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1390 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1392 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1394 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1396 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_patch)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1397 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure)
NOTE: Running task 1398 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_lic unihash changed to 0a4d2599b0a752aec8b37e002c85d3d3209419c5a483a08276da3c4b34c2a07b
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1401 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure)
NOTE: recipe python3-psutil-5.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Started
NOTE: Running task 1404 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1405 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1406 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1407 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: Running task 1408 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 1410 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Started
NOTE: Running task 1411 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Started
NOTE: Running task 1413 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_compile)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: Running task 1417 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1418 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: Running task 1419 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_compile)
NOTE: Running task 1420 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile)
NOTE: Running task 1421 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1422 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Started
NOTE: Running task 1423 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-37.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-37.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: Running task 1429 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_install)
NOTE: Running task 1430 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1433 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1434 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package)
NOTE: Running task 1435 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_compile_ptest_base)
NOTE: Running task 1436 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Started
NOTE: Running task 1438 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1439 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Started
NOTE: Running task 1441 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Started
NOTE: Running task 1442 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1443 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: Running task 1444 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1445 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_install_ptest_base)
NOTE: Running task 1447 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_install)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1449 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1450 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_install_ptest_base)
NOTE: Running task 1451 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 1453 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1454 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1455 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.2.1.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1456 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: Running task 1457 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_package)
NOTE: recipe python3-certifi-2022.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1459 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1460 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb:do_package_write_rpm)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Started
NOTE: Running task 1461 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install: Succeeded
NOTE: Running task 1463 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1464 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb:do_package)
NOTE: Running task 1466 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.1-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.1.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.46.11-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-3.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2022.2.1-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1468 tasks of which 1323 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.54.4-r0 to 0:6.46.11-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.46.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.46.11-r0/temp/log.do_packagedata.4034473
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb:do_packagedata) failed with exit code '1'

--===============2507834910014643761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.11-1.26.12.patch"

RnJvbSA1NGI3ZmZmNDc4OGNjOGYzMjRmYmQxZTcxZGU0ZTMyMzhlMDE2N2M2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzo0NDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjExIC0+IDEuMjYuMTIKCi0tLQogLi4uL3tweXRo
b24zLXVybGxpYjNfMS4yNi4xMS5iYiA9PiBweXRob24zLXVybGxpYjNfMS4yNi4xMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzEuMjYuMTEu
YmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTIuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTIuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMS4yNi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMi5iYgppbmRleCBhOGQ0N2RlMGY0Li4x
Y2Q2OWJjYjEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJsbGliM18xLjI2LjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cmxsaWIzXzEuMjYuMTIuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9zaGF6b3cvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWE2ZThmYjIxMGIxOWQ5NTBm
YWI5M2I2MGM5MDA5MjI2YzYzYTI4ODA4YmM4Mzg2ZTA1MzAxZTI1ODgzYWMwYSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIzZmE5NmNmNDIzZTY5ODc5OTdmYzMyNmFlOGRmMzk2ZGIyYThiN2M2Njc3
NDdkNDdkZGQ4ZWNiYTkxZjRhNzRlIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAK
Mi4zMS4xCgo=

--===============2507834910014643761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.10/site-packages/urllib3-1.26.11.dist-info moved to /usr/lib/python3.10/site-packages/urllib3-1.26.12.dist-info

--===============2507834910014643761==--

