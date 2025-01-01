Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDECC02188
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11338.1735723944669444313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=alPlqYCx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2zgo3ozV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194213588f6-20e528b8-dc6a-4b73-ad4e-b91ead13a7c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MvbfuX5YgP9AY/nr3Do3ZEi0Efw4CjreszFK/xBrHp8=;
	b=alPlqYCxoQ92il+226bA1HiPMwxt0keRoRNUYtdoqWuu/n3/nvrSF2+dhndUrrd2
	4Hi7R8EDnnVzhoY8OAEjsR7xNOb5syU8k9AElKBtOstFCyvzqCRGBS4Ib+Iqlwue4IM
	ypkJNJkSXL2RxFODt70NuCkct3b7/eHUJ5h0ITwk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MvbfuX5YgP9AY/nr3Do3ZEi0Efw4CjreszFK/xBrHp8=;
	b=2zgo3ozVRnd1RIVeFhDqAkSmuZraK2JumDj+0BumRH1Zy15NkyHk2fgWrYxop8ut
	4dMsZ8DfNl5jPRfhIyM+LEmf600y6/3+Nsd/h5KrADc9qys9XasBHWzEoTexpNwrc39
	LxsRVLMEdlOioxmwzulkmLDfifvqkv5Kj4iWydy4=
Content-Type: multipart/mixed; boundary="===============6451875329925189502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 24.3.0 SUCCEEDED
Message-ID: <01010194213588f6-20e528b8-dc6a-4b73-ad4e-b91ead13a7c6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209210

--===============6451875329925189502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *24.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-24.2.0-24.3.0.patch
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
From 8d4d6e8845d2b8b0cfb600fdd97cd9b6ad68464a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 06:55:59 +0000
Subject: [PATCH] python3-attrs: upgrade 24.2.0 -> 24.3.0

---
 .../python/{python3-attrs_24.2.0.bb => python3-attrs_24.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_24.2.0.bb => python3-attrs_24.3.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb b/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-attrs_24.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_24.3.0.bb
index a6cb60a8c8..fa35e4b681 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
+SRC_URI[sha256sum] = "8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff"
 
 inherit pypi ptest python_hatchling
 
-- 
2.44.1


--===============6451875329925189502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-attrs: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-24.2.0.tar.gz;downloadfilename=attrs-24.2.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-24.3.0.tar.gz;downloadfilename=attrs-24.3.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PKGSIZE changed from 358237 to 360343 (+1%)
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-ptest: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-src: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "24.2.0" to "24.3.0"
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 399224 to 402022 (+1%)
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PKGV changed from 24.2.0 [default] to 24.3.0 [default]
packages/core2-64-poky-linux/python3-attrs/python3-attrs: PV changed from "24.2.0" to "24.3.0"
Changes to packages/core2-64-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.13/site-packages/attrs-24.2.0.dist-info moved to /usr/lib/python3.13/site-packages/attrs-24.3.0.dist-info

--===============6451875329925189502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.13/site-packages/attrs-24.2.0.dist-info moved to /usr/lib/python3.13/site-packages/attrs-24.3.0.dist-info

--===============6451875329925189502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-64 sysroot...done.
Removing 63 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:93118b901d6e8a786ccb9936f9398736068101b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 524 Local 506 Mirrors 0 Missed 18 Current 256 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 277 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 282 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 302 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 309 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 311 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 322 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 342 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 363 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 364 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 374 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_populate_lic_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 381 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 417 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 460 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 931 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_recipe_qa)
NOTE: recipe python3-pytest-8.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-24.3.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/base-passwd/3.6.5/temp/log.do_packagedata_setscene.1162570
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_package_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1163 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running task 1222 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-24.3.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_package_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 586 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-24.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 623 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 630 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 701 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 712 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1819 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1931 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata)
NOTE: Running task 2125 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-24.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2166 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_configure)
NOTE: recipe python3-attrs-24.3.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2167 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-24.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2168 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_compile)
NOTE: recipe python3-attrs-24.3.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2169 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-24.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2170 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_install)
NOTE: recipe python3-attrs-24.3.0-r0: task do_install: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-24.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2172 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_package)
NOTE: Running task 2173 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-24.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_packagedata)
NOTE: recipe python3-attrs-24.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2175 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_create_spdx)
NOTE: Running task 2176 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_ipk)
NOTE: Running task 2177 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_deb)
NOTE: Running task 2178 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_rpm)
NOTE: Running task 2179 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_qa)
NOTE: Running task 2180 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_package_write_ipk)
NOTE: recipe python3-attrs-24.3.0-r0: task do_create_spdx: Started
NOTE: Running task 2181 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_package_write_deb)
NOTE: Running task 2182 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_package_write_rpm)
NOTE: Running task 2183 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_qa: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2184 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-attrs-24.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-attrs-24.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_qa unihash changed to 906a093246545863f6a11280c3bfcda23b5bcbead0bc34df3868ccbfc679db85
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_deb unihash changed to a8005fd5b6d6dfe74de05e72a803f55372cd71aae993a40c65c807e0b84184e4
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_rpm unihash changed to 310d31e177a5705c8de7bbad6159f740abeaa7ce54de4ace3e1603949fda97d6
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_ipk unihash changed to de019c6aa96fa35348c47b9d156c1013578c86cdb0f72d035ca11ac073637bf9
NOTE: Running noexec task 2185 of 2185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2185 tasks of which 2157 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-src went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dbg went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-update went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-staticdev went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dev went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-doc went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-locale went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd went backwards which would break package feeds (from 0:3.6.6-r0 to 0:3.6.5-r0) [version-going-backwards]
ERROR: base-passwd-3.6.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6451875329925189502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-24.2.0-24.3.0.patch"

RnJvbSA4ZDRkNmU4ODQ1ZDJiOGIwY2ZiNjAwZmRkOTdjZDliNmFkNjg0NjRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNjo1NTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjQuMi4wIC0+IDI0LjMuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzI0LjIuMC5iYiA9PiBweXRob24zLWF0dHJzXzI0LjMuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzI0LjIuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzI0LjMuMC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjQuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI0LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjQuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjQuMy4wLmJiCmluZGV4IGE2Y2I2MGE4YzguLmZhMzVlNGI2ODEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNC4yLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI0LjMuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjZmIx
YjkxNDhiNWIwODY1NjliYWVjMDNmMjBkN2I2YmYzYmNhY2M5YTQyYmViZjg3ZmZhYWNhMzYyZjYz
NDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGY1YzA3MzMzZDU0MzEwMzU0MWJhN2JlMGUyY2Ux
NmVlZWU4MTMwY2IwYjNmOTIzOGFiOTA0Y2UxZTg1YmFmZiIKIAogaW5oZXJpdCBweXBpIHB0ZXN0
IHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40NC4xCgo=

--===============6451875329925189502==--

