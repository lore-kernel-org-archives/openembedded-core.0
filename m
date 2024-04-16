Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E781DC27C79
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13588.1713248038694395223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WE8Q456k;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hWA7GbiC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6e77-22f4d997-2b74-46fe-a066-4277642945fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=epQJUAyXl3fAvNAksuueU3P6LATP6++azNeYZpvMjTY=;
	b=WE8Q456kvixGl4hBQmxjC3mHrWdVtUEQRSFbOCBvRbqUxiX1801S6GQ613UuVMqa
	+TZFKFRyTPglhJBzGvtsuxh5rUCg6+fVV1gcsppzNYFGPIryP2SjzZCbdsZMC1fGzx+
	2WEj1A1jO52CoB4hWuiIQ+URUghFBpaEADffTNYk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=epQJUAyXl3fAvNAksuueU3P6LATP6++azNeYZpvMjTY=;
	b=hWA7GbiCNUcELq6PAIzezqW6VyZRk8kh4IyC8ptn22L1oJTYajiB5/eshBYG8sk3
	F5bC2YT7yapC2pfVPVNt9KVJS0THo8W7l3m+7454NnzCuGFNz5Lpf9z0AbPby+VFNC8
	H9CYjTdOXM5X9e/rndzBBB8dLiKcLAZGt4+YAavE=
Content-Type: multipart/mixed; boundary="===============6071199729628251676=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.3.0 SUCCEEDED
Message-ID: <0101018ee58a6e77-22f4d997-2b74-46fe-a066-4277642945fd-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198283

--===============6071199729628251676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-license-expression* to *30.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-license-expression-upgrade-30.2.0-30.3.0.patch
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
From 07fd920d75f2fe7cc4f98f93f76582b19ab67a76 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:18:53 +0000
Subject: [PATCH] python3-license-expression: upgrade 30.2.0 -> 30.3.0

---
 ...xpression_30.2.0.bb => python3-license-expression_30.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.2.0.bb => python3-license-expression_30.3.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
index 7059cf76ee..f36336b592 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "599928edd995c43fc335e0af342076144dc71cb858afa1ed9c1c30c4e81794f5"
+SRC_URI[sha256sum] = "1295406f736b4f395ff069aec1cebfad53c0fcb3cf57df0f5ec58fc7b905aea5"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.42.0


--===============6071199729628251676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.12/site-packages/license_expression-30.2.0.dist-info moved to /usr/lib/python3.12/site-packages/license_expression-30.3.0.dist-info

--===============6071199729628251676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license-expression/license-expression-30.2.0.tar.gz;downloadfilename=license-expression-30.2.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/l/license-expression/license-expression-30.3.0.tar.gz;downloadfilename=license-expression-30.3.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGSIZE changed from 1083406 to 1100253 (+2%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1077511 to 1094561 (+2%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.2.0" to "30.3.0"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.2.0 [default] to 30.3.0 [default]
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.12/site-packages/license_expression-30.2.0.dist-info moved to /usr/lib/python3.12/site-packages/license_expression-30.3.0.dist-info

--===============6071199729628251676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-64 sysroot...done.
Removing 71 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c92bf9cfa66eae9dd571f9b4d24094b9c55da961"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c92bf9cfa66eae9dd571f9b4d24094b9c55da961"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 588 Local 584 Mirrors 0 Missed 4 Current 218 (99% match, 99% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 224 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 225 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 226 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_create_runtime_spdx_setscene)
NOTE: Running setscene task 228 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 229 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 230 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 231 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 233 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 235 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 236 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 238 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 239 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_create_runtime_spdx_setscene: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 240 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 241 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_create_runtime_spdx_setscene: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 243 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 246 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 257 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 258 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 259 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 271 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 275 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 276 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 277 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-license-expression-30.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-importlib-metadata/7.0.1/temp/log.do_packagedata_setscene.1261351
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 282 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_package_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 316 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 453 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-license-expression-30.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_package_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1024 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 551 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1070 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1071 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1123 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: Running task 1149 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 648 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 674 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 679 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 696 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1435 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1526 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1548 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f3e9448710bfe402a50cb387ef35094ffc5723fb0444a77f116da6833f759bc0 to hashserv.yocto.io:8686 ({'taskhash': 'c33fbdb8b83fff0f0ab9d2af2166252565bd5a1571d8b66c445a5816ee948354', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f3e9448710bfe402a50cb387ef35094ffc5723fb0444a77f116da6833f759bc0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed c33fbdb8b83fff0f0ab9d2af2166252565bd5a1571d8b66c445a5816ee948354 -> f3e9448710bfe402a50cb387ef35094ffc5723fb0444a77f116da6833f759bc0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 806 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2224 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata: Succeeded
NOTE: Running noexec task 2283 of 2283 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2283 tasks of which 2272 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6071199729628251676==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.2.0-30.3.0.patch"

RnJvbSAwN2ZkOTIwZDc1ZjJmZTdjYzRmOThmOTNmNzY1ODJiMTlhYjY3YTc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MTg6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbjogdXBncmFkZSAzMC4yLjAgLT4gMzAuMy4wCgotLS0K
IC4uLnhwcmVzc2lvbl8zMC4yLjAuYmIgPT4gcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAu
My4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbGljZW5z
ZS1leHByZXNzaW9uXzMwLjIuMC5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4z
LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjMuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4zLjAuYmIKaW5kZXgg
NzA1OWNmNzZlZS4uZjM2MzM2YjU5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4yLjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC4zLjAu
YmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9uZXhCL2xp
Y2Vuc2UtZXhwcmVzc2lvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL2FwYWNoZS0yLjAuTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4
OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OTk5MjhlZGQ5OTVjNDNmYzMz
NWUwYWYzNDIwNzYxNDRkYzcxY2I4NThhZmExZWQ5YzFjMzBjNGU4MTc5NGY1IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjEyOTU0MDZmNzM2YjRmMzk1ZmYwNjlhZWMxY2ViZmFkNTNjMGZjYjNjZjU3
ZGYwZjVlYzU4ZmM3YjkwNWFlYTUiCiAKIGluaGVyaXQgcHlwaSBwdGVzdCBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiAKLS0gCjIuNDIuMAoK

--===============6071199729628251676==--

