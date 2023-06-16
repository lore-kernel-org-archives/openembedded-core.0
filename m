Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3BFC27C78
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.831.1686887483635200542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KwOsFvTp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188c25445be-54df5fe5-c3a7-4b4f-bc90-2b6394e6cd9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ste1Co3ythWQrkNuO5S+5eZs1HuaBpuENBZeNZDwic0=;
	b=KwOsFvTpy41W6cv5epKRp38sjOnZFxbeZEk9zOoPT3ZhRCD/wEkFW0gVrL6qceFj
	5fuA6IrUQPDZpjgp9BRYUCQVcWWrPHn7pdPgsahLeSdjE5nJowAVM4AdfcQSa8Qle+x
	a0T0EyEqGuUlYfvWqZX1FbYoNZZuxusrMWprzf8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ste1Co3ythWQrkNuO5S+5eZs1HuaBpuENBZeNZDwic0=;
	b=F4QKsS8CBaqLdqVpz42qBHa+8h0m1Hcp9sIGVTzfrRbiadv71UX/xSOQocz7DRaI
	3HTKwdcVTaFOYvDw4qge/wNeBUWy98h6jc8pujxoLuWxCAHIllqpFAKV37Pow2coP55
	nr7iod8AM3mZ1WJ+xd/eePsnS2nnB7uRqkEUDZxQ=
Content-Type: multipart/mixed; boundary="===============6236442197990608771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 23.2.0 SUCCEEDED
Message-ID: <01010188c25445be-54df5fe5-c3a7-4b4f-bc90-2b6394e6cd9e-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182930

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *23.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-23.1.1-23.2.0.patch
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
From 63f348e0380ea2d157196270eed1546f19bc0e49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:42:24 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 23.1.1 -> 23.2.0

---
 ...{python3-pyopenssl_23.1.1.bb => python3-pyopenssl_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.1.1.bb => python3-pyopenssl_23.2.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
index 90a6252f7c..86ae406ffb 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "841498b9bec61623b1b6c47ebbc02367c07d60e0e195f19790817f10cc8db0b7"
+SRC_URI[sha256sum] = "276f931f55a452e7dea69c7173e984eb2a4407ce413c918aa34b55f82f9b8bac"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.39.2


--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8449a30003c1ded0b7d5b867f5714e3fa40a0f8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 8 Mirrors 0 Missed 52 Current 441 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1026 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1102 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1234 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1284 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1285 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_fetch)
NOTE: Running task 1286 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1363 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1429 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 1430 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1432 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1433 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1435 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1436 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1580 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1581 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: Running task 1604 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1607 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1609 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1610 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1611 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1614 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 1616 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1617 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1618 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1619 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1620 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1621 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: Running task 1625 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1626 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1628 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1630 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1631 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1632 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1633 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1635 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic unihash changed to db5f5cec498ecd5d63550a3b7a734d1cf8575626a52a755647f4fcfca604c9a9
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1638 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1639 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1640 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1641 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1642 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1645 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1646 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: Running task 1647 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1648 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: Running task 1649 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1650 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1651 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1653 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1654 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: Running task 1656 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: Running task 1658 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1659 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1660 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1661 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1662 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1664 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: Running task 1665 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1667 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1672 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1677 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1679 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 1680 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: Running task 1682 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1683 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1688 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1689 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1691 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1692 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1692 tasks of which 1589 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-iso8601/1.1.0-r0/temp/log.do_packagedata.2154103
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata) failed with exit code '1'

--===============6236442197990608771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-23.1.1-23.2.0.patch"

RnJvbSA2M2YzNDhlMDM4MGVhMmQxNTcxOTYyNzBlZWQxNTQ2ZjE5YmMwZTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6NDI6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyMy4xLjEgLT4gMjMuMi4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yMy4xLjEuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjMuMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzIzLjEu
MS5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yMy4yLjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMy4xLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjIuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMy4yLjAuYmIKaW5kZXggOTBhNjI1
MmY3Yy4uODZhZTQwNmZmYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yMy4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yMy4yLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsICR7UFlUSE9OX1BOfS1jcnlwdG9ncmFw
aHkiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDE0OThiOWJlYzYxNjIzYjFiNmM0N2ViYmMw
MjM2N2MwN2Q2MGUwZTE5NWYxOTc5MDgxN2YxMGNjOGRiMGI3IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjI3NmY5MzFmNTVhNDUyZTdkZWE2OWM3MTczZTk4NGViMmE0NDA3Y2U0MTNjOTE4YWEzNGI1
NWY4MmY5YjhiYWMiCiAKIFBZUElfUEFDS0FHRSA9ICJweU9wZW5TU0wiCiBpbmhlcml0IHB5cGkg
c2V0dXB0b29sczMKLS0gCjIuMzkuMgoK

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyopenssl: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.1.1.tar.gz;downloadfilename=pyOpenSSL-23.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.2.0.tar.gz;downloadfilename=pyOpenSSL-23.2.0.tar.gz"
packages/core2-32-poky-linux/python3-pyopenssl: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "23.1.1" to "23.2.0"
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 517290 to 528530 (+2%)
packages/core2-32-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 23.1.1 [default] to 23.2.0 [default]
Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-23.1.1.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.2.0.dist-info

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8449a30003c1ded0b7d5b867f5714e3fa40a0f8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 8 Mirrors 0 Missed 52 Current 441 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1026 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1102 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1234 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1284 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1285 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1286 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_fetch)
NOTE: Running task 1363 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1429 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1430 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1431 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1432 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 1433 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1436 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1602 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1604 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1605 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1607 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 1608 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1609 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_unpack)
NOTE: Running task 1610 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1611 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1612 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1613 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1614 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1616 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1617 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1618 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 1619 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1620 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1621 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1625 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1626 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1628 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1629 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1630 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1631 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1632 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1633 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1635 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1636 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic unihash changed to db5f5cec498ecd5d63550a3b7a734d1cf8575626a52a755647f4fcfca604c9a9
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1638 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1639 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1640 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1641 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1642 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1643 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1644 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1646 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1647 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: Running task 1648 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1649 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: Running task 1650 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: Running task 1651 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1652 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1653 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1655 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1656 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1658 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1659 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: Running task 1660 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Succeeded
NOTE: Running task 1661 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1662 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1663 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1664 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1667 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1672 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 1675 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1677 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1679 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 1680 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: Running task 1682 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install_ptest_base)
NOTE: Running task 1683 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: Running task 1686 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1687 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: Running task 1688 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1690 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1691 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1691 tasks of which 1589 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-iso8601/1.1.0-r0/temp/log.do_packagedata.2213764
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata) failed with exit code '1'

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8449a30003c1ded0b7d5b867f5714e3fa40a0f8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 8 Mirrors 0 Missed 52 Current 441 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1026 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1102 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1234 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1284 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1285 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1286 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_fetch)
NOTE: Running task 1363 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1430 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 1431 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1432 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1433 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1434 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 1436 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1602 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1603 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: Running task 1604 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: Running task 1605 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: Running task 1606 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1607 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 1608 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1609 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_unpack)
NOTE: Running task 1610 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 1611 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1613 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1614 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1615 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1616 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1617 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1618 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 1619 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1620 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1621 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 1625 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1626 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1628 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1629 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: Running task 1630 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1631 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1632 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1633 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1635 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic unihash changed to db5f5cec498ecd5d63550a3b7a734d1cf8575626a52a755647f4fcfca604c9a9
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1638 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1639 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1640 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: Running task 1641 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Succeeded
NOTE: Running task 1642 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1644 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1645 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: Running task 1646 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1647 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1648 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1650 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1651 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1652 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1653 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1654 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running task 1655 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1656 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: Running task 1658 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1659 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: Running task 1660 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1661 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: Running task 1662 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1663 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1664 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1665 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1667 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: Running task 1670 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Started
NOTE: Running task 1673 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1675 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1676 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1678 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1679 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1680 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1682 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1683 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Started
NOTE: Running task 1684 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1686 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1687 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1690 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: Running task 1691 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: Running task 1693 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1693 tasks of which 1589 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-iso8601/1.1.0-r0/temp/log.do_packagedata.2402721
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata) failed with exit code '1'

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.11/site-packages/pyOpenSSL-23.1.1.dist-info moved to /usr/lib/python3.11/site-packages/pyOpenSSL-23.2.0.dist-info

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8449a30003c1ded0b7d5b867f5714e3fa40a0f8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 8 Mirrors 0 Missed 52 Current 441 (13% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1026 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1102 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 1234 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1284 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1285 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1286 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_fetch)
NOTE: Running task 1363 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 1429 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 1430 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 1432 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1433 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1434 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 1435 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: Running task 1602 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 1603 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: Running task 1604 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1605 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1606 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_unpack)
NOTE: Running task 1607 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1608 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 1609 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1610 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1611 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 1612 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1613 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1614 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1615 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 1616 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1617 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1618 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: Running task 1619 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1620 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1621 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: Running task 1622 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: Running task 1623 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Succeeded
NOTE: Running task 1625 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1626 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: Running task 1627 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: Running task 1628 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1630 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: Running task 1631 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1633 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1635 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1636 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Succeeded
NOTE: Running task 1638 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic unihash changed to db5f5cec498ecd5d63550a3b7a734d1cf8575626a52a755647f4fcfca604c9a9
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1639 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1640 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1641 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1642 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1645 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1646 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1647 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1648 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1649 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1652 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1653 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1654 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1656 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1658 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1659 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1660 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1661 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1662 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile)
NOTE: Running task 1663 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: Running task 1664 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: Running task 1665 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1667 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1672 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: Running task 1673 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1675 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1676 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: Running task 1678 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1679 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: Running task 1680 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1683 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: Running task 1685 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1686 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1687 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: Running task 1691 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: Running task 1692 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: Running task 1693 of 1756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1693 tasks of which 1589 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-iso8601/1.1.0-r0/temp/log.do_packagedata.2268047
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata) failed with exit code '1'

--===============6236442197990608771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8449a30003c1ded0b7d5b867f5714e3fa40a0f8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 262 Local 192 Mirrors 0 Missed 70 Current 262 (73% match, 86% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 263 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 524 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 524 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: recipe meson-native-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 733 of 1821 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_rust_gen_targets)
NOTE: Running task 778 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 779 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 782 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 783 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 813 of 1821 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe meson-native-1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 862 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: Running task 866 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 897 of 1821 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 929 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 932 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 937 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_fetch)
NOTE: Running task 938 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 950 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_fetch)
NOTE: Running task 960 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 961 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_fetch)
NOTE: Running task 963 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_fetch)
NOTE: Running task 964 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: Running task 965 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 966 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: Running setscene task 355 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.21-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 1821 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_compile)
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 1059 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 1060 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_unpack)
NOTE: Running task 1061 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1062 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_unpack)
NOTE: Running task 1063 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 1064 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_unpack)
NOTE: Running task 1065 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1066 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1067 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: Running task 1068 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: recipe meson-native-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: Running task 1089 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running task 1096 of 1821 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_install)
NOTE: Running task 1097 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 1098 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: Running task 1099 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_patch)
NOTE: Running task 1100 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1102 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_patch)
NOTE: Running task 1107 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1108 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_patch)
NOTE: Running task 1109 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_patch)
NOTE: Running task 1110 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1111 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running task 1123 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: Running task 1128 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_install: Started
NOTE: Running task 1129 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1130 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1131 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1142 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycparser-2.21-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1144 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1145 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_patch: Succeeded
NOTE: Running task 1146 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1152 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 1153 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1154 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1163 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_populate_lic unihash changed to db5f5cec498ecd5d63550a3b7a734d1cf8575626a52a755647f4fcfca604c9a9
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1172 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1174 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 417 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: Running setscene task 423 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1179 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1187 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1188 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1463 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1464 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1554 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1555 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: Running task 1613 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: Running task 1615 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1639 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1642 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1643 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1644 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1678 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1680 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1681 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1682 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure)
NOTE: Running task 1683 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pycparser-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1684 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1685 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Started
NOTE: Running task 1686 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 1687 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Started
NOTE: Running task 1688 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Started
NOTE: Running task 1689 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_configure_ptest_base)
NOTE: recipe python3-pycparser-2.21-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_compile)
NOTE: Running task 1691 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Started
NOTE: Running task 1692 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1693 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1694 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1695 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: Running task 1697 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_install)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile: Succeeded
NOTE: Running task 1701 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_compile_ptest_base)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1702 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_install)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1703 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Started
NOTE: Running task 1704 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: Running task 1706 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1708 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1709 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_package)
NOTE: recipe python3-pycparser-2.21-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot)
NOTE: Running task 1711 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: Running task 1713 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 1714 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 1715 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1716 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_install_ptest_base)
NOTE: Running task 1717 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Started
NOTE: Running task 1720 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: Running task 1721 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1723 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: Running task 1724 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-pycparser-2.21-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: Running task 1726 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata: Failed
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1727 tasks of which 1596 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.1.0-r0) [version-going-backwards]
ERROR: python3-iso8601-1.1.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-iso8601/1.1.0-r0/temp/log.do_packagedata.2515226
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata) failed with exit code '1'

--===============6236442197990608771==--

