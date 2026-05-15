Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C86CD5BB8
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34829.1778851231040779576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IxQJBuBi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uDmtnDS6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e2bcbbae5-b8731081-b137-4365-967f-c11884787bb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851232;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rEjaFDqwgSqiljuXIhzzYPmKN5lIyYhkCZ9AkaiP1ak=;
	b=IxQJBuBi3YnYjqIPeyD441xm2V0c7e34zUbscWsEb8KNaW84KOrDAX/ETeHCnyab
	z1kaVxaHeCqulM2sXM21r3IKqrC19oF0+BTPRmr+vH/CbpvIW3OlCrUVlEDOJ77oO6V
	KQUgnIhT/Rbk3BuCrdFknpCqto7XKRZv4go3zS7U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851232;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rEjaFDqwgSqiljuXIhzzYPmKN5lIyYhkCZ9AkaiP1ak=;
	b=uDmtnDS6M2mIMgCtocy727WuBqD+Yh3TD676jFgfZaIbHvPYbrHXgv/qnSKCyyzv
	hNe/yGIt7QfBz/6Jjb4EGfrau1rqC5R9PA29iDvfazidb4p/wu8XgMd1JPFY0cdpaEO
	oA+1y/L9JF2bgIVaBRMBb+tTU7DFRj5pV/nNgqII=
Content-Type: multipart/mixed; boundary="===============5950467346506031984=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 26.2.0 SUCCEEDED
Message-ID: <0101019e2bcbbae5-b8731081-b137-4365-967f-c11884787bb6-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237121

--===============5950467346506031984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *26.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-26.1.0-26.2.0.patch
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
From d2a2e462b9aef4aebdaa274e16a9fe08d2337ff0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 08:56:43 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 26.1.0 -> 26.2.0

---
 ...{python3-pyopenssl_26.1.0.bb => python3-pyopenssl_26.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.1.0.bb => python3-pyopenssl_26.2.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
index 6163093ca9..9660a03f89 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b"
+SRC_URI[sha256sum] = "8c6fcecd1183a7fc897548dfe388b0cdb7f37e018200d8409cf33959dbe35387"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============5950467346506031984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e811fd0450037a395b57ba836494cb19e7f3afbf"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:e811fd0450037a395b57ba836494cb19e7f3afbf"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 592 Local 539 Mirrors 0 Missed 53 Current 361 (91% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 385 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 392 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 393 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 427 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 449 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 501 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-poetry-core-native-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 511 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-psutil-7.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 563 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-native-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cffi-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.13.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 586 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 603 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-uv-build-native-0.11.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 607 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycparser-3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-cryptography-46.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-native-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-uv-build-native-0.11.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 617 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-native-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-uv-build-native-0.11.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 685 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 689 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-native-3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-uv-build-native-0.11.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cffi-native-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 695 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-native-3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 953 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 726 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-native-3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycparser-native-3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 817 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 849 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 851 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 892 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1164 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1319 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_fetch)
NOTE: Running task 1340 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_fetch)
NOTE: Running task 1343 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_fetch)
NOTE: Running task 1350 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_fetch)
NOTE: Running task 1351 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1378 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_recipe_qa)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1401 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycparser-3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_fetch: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_fetch: Started
NOTE: Running task 1512 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_fetch)
NOTE: Running task 1513 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_fetch)
NOTE: Running task 1515 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_fetch)
NOTE: Running task 1516 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1539 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1567 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1602 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_fetch: Started
NOTE: Running task 1603 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1604 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: recipe python3-cffi-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1605 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1668 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_patch)
NOTE: Running task 1671 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_fetch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-46.0.7-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1672 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_unpack)
NOTE: recipe python3-pycparser-3.0-r0: task do_unpack: Started
NOTE: Running task 1673 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_unpack)
NOTE: recipe python3-cffi-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1676 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1678 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_unpack)
NOTE: Running setscene task 919 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch)
NOTE: Running task 1686 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_patch)
NOTE: recipe python3-pycparser-3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1688 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2026.1-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1691 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_unpack: Started
NOTE: Running task 1692 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_patch: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-3.0-r0: task do_patch: Succeeded
NOTE: Running task 1693 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_patch)
NOTE: Running task 1694 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-7.2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1695 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_patch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1696 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_patch: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1698 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-cffi-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1699 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2026.1-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-7.2.2-r0: task do_patch: Started
NOTE: Running task 1700 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_check_backend)
NOTE: Running task 1701 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1702 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_deploy_source_date_epoch unihash changed to 5e888f1220e8b7a989d9c167fd372d0c08015ae223e97eb2553ee522199faff8
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1703 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb:do_check_backend)
NOTE: recipe python3-psutil-7.2.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1704 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytz-2026.1-r0: task do_check_backend: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pycparser-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_check_backend: Started
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-26.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_deploy_source_date_epoch unihash changed to 3baf165ea5da7bde0151766b9b6f27db5ef5160744f049dbbdae9c310392678e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_deploy_source_date_epoch unihash changed to 6980eb719f6e17ef022ec4dc8e9f9d8ba4b1f25e8ff7cc02951b6e0cbbdc88e9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch unihash changed to b0af7693fe6068d36736fa4a4d73548ec361d3f97610534dfd48a8c2b0d8bb92
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 86fdedd8605cab8b55dd09a09b6c738448500f8be6c48c885215a2e1a495d804
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_deploy_source_date_epoch unihash changed to 42000703f9b4090599fcef4bbbbdfac03be5ec746ae51f17b920cf4493397045
NOTE: Running setscene task 913 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1705 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: Running task 1706 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_patch: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1710 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-7.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_deploy_source_date_epoch unihash changed to 1c814842b87d59ecc53801eeca359462180d5d4500c96de9db3b495e0779c372
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1712 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 942 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch unihash changed to 6796cfc9408fe307083a911aaf6fda3ccf3745b23f15c77dcd82a6fed8f58782
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 953 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1750 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1977 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2107 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2110 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_unpack: Started
NOTE: Running task 2111 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2220 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2221 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2224 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2225 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2288 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_unpack)
NOTE: Running task 2289 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: recipe python3-pycparser-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-46.0.7-r0: task do_patch: Started
NOTE: Running task 2291 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_configure)
NOTE: recipe python3-pytz-2026.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_configure)
NOTE: recipe python3-psutil-7.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_configure)
NOTE: Running task 2295 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_configure)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_configure)
NOTE: recipe python3-pycparser-3.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-7.2.2-r0: task do_configure: Started
NOTE: Running task 2297 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_compile)
NOTE: recipe python3-pytz-2026.1-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_compile)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: Running task 2304 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_compile)
NOTE: recipe python3-pycparser-3.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_compile: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2305 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 2306 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2307 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: Running task 2308 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_compile)
NOTE: Running task 2309 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_compile)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_rust_gen_targets)
NOTE: Running task 2312 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2313 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-46.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch unihash changed to e27bafe0441d62eb6c3021f94116838b5788c264144b620867f4c251b93be37a
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2314 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_deploy_source_date_epoch unihash changed to 38ebb0263443ca0d8d43bf731964e35363cd840327f6b9b0fe136a78a6e27fc6
NOTE: Setscene tasks completed
NOTE: Running task 2315 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_configure)
NOTE: Running task 2316 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-cryptography-46.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-46.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2325 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2326 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-46.0.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_install)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_install)
NOTE: recipe python3-pycparser-3.0-r0: task do_compile: Succeeded
NOTE: Running task 2329 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_install)
NOTE: recipe python3-pytz-2026.1-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_install: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 2331 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package)
NOTE: recipe python3-pytz-2026.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2332 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_install)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2026.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2335 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_install)
NOTE: recipe python3-pycparser-3.0-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_populate_sysroot)
NOTE: Running task 2337 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_install)
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_install: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2340 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-psutil-7.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_install)
NOTE: recipe python3-pytz-2026.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2342 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_package)
NOTE: recipe python3-psutil-7.2.2-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2026.1-r0: task do_package: Started
NOTE: Running task 2344 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_install_ptest_base)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-cffi-2.0.0-r0: task do_configure: Started
NOTE: Running task 2346 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_packagedata)
NOTE: recipe python3-psutil-7.2.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata unihash changed to 956809a308693fc7ea8b73ad2291efe49942d6f1d72f56dc84966149f23fcbd9
NOTE: Setscene tasks completed
NOTE: Running task 2348 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_package)
NOTE: recipe python3-cffi-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_package: Started
NOTE: recipe python3-pycparser-3.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_packagedata: Started
NOTE: Running task 2350 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_packagedata)
NOTE: recipe python3-psutil-7.2.2-r0: task do_package: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pycparser-3.0-r0: task do_packagedata: Started
NOTE: Running task 2351 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_compile)
NOTE: recipe python3-cffi-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb:do_packagedata unihash changed to cbc83eb50393db56484c8b116218ebb6b0938b27e3db284856dda5870f9f6ff9
NOTE: Setscene tasks completed
NOTE: recipe python3-pycparser-3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_3.0.bb:do_packagedata unihash changed to c3b34a7ce03fc1b3f21e3e09622f1560798747eda51a2b97adf7cea722bf5bbf
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package)
NOTE: recipe python3-psutil-7.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_package: Started
NOTE: Running task 2353 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_packagedata)
NOTE: recipe python3-psutil-7.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata)
NOTE: recipe python3-psutil-7.2.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.2.2.bb:do_packagedata unihash changed to fb8f1b7790392af1cd1c9ee72329a50571e1cba33833b2f1811d778d87dfe897
NOTE: Setscene tasks completed
NOTE: recipe python3-pytz-2026.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_packagedata: Started
NOTE: Running task 2355 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_packagedata)
NOTE: recipe python3-pytz-2026.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2026.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2026.1.bb:do_packagedata unihash changed to 307d60119b6502a502c057ecd642aeeea83e86e5e8e1c65a88a9e20c6ed63cf9
NOTE: recipe python3-cffi-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-cffi-2.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2357 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_install)
NOTE: recipe python3-cffi-2.0.0-r0: task do_install: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-cffi-2.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cffi-2.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2359 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_2.0.0.bb:do_package)
NOTE: recipe python3-cffi-2.0.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2391 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-46.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-46.0.7-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2360 tasks of which 2233 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515085605.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515085605.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.152.4/temp/log.do_packagedata.1946148
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.152.7-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.152.4/temp/log.do_packagedata.1946148
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata) failed with exit code '1'

--===============5950467346506031984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.1.0.tar.gz;downloadfilename=pyopenssl-26.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.2.0.tar.gz;downloadfilename=pyopenssl-26.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "26.1.0" to "26.2.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 26.1.0 [default] to 26.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 520999 to 497634 (-4%)
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info

--===============5950467346506031984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.2.0.dist-info

--===============5950467346506031984==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-26.1.0-26.2.0.patch"

RnJvbSBkMmEyZTQ2MmI5YWVmNGFlYmRhYTI3NGUxNmE5ZmUwOGQyMzM3ZmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDg6NTY6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyNi4xLjAgLT4gMjYuMi4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yNi4xLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjYuMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzI2LjEu
MC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNi4yLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4xLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjIuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI2LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4yLjAuYmIKaW5kZXggNjE2MzA5
M2NhOS4uOTY2MGEwM2Y4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yNi4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4yLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsIHB5dGhvbjMtY3J5cHRvZ3JhcGh5Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM3ZjBhMjI3NWM1YmM1NGYzYjAyMTM3Njg3ZTFhNzY1
OTMxZmIzOTQ5YjlhOTJhODI1ZTRkMzNiOWVlYzA4YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4
YzZmY2VjZDExODNhN2ZjODk3NTQ4ZGZlMzg4YjBjZGI3ZjM3ZTAxODIwMGQ4NDA5Y2YzMzk1OWRi
ZTM1Mzg3IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi40Ny4xCgo=

--===============5950467346506031984==--

