Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8153C71135
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8869.1749993288265087895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Pz+qXSnN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e/Q2kz2S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019773ba77ca-58111bb3-1cd5-4ff1-a566-ef2a8397e09b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MlSPfDTimr5hkOua9bJKpB+brZxEgVDT4TkpoLYWXas=;
	b=Pz+qXSnNwUfY4mLSVyvPGzHE5GNuRLbVKKou2DAZL8MualuZGWd0xVlVZjxiIKo1
	gcDbHqGe5xBuNEJvtf6HITFGu/hGV4egs4ZoWtnvqQyK7tCTK5K3WIBLK3GVQIpVqDB
	6albz9s7p48DZIxbZYk30m0egm0CwRsDwgPsWhPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MlSPfDTimr5hkOua9bJKpB+brZxEgVDT4TkpoLYWXas=;
	b=e/Q2kz2SZD7fquPIX5yF4BwdMB1SF0AAlZEgeDo5aUkowDLWk3ThfSl6px4WlQy4
	OQ0r36ZI6/jTXwcEQfy63RoLiQnVj+RHG91PftGrQBYv6LfW4Gn6gfj5aTxKySBvN+g
	srSMErQXXqSpcz/ZfAZwvZuXCrFtTGslxqr+96us=
Content-Type: multipart/mixed; boundary="===============9137787201694600393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.32.4 SUCCEEDED
Message-ID: <0101019773ba77ca-58111bb3-1cd5-4ff1-a566-ef2a8397e09b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218690

--===============9137787201694600393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-requests* to *2.32.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.32.3-2.32.4.patch
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
From c4005378fccfc78d1ba17122f3bb14a5cc590d59 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:52:30 +0000
Subject: [PATCH] python3-requests: upgrade 2.32.3 -> 2.32.4

---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index bc9b2289f6..49d44298f6 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============9137787201694600393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (0 cached, 935 parsed). 1911 targets, 47 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-64 sysroot...done.
Removing 63 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:56804cde861048c032c29edb74b78909714ae1f0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 545 Local 536 Mirrors 0 Missed 9 Current 256 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 257 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_qa_setscene)
NOTE: Running setscene task 285 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 301 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 309 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 312 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 321 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 330 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa_setscene)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 339 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 347 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 356 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_populate_lic_setscene)
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 365 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 367 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 369 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 374 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 382 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_create_spdx_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 396 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 406 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 411 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 421 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-certifi/2025.4.26/temp/log.do_packagedata_setscene.1911495
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytest/8.3.5/temp/log.do_packagedata_setscene.1911494
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 428 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 434 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-cryptography/45.0.3/temp/log.do_packagedata_setscene.1911855
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_setscene)
NOTE: Running setscene task 469 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 473 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 532 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_package_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 591 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 607 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 640 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 663 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 741 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1315 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1535 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_packagedata)
NOTE: Running task 2127 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata)
NOTE: recipe python3-requests-2.32.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_packagedata: Started
NOTE: Running task 2209 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata)
NOTE: Running task 2217 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2259 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_configure)
NOTE: recipe python3-requests-2.32.4-r0: task do_configure: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_configure: Succeeded
NOTE: Running task 2260 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_compile)
NOTE: recipe python3-requests-2.32.4-r0: task do_compile: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_install)
NOTE: recipe python3-requests-2.32.4-r0: task do_install: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_install: Succeeded
NOTE: Running task 2262 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package)
NOTE: Running task 2263 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.32.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_populate_sysroot unihash changed to 3e42e44c97fab8c728ea54fb6cf663c5bd95508eec611cf12979002252190bde
NOTE: Setscene tasks completed
NOTE: recipe python3-requests-2.32.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package unihash changed to 64447393b37b4433da0f07cef5f43c16fde066f3bfde6bce7a7b71059fe5f595
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_deb became valid
NOTE: Running setscene task 796 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 799 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 801 of 801 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2265 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_create_spdx)
NOTE: Running task 2268 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_rpm)
NOTE: Running task 2269 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_qa)
NOTE: recipe python3-requests-2.32.4-r0: task do_create_spdx: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-requests-2.32.4-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_qa unihash changed to 66d74d7cec1400a78887c7363169fe6e43f0abcc9d31044c6f6efa4cea7d82bc
NOTE: Running task 2270 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_create_package_spdx)
NOTE: recipe python3-requests-2.32.4-r0: task do_create_package_spdx: Started
NOTE: recipe python3-requests-2.32.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_package_write_rpm unihash changed to 609da373aee3c47549b3e006165535ed4f168f93d9a28c0e050bf37dd3124835
NOTE: recipe python3-requests-2.32.4-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2271 of 2271 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2271 tasks of which 2253 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2025.6.15-r0 to 0:2025.4.26-r0) [version-going-backwards]
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:8.4.0-r0 to 0:8.3.5-r0) [version-going-backwards]
ERROR: python3-certifi-2025.4.26-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pytest-8.3.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:45.0.4-r0 to 0:45.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-45.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9137787201694600393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-requests: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.3.tar.gz;downloadfilename=requests-2.32.3.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.4.tar.gz;downloadfilename=requests-2.32.4.tar.gz"
packages/core2-64-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-src: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests: PKGV changed from 2.32.3 [default] to 2.32.4 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests: PV changed from "2.32.3" to "2.32.4"
packages/core2-64-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 413174 to 413362 (+0%)
Changes to packages/core2-64-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.13/site-packages/requests-2.32.3.dist-info moved to /usr/lib/python3.13/site-packages/requests-2.32.4.dist-info

--===============9137787201694600393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.32.3-2.32.4.patch"

RnJvbSBjNDAwNTM3OGZjY2ZjNzhkMWJhMTcxMjJmM2JiMTRhNWNjNTkwZDU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6NTI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlcXVlc3RzOiB1cGdyYWRlIDIuMzIuMyAtPiAyLjMyLjQKCi0tLQogLi4uL3tweXRo
b24zLXJlcXVlc3RzXzIuMzIuMy5iYiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzIuNC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZXF1ZXN0c18yLjMyLjMu
YmIgPT4gcHl0aG9uMy1yZXF1ZXN0c18yLjMyLjQuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzIuMy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjMyLjQuYmIKc2lt
aWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJlcXVlc3RzXzIuMzIuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzIuNC5iYgppbmRleCBiYzliMjI4OWY2Li40
OWQ0NDI5OGY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmVxdWVzdHNfMi4zMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yZXF1ZXN0c18yLjMyLjQuYmIKQEAgLTcsNyArNyw3IEBAIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1w
eXRob24zLXJlcXVlc3RzLnNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU1MzY1NDE3
NzM0ZWIxODI1NTU5MGE5ZmY5ZWI5N2U5ZTFkYTg2OGQ0Y2NkNjQwMjM5OWVhZjY4YWYyMGE3NjAi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjdkMDMxNjY4MmM4YTI5ODM0ZDMyNjQ4MjAwMjRiNjJh
MzY5NDIwODNkNTJjYWYyZjE0YzA1OTEzMzZkMzQyMiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9z
ZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi40Ny4xCgo=

--===============9137787201694600393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.13/site-packages/requests-2.32.3.dist-info moved to /usr/lib/python3.13/site-packages/requests-2.32.4.dist-info

--===============9137787201694600393==--

