Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4656BC3ABB5
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1796.1746113622173644617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BT+KqTMX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=C/EUI3vT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101968c7b6e11-43ec815c-13b6-4ee2-8c4d-1fe4082f0b37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113621;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XZOPVMbCSM2yGSWCdS5bwvD+IXw7U2cfJu9WQ8/3pXA=;
	b=BT+KqTMXnbpgFcNkWJLBzedNXFvDk6PEgLti/pt2Q2NjygYoMN9AkEZYfseuc56t
	RO8NduLx/Ch9j7xcLT706vok4as2mVufEyZhUCrbUPUypEcQ8P85w4P46Uyjv3deHaR
	cNgxJzvIMuM873s36IYscytQoYWKw+49Yi1q/XlM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113621;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XZOPVMbCSM2yGSWCdS5bwvD+IXw7U2cfJu9WQ8/3pXA=;
	b=C/EUI3vTF8L0hEnyptCTxZwTDPjMb0aCXA5c0ZZtI3CxO866KyomtjXSukpzpV9H
	gBwnVtJNMM39wsUxuz94kXPL/C1F5aTZ+b/BR0hyuMXGJ78WtHFYXC7XVf/zRAEoFTA
	uzXnYJD9oADJLIBC1Hl+YbEoLK8uiARQaM89SQrI=
Content-Type: multipart/mixed; boundary="===============5870413041700298777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.11.1 SUCCEEDED
Message-ID: <010101968c7b6e11-43ec815c-13b6-4ee2-8c4d-1fe4082f0b37-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215823

--===============5870413041700298777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch
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
From a5f57d58caddaca012d127197c92a16857221437 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:23:23 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.11.0 -> 1.11.1

---
 ...uptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
index fd6ebf2f61..417ded009e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
+SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============5870413041700298777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-64 sysroot...done.
Removing 64 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:430b9d7bfa7c86bfe872b581ff59ca9aee4bf7cf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 516 Local 506 Mirrors 0 Missed 10 Current 267 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 270 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 271 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 292 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 294 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 305 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 313 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 318 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 319 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 323 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 333 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 336 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 340 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 341 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 345 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 355 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 365 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 366 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 370 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 375 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 379 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 380 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-wheel-0.45.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 382 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-0.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 385 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_25.0.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-25.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 403 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 404 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wheel-0.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 408 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pip/25.0.1/temp/log.do_packagedata_setscene.3467551
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_25.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 409 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-packaging/24.2/temp/log.do_packagedata_setscene.3467549
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 410 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_package_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_25.0.1.bb:do_package_setscene)
NOTE: Running setscene task 449 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 488 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-0.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-0.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 520 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pip-25.0.1-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 572 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 591 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 596 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-24.2-r0: task do_package_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pip-25.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 655 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_25.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-25.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-25.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 712 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 713 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1105 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_fetch: Started
NOTE: Running setscene task 727 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 735 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1166 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1286 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 743 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1464 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1465 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_rust_gen_targets)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 751 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_deploy_source_date_epoch unihash changed to e8b07f4570605db5ca1646464eea32b91261f147cd885a1ef727ce33cf47a13e
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1902 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2112 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_25.0.1.bb:do_packagedata)
NOTE: Running task 2114 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata)
NOTE: Running task 2129 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pip-25.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-25.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2169 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2170 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_configure)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2171 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_compile)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2172 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package)
NOTE: Running task 2174 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 2175 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_packagedata unihash changed to 894320a7025f7bfa87add70526277386396c1da6667a2ac1dcad18410487d831
NOTE: Setscene tasks completed
NOTE: Running task 2176 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_create_spdx)
NOTE: Running task 2177 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_ipk)
NOTE: Running task 2178 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_deb)
NOTE: Running task 2179 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_rpm)
NOTE: Running task 2180 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2181 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_create_package_spdx)
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_qa unihash changed to 57962d244f2a4019df930323a81311921a6a7f6a7579551ce41f7e52571855d8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_ipk unihash changed to 52b14345001ae7ef33efc6a0264132316c364f16aa1bc61d9ea0e065433418db
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_deb unihash changed to 8a34cbaef4e3078c7c14a1d657912f8f2993c0a1bc8e99017a40d4daeba37c81
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_package_write_rpm unihash changed to 3edb05766c6b5d4925eb1d65e280230f3a2c75d97b1a1f279c143b3692bf2608
NOTE: recipe python3-setuptools-rust-1.11.1-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2182 of 2182 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2182 tasks of which 2159 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:25.1-r0 to 0:25.0.1-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-ptest went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-25.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:25.0-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-packaging-24.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5870413041700298777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.0.tar.gz;downloadfilename=setuptools_rust-1.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.1.tar.gz;downloadfilename=setuptools_rust-1.11.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 165313 to 166806 (+1%)
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============5870413041700298777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============5870413041700298777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch"

RnJvbSBhNWY1N2Q1OGNhZGRhY2EwMTJkMTI3MTk3YzkyYTE2ODU3MjIxNDM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOToyMzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKCi0tLQogLi4u
dXB0b29scy1ydXN0XzEuMTEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXJ1c3RfMS4xMS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYn0gKDkx
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYgppbmRleCBmZDZlYmYyZjYxLi40MTdkZWQwMDll
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYgpAQCAtOSw3ICs5LDcgQEAgQlVHVFJBQ0tF
UiA9ICJodHRwczovL2dpdGh1Yi5jb20vUHlPMy9zZXR1cHRvb2xzLXJ1c3QvaXNzdWVzIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFj
ZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3
NjVkNjZmM2RlZjZmZGM4NWUxZTZkODg5YzZhODEyYWVhMTQzMGM4ZGFkY2YxYzdiNjc3OWI0NWY4
NzRmYjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2RhYmM0MzkyMjUyY2VkMzE0YjgwNTBkNjMy
NzZlMDVmZGM1ZDMyMzk4ZmM3ZDNjY2UxZjZhNmFjMzViNzZjMCIKIAogUFlQSV9QQUNLQUdFID0g
InNldHVwdG9vbHNfcnVzdCIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElf
UEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============5870413041700298777==--

