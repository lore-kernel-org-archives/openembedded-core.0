Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADB1C64E76
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.46764.1669908625680059198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Lg82xnpP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010184ce4f7bd8-be55c783-b4b6-4298-8005-d61bc50ca665-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TnVXfm8mUjk5w16ZJtUGvNXvcGD23EY0dlVHeGj17U8=;
	b=Lg82xnpP55NhFi+WVsJg5kceXRsA5/5ekhfjQdnIO1g5Ftyrty49vYYQO9Ih7iDa
	kSQxV0y9bf81z0GgWOkiARC9j8KL2FMJ4Sr+Y9kmDm6lEoBIGc9tNWVj/F38PKR1O+P
	vtU3Gk7gFCsCh696/fcL0t8y97QwNwx/Wi7s2NoE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TnVXfm8mUjk5w16ZJtUGvNXvcGD23EY0dlVHeGj17U8=;
	b=RCpf55eGqCebqxu1wLCJueSN39T4FS79Ix2iwRPOXRCBcBVLMKqljf7o1Fx02slu
	REwazk5h9GdBo2IrD8koy+sdl5rFMEL7foic9rU/c4BSIY2Txj+HrnxzWTYVcGaUvIS
	HXRkz56QvvYen1bWac7n9zXbuWA1BSQ4FuEdwObI=
Content-Type: multipart/mixed; boundary="===============3811819281378722980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.13 SUCCEEDED
Message-ID: <01010184ce4f7bd8-be55c783-b4b6-4298-8005-d61bc50ca665-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174153

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch
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
--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:047667db016eab9092f5bb3be9148aa21dd49bc7"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 366 (40% match, 95% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1445 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1446 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1448 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1449 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1842126
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 393 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1842127
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1450 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1451 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1452 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1455 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1458 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1460 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1473 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 396 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1490 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1500 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1505 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_write_rpm)
NOTE: Running task 1509 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata unihash changed to 39b993f6d6d3756c73c76c128e9541ff6f47a320f098d9316cad8d2cf6c8cf2f
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1514 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_build)
NOTE: Tasks Summary: Attempted 1514 tasks of which 1468 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.12.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.13.tar.gz"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 901170 to 902709 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1670 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:047667db016eab9092f5bb3be9148aa21dd49bc7"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 366 (40% match, 95% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1445 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1446 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1448 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1449 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1834997
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 393 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1834998
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1450 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1451 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1452 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1455 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1458 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1460 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: Running task 1473 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 396 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1490 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1500 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1505 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_write_rpm)
NOTE: Running task 1509 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata unihash changed to 4c8826fff50f79e81ec21870d437385f9ee2706d4316985464381772e556f3c9
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1514 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_build)
NOTE: Tasks Summary: Attempted 1514 tasks of which 1468 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:047667db016eab9092f5bb3be9148aa21dd49bc7"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 366 (40% match, 95% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1445 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1446 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1448 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1449 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1856360
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: Running setscene task 393 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1856361
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1450 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1451 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1452 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 1453 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1455 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1456 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1458 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1460 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: Running task 1473 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 396 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1490 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1500 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1505 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_write_rpm)
NOTE: Running task 1509 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata unihash changed to 454c0cae12883da45469adcdaa67cbaae2f949956902f03ecdcf50eecdee0cda
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1514 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_build)
NOTE: Tasks Summary: Attempted 1514 tasks of which 1468 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1669 targets, 49 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:047667db016eab9092f5bb3be9148aa21dd49bc7"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 219 Local 201 Mirrors 0 Missed 18 Current 191 (91% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 199 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 230 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 830 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 831 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 832 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 835 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_fetch)
NOTE: Running setscene task 233 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1863508
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 235 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1863518
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 238 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 240 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 260 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 891 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 896 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 897 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 922 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 943 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 944 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 945 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 954 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 955 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 956 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: Running task 957 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: Running task 982 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 295 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.65.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.65.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.65.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.65.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.65.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.65.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 336 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1398 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1399 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1413 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1536 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1537 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: Running task 1538 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: Running task 1539 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: Running task 1540 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: Running task 1541 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1543 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1544 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1548 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1550 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: Running task 1552 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1553 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1554 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1555 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_write_rpm)
NOTE: Running task 1556 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Succeeded
NOTE: Running task 1559 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata unihash changed to ac1fcac3635011ffa5a114841c571cfa3a2a2dfa72716045825e998adb066af6
NOTE: Setscene tasks completed
NOTE: Running task 1560 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1561 of 1561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_build)
NOTE: Tasks Summary: Attempted 1561 tasks of which 1512 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3811819281378722980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:047667db016eab9092f5bb3be9148aa21dd49bc7"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 366 (40% match, 95% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1163 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1445 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1446 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1447 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1448 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1849279
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 393 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1849280
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1450 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1451 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 1452 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1455 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1457 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1458 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1460 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1473 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 396 of 396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1490 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1494 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: Running task 1497 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1500 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: Running task 1505 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1507 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1508 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_write_rpm)
NOTE: Running task 1509 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_packagedata unihash changed to 3e67ecc8ac11e38a396e159bf3ca467f0e7e9df2d6d2d8e1202d0f619a7232ae
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1514 of 1514 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_build)
NOTE: Tasks Summary: Attempted 1514 tasks of which 1468 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.58.2-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3811819281378722980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch"

RnJvbSA5NWU3ZjcwZWNmZTRiN2JiNjE2MWQyYmUxOTkwZjg2YjE2ZWYyMWJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDoxMDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjEyIC0+IDEuMjYuMTMKCi0tLQogLi4uL3tweXRo
b24zLXVybGxpYjNfMS4yNi4xMi5iYiA9PiBweXRob24zLXVybGxpYjNfMS4yNi4xMy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzEuMjYuMTIu
YmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMS4yNi4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMy5iYgppbmRleCAxY2Q2OWJjYjEwLi43
YWY5NTExN2NmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJsbGliM18xLjI2LjEyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9zaGF6b3cvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2ZhOTZjZjQyM2U2OTg3OTk3
ZmMzMjZhZThkZjM5NmRiMmE4YjdjNjY3NzQ3ZDQ3ZGRkOGVjYmE5MWY0YTc0ZSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjMDgzZGQwZGNlNjhkYmZiZTExMjlkNTI3MWNiOTBmOTQ0N2RlYTdkNTIw
OTdjNmUwMTI2MTIwYzUyMWRkZWE4IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAK
Mi4zMS4xCgo=

--===============3811819281378722980==--

