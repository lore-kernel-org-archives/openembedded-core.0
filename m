Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E70C021A5
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.17800.1736936770951580473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XU0z27vF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=E6otO61c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fcbac-e01f7bdc-ff7f-4dbf-bba6-bb5f7f3afb9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DYCa1GDayOvVEaS2sbTwwS+V3EFk4o4pP8QK9VlGru0=;
	b=XU0z27vF9mk9gLb5dUvImHkHFN2gIqQEXHSmrhlrSITMPsze2HNZVlme57MT/3co
	AdANP0GMV7TPscUYXaDxR8/xfVOQ468d2QInIPkQl64gsMvAB9koOAdNLFTuDQh3vTA
	AQsa7YlIYyLonhf1ixYti7+iGijasRMfvNveITcU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DYCa1GDayOvVEaS2sbTwwS+V3EFk4o4pP8QK9VlGru0=;
	b=E6otO61cWfnC9sMVrsSMTwBp0SCDb8TAyKOnXV9p8RTOewecWgSBjbdYAYffvniO
	I0N9WNl54Yfa+LhXJS+virL9Ffp/Re0ThsokXPLkiZwMDMgZVAxrSobfYXwGyUlvsor
	6MCGflOi8FsNmglDlLnYLTQuDOB6LiNbPcLpjB/k=
Content-Type: multipart/mixed; boundary="===============3548500333016115716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 25.0.0 SUCCEEDED
Message-ID: <01010194697fcbac-e01f7bdc-ff7f-4dbf-bba6-bb5f7f3afb9c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209846

--===============3548500333016115716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *25.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-24.3.0-25.0.0.patch
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
From 878daaf2d83b32669024836a4585b54c65271052 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:42:03 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 24.3.0 -> 25.0.0

---
 ...{python3-pyopenssl_24.3.0.bb => python3-pyopenssl_25.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.3.0.bb => python3-pyopenssl_25.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
index b8a980be42..6485f3e1ed 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf43a9a173b8138bb36"
+SRC_URI[sha256sum] = "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16"
 
 inherit pypi setuptools3
 
-- 
2.44.1


--===============3548500333016115716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-24.3.0.tar.gz;downloadfilename=pyopenssl-24.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.0.0.tar.gz;downloadfilename=pyopenssl-25.0.0.tar.gz"
packages/core2-64-poky-linux/python3-pyopenssl: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 24.3.0 [default] to 25.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "24.3.0" to "25.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 468976 to 469921 (+0%)
Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyOpenSSL-24.3.0.dist-info moved to /usr/lib/python3.13/site-packages/pyOpenSSL-25.0.0.dist-info

--===============3548500333016115716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 32 recipes from the core2-64 sysroot...done.
Removing 69 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bc2b3a4eee258fa83df005ae649e73f9e6198386"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 535 Local 524 Mirrors 0 Missed 11 Current 274 (97% match, 98% complete)
Removing 10 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 295 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 300 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 301 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 348 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa_setscene)
NOTE: Running setscene task 357 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 368 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-44.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 387 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-6.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-44.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 969 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_recipe_qa)
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2024.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-6.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.123.2/temp/log.do_packagedata_setscene.2768421
NOTE: recipe python3-pytz-2024.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb:do_package_setscene)
NOTE: recipe python3-bcrypt-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-44.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.81.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.81.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-44.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.81.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1059 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_fetch)
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 511 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1202 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_unpack)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 528 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 551 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.81.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1349 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_check_backend)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.81.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_check_backend: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_check_backend: Succeeded
NOTE: recipe libstd-rs-1.81.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 638 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 645 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 740 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2086 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2270 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb:do_packagedata)
NOTE: Running task 2297 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.123.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2306 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_install)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package)
NOTE: Running task 2310 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2312 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_create_spdx)
NOTE: Running task 2313 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_ipk)
NOTE: Running task 2314 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_deb)
NOTE: Running task 2315 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_rpm)
NOTE: Running task 2316 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2317 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_create_package_spdx)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2318 of 2318 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2318 tasks of which 2296 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.123.17-r0 to 0:6.123.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.123.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3548500333016115716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyOpenSSL-24.3.0.dist-info moved to /usr/lib/python3.13/site-packages/pyOpenSSL-25.0.0.dist-info

--===============3548500333016115716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-24.3.0-25.0.0.patch"

RnJvbSA4NzhkYWFmMmQ4M2IzMjY2OTAyNDgzNmE0NTg1YjU0YzY1MjcxMDUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6NDI6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyNC4zLjAgLT4gMjUuMC4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yNC4zLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjUuMC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzI0LjMu
MC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNS4wLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNC4zLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjAuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNS4wLjAuYmIKaW5kZXggYjhhOTgw
YmU0Mi4uNjQ4NWYzZTFlZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yNC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNS4wLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsIHB5dGhvbjMtY3J5cHRvZ3JhcGh5Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDlmN2EwMTk1NzdkODM0NzQ2YmM1NWM1ZmNlNmVjYmNl
YzBmMmI0ZWM1Y2UxY2Y0M2E5YTE3M2I4MTM4YmIzNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJj
ZDJjZWY3OTllZmEzOTM2YmIwOGU4Y2NiOTQzM2E1NzU3MjJiOWRkOTg2MDIzZjFjYWJjNGFlNjRl
OWRhYzE2IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi40NC4xCgo=

--===============3548500333016115716==--

