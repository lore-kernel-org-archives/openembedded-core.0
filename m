Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941EFC7113D
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.145724.1673805744338180245
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HiL1fPZO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185b698c5e4-5fa94b84-daf8-49a1-8b68-b8df051874a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hbBsJ+h9VoQQQzGH/kqxVNgFJP8KJosGavpGZ09uf8g=;
	b=HiL1fPZOQax7Vy6cvtYjWBSmEi4ueblilWPZK9H1TkeWaWMr10I2d2ZoLEfrFXYt
	eyDLDIZ9ZFKTCAl/+752XOYmeQapE2tm1nDuONWMJY9oVXGYJ9ONAn58s9CxNwrwUAl
	Z6+fxHKB+IK3aLh3elT2CaD6ZATU2kh50InRw7rA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hbBsJ+h9VoQQQzGH/kqxVNgFJP8KJosGavpGZ09uf8g=;
	b=dXb/eL06nrZUsCgNvAH0bPuVEkU6quaLigTrBv0R+sQbgsSQTWRLso+8SrK9wI+M
	JwzvUDRQdoH8cPFG+2bcoeskbdY7T+oA9u0R6e5UdXxqYVT0slSkJdZyAnocWYC5PFa
	vsrXlRkXrff2usojCk9xBdL8eqw3VVbuacG7LiyU=
Content-Type: multipart/mixed; boundary="===============8783960249564668002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.14 SUCCEEDED
Message-ID: <01010185b698c5e4-5fa94b84-daf8-49a1-8b68-b8df051874a9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175924

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.13-1.26.14.patch
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
--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.13.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.14.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.13" to "1.26.14"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.13 [default] to 1.26.14 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 900718 to 900896 (+0%)
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.14.dist-info

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1698 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f53c89b8108d5ec93c2486a68120046f334175ee"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 10 Mirrors 0 Missed 16 Current 369 (38% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 378 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 395 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1135 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_fetch)
NOTE: Running task 1367 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1369 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_unpack)
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 395 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1375 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_patch)
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Started
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 395 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1434 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1436 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic unihash changed to afa659a3dcddd29f042e4f00a1efb6525d24436bf9c053ef45b2179ef96e4f88
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1437 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1492 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1496 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_install)
NOTE: Running task 1497 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Started
NOTE: Running task 1499 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1500 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1501 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1502 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package)
NOTE: Running task 1505 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_package)
NOTE: Running task 1507 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1509 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_write_rpm)
NOTE: Running task 1510 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_qa)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1511 tasks of which 1484 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography-vectors/38.0.4-r0/temp/log.do_packagedata.4014005
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata) failed with exit code '1'

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 52 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f53c89b8108d5ec93c2486a68120046f334175ee"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 216 Local 200 Mirrors 0 Missed 16 Current 193 (92% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 205 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 230 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_setscene)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 243 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_setscene)
NOTE: Running setscene task 254 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 804 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 811 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_fetch)
NOTE: Running task 826 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_fetch)
NOTE: Running task 828 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 904 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_unpack)
NOTE: Running task 905 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_unpack)
NOTE: Running task 906 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 907 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_unpack: Started
NOTE: Running task 916 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Succeeded
NOTE: Running task 922 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 923 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 268 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic unihash changed to afa659a3dcddd29f042e4f00a1efb6525d24436bf9c053ef45b2179ef96e4f88
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 281 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 945 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 286 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_package_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-38.0.4-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 297 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 409 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 409 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 357 of 409 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1366 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1464 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1528 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1529 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1539 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1541 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package)
NOTE: Running task 1544 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Succeeded
NOTE: Running task 1545 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1546 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_write_rpm)
NOTE: Running task 1547 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_qa)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Succeeded
NOTE: Running task 1553 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 1554 tasks of which 1510 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography-vectors/38.0.4-r0/temp/log.do_packagedata.4047330
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata) failed with exit code '1'

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 68 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f53c89b8108d5ec93c2486a68120046f334175ee"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 7 Mirrors 0 Missed 16 Current 372 (30% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata_setscene)
NOTE: Running task 1184 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_fetch)
NOTE: Running task 1329 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1436 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_unpack)
NOTE: Running task 1439 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1445 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_install)
NOTE: Running task 1491 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1492 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: Running task 1496 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic unihash changed to afa659a3dcddd29f042e4f00a1efb6525d24436bf9c053ef45b2179ef96e4f88
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1499 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1500 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1503 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_install)
NOTE: Running task 1505 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package)
NOTE: Running task 1507 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1509 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_write_rpm)
NOTE: Running task 1510 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_qa)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1511 tasks of which 1484 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography-vectors/38.0.4-r0/temp/log.do_packagedata.4026877
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata) failed with exit code '1'

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f53c89b8108d5ec93c2486a68120046f334175ee"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 7 Mirrors 0 Missed 16 Current 372 (30% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata_setscene)
NOTE: Running task 1184 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_fetch)
NOTE: Running task 1329 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1437 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1439 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_unpack)
NOTE: Running task 1440 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1443 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_install)
NOTE: Running task 1491 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1492 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1496 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: Running task 1498 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic unihash changed to afa659a3dcddd29f042e4f00a1efb6525d24436bf9c053ef45b2179ef96e4f88
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1499 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1500 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1504 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package)
NOTE: Running task 1507 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1509 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_write_rpm)
NOTE: Running task 1510 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_qa)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1511 tasks of which 1484 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography-vectors/38.0.4-r0/temp/log.do_packagedata.4020420
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata) failed with exit code '1'

--===============8783960249564668002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1696 targets, 75 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f53c89b8108d5ec93c2486a68120046f334175ee"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 7 Mirrors 0 Missed 17 Current 371 (29% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 380 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata_setscene)
NOTE: Running task 1184 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_fetch)
NOTE: Running task 1328 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1434 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_install)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1436 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_unpack)
NOTE: Running task 1437 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1441 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: Running task 1490 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_package_write_rpm)
NOTE: Running task 1491 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: Running task 1492 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1495 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1496 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: Running task 1498 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_lic unihash changed to afa659a3dcddd29f042e4f00a1efb6525d24436bf9c053ef45b2179ef96e4f88
NOTE: recipe python3-certifi-2022.12.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1499 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1500 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1502 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_compile: Succeeded
NOTE: Running task 1504 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: Running task 1505 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_package)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package)
NOTE: Running task 1507 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1509 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_write_rpm)
NOTE: Running task 1510 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb:do_package_qa)
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_qa: Succeeded
NOTE: recipe python3-urllib3-1.26.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1513 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1511 tasks of which 1483 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:39.0.0-r0 to 0:38.0.4-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-38.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography-vectors/38.0.4-r0/temp/log.do_packagedata.4033615
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb:do_packagedata) failed with exit code '1'

--===============8783960249564668002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.13-1.26.14.patch"

RnJvbSA2MzIwNjljOGM1MTkzY2ZmMzQ4NGY0OThkNmQwMDM5OGY1NmJjNDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6NDE6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMS4yNi4xMyAtPiAxLjI2LjE0CgotLS0KIC4uLi97cHl0
aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmJ9ICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJsbGliM18xLjI2LjEz
LmJiID0+IHB5dGhvbjMtdXJsbGliM18xLjI2LjE0LmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18xLjI2LjE0LmJiCnNp
bWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTQuYmIKaW5kZXggN2FmOTUxMTdjZi4u
ZjM1YTE0MWRmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVybGxpYjNfMS4yNi4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXJsbGliM18xLjI2LjE0LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vc2hhem93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jMjgyM2NiOTk1NDM5Yzk4NGZk
NjJhOTczZDc5ODE1YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMwODNkZDBkY2U2OGRiZmJl
MTEyOWQ1MjcxY2I5MGY5NDQ3ZGVhN2Q1MjA5N2M2ZTAxMjYxMjBjNTIxZGRlYTgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMDc2OTA3YmY4ZmQzNTVjZGU3NzcyODQ3MTMxNjYyNWE0ZDJmN2U3MTNj
MTI1ZjUxOTUzYmI1YjNlZWNmNGY3MiIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0g
CjIuMzcuMwoK

--===============8783960249564668002==--

