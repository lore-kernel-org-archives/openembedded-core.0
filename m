Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0919C79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:38:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7584.1788500295506170412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ilHaRj8x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0uDoT7W4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a06aecc7f3-0910e3fa-9e77-46ba-b1d7-f733433afba2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788500297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XN8MyYNfX5HqW2F2getGmo23pmOaj2ZNUokJQzObEns=;
	b=ilHaRj8xOIq1qJz2CLjK/qR7sIv93Y0uniKQ4s9+h7pcW1IX87BIOSGLD6mcRrZt
	UQFK3M1AA900l+xoWFkevf6jwjlvSK3CoSdiWNBEzHSq3nTfTTlUk/y1FEXzCgGXzMD
	zZH5UaB3DbDw6IqwWq/Gni+Absl6JBeeiu9Hu0gw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788500297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XN8MyYNfX5HqW2F2getGmo23pmOaj2ZNUokJQzObEns=;
	b=0uDoT7W4nNIwg7GtDam0XYNGy5tKe74Agw5Cd1r1zLz8E83XEhj8XSBmE8cuR0Zo
	Pb7rI9RfvMX+z4QxxF1d4b8lc75dNqN7Nko5aSnUvOjuTweBLI1sakXRgBlVSt8oD25
	FhsVkYNJH9xfpRKMnab6meEZajWCGaDfmruBbWCo=
Content-Type: multipart/mixed; boundary="===============8602663997049001588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.3.4 SUCCEEDED
Message-ID: <010101a06aecc7f3-0910e3fa-9e77-46ba-b1d7-f733433afba2-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 05:38:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245058

--===============8602663997049001588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.3.2-2.3.4.patch
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
From 07d2d9355f8f93a02c45f55f01bca1db65eec380 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 4 Sep 2026 05:27:55 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.3.2 -> 2.3.4

Source: CHANGELOG.md

## 2.3.4 (2026-09-03)

### Fixed

- Ensure the vcs-versioning testsuite passes without setuptools-scm installed; the egg-info vs PKG-INFO discovery priority test moved to the setuptools-scm testsuite, which owns the egg-info entry point it needs. ([#1512](https://github.com/pypa/setuptools-scm/issues/1512))

## 2.3.3 (2026-09-03)

### Fixed

- The `semver-pep440` and `semver-pep440-release-branch` version schemes now keep the PEP 440 epoch of the tag they are derived from, instead of emitting a version that sorts below it. ([#1513](https://github.com/pypa/setuptools-scm/issues/1513))
---
 ...-vcs-versioning_2.3.2.bb => python3-vcs-versioning_2.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.3.2.bb => python3-vcs-versioning_2.3.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
index 57ea6a9227..e358c722d7 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "24abddff97aecf44cf3fec727eae8d76d9c6f70f5acb39afc41f824d69f2aac5"
+SRC_URI[sha256sum] = "f3443da15a34a32755b04324e33c6166add300c7661f45902225190c9337f711"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============8602663997049001588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1988 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7cab1376c5c997a83eae62b312085757fe8bcd61"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:7cab1376c5c997a83eae62b312085757fe8bcd61"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 710 Local 604 Mirrors 0 Missed 106 Current 284 (85% match, 89% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 302 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 314 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 315 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 320 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 321 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 357 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 380 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 418 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 439 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 487 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 490 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 508 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 517 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 519 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.98.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 525 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 542 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 544 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.98.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 551 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_setscene)
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 558 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 590 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.55.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.98.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.55.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 600 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 607 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 619 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_spdx_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.98.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 630 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 635 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 638 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.98.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 659 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-23.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe git-2.55.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 662 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 672 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 684 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 692 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 694 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 700 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 706 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 709 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe git-2.55.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 718 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 719 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcxx-23.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 731 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe openssl-native-4.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-23.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-native-4.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 774 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_package_setscene)
NOTE: Running setscene task 801 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 831 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 833 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_package_setscene)
NOTE: Running setscene task 835 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 836 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 840 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 844 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 994 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 873 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 900 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 901 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1172 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_recipe_qa)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1223 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1237 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1277 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: Running task 1284 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_fetch)
NOTE: Running task 1285 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: Running task 1286 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running task 1296 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1306 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1345 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: Running task 1346 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: Running task 1352 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_recipe_qa)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 908 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_fetch: Started
NOTE: Running task 1353 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1354 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe findutils-4.11.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: Running task 1360 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: Running task 1361 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: Running task 1362 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_recipe_qa: Started
NOTE: Running task 1363 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_unpack)
NOTE: Running task 1365 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1366 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.55.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: Running task 1368 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1369 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_unpack: Started
NOTE: Running task 1370 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1371 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1372 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1374 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: Running task 1376 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe git-2.55.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: Running task 1386 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: Running task 1387 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1388 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1389 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_fetch)
NOTE: Running task 1402 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_unpack)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1404 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_fetch: Started
NOTE: Running task 1405 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_fetch: Succeeded
NOTE: recipe git-2.55.0-r0: task do_unpack: Started
NOTE: Running task 1429 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1452 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_patch)
NOTE: Running task 1453 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1516 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: Running task 1527 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 1528 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_unpack: Started
NOTE: Running task 1529 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_patch)
NOTE: Running task 1530 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_patch: Started
NOTE: Running task 1531 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_unpack: Succeeded
NOTE: Running task 1532 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_patch)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1534 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1536 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1537 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: Running task 1568 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1569 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: Running task 1580 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1581 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe shadow-4.20.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 909 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe git-2.55.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 912 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 913 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1582 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: Running task 1583 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 915 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 917 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 918 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe git-2.55.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 921 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1585 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: Running task 1586 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_rust_gen_targets)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1589 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1591 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 922 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1592 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe git-2.55.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1594 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: Running task 1596 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: Running task 1597 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1598 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1604 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package_setscene)
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 927 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: Running task 1645 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: Running setscene task 928 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1647 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: Running task 1648 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_package_setscene: Started
NOTE: Running task 1662 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_recipe_spdx)
NOTE: Running task 1666 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_recipe_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: Running setscene task 929 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package_setscene)
NOTE: Running task 1672 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_recipe_spdx)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1674 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1675 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx)
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1677 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_recipe_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 932 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 934 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1685 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1687 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1688 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: Running task 1689 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1690 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 935 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 936 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe git-2.55.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 939 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1693 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1696 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe git-2.55.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: Running setscene task 941 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_package_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1700 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1701 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1702 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 942 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 943 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 945 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 947 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 949 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_package_setscene: Started
NOTE: Running task 1706 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1708 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 953 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1715 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: Running task 1716 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1719 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running setscene task 954 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 955 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 956 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1722 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: Running task 1723 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 959 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 961 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1730 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 963 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 964 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1734 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1735 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: Running setscene task 972 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1739 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 985 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 994 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2090 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2160 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2165 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2166 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2167 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2202 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2203 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2219 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2220 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2277 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2278 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2279 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2280 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2333 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2334 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx: Started
NOTE: recipe perl-5.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_configure)
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: recipe perl-5.44.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: Running task 2338 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_configure)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2339 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2340 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2341 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_configure)
NOTE: recipe python3-pytest-9.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_configure)
NOTE: Running task 2343 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2344 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_configure)
NOTE: recipe findutils-4.11.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_spdx: Started
NOTE: Running task 2345 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_configure: Started
NOTE: Running task 2348 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_compile)
NOTE: Running task 2350 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_compile)
NOTE: recipe python3-pytest-9.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: Running task 2352 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2354 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Started
NOTE: Running task 2356 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2358 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2359 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2360 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2361 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2363 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_configure_ptest_base)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2365 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx)
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2366 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb:do_compile)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Started
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_install)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2369 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2371 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: Running task 2372 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_spdx)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe curl-8.21.0-r0: task do_create_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package)
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2380 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_compile_ptest_base)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_install: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_install)
NOTE: Running task 2385 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2386 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_install)
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: Running task 2388 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2391 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx)
NOTE: Running task 2392 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_package)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2395 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Started
NOTE: Running task 2397 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx)
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-9.1.1-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_packagedata)
NOTE: Running task 2401 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Started
NOTE: Running task 2402 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2403 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package)
NOTE: Running task 2404 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_package)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2405 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package)
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2406 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_package: Started
NOTE: Running task 2407 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2408 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Started
NOTE: recipe curl-8.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2414 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2415 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2416 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-9.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Started
NOTE: Running task 2417 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_ipk)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Started
NOTE: Running task 2420 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata)
NOTE: Running task 2421 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_packagedata)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2422 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_deb)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2423 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package unihash changed to c533e211262023c9c7ee7a58c286ccaec2f77f00a2744a1c24e801adb2f156ab
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata became valid
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Started
NOTE: Running setscene task 994 of 994 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2430 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2432 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2433 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_spdx)
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-vcs-versioning-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk)
NOTE: Running task 2436 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb)
NOTE: Running task 2437 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm)
NOTE: Running task 2438 of 2496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.2-r0: task do_packagedata: Failed
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.167.0-r0: task do_compile: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_configure: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2438 tasks of which 2227 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260904052647.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260904052647.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-setuptools-scm/10.2.2/temp/log.do_packagedata.2724997
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-src went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-dbg went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-staticdev went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-dev went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-doc went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm-locale went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: QA Issue: Package version for package python3-setuptools-scm went backwards which would break package feeds (from 0:10.2.3-r0 to 0:10.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-scm-10.2.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-setuptools-scm/10.2.2/temp/log.do_packagedata.2724997
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb:do_packagedata) failed with exit code '1'

--===============8602663997049001588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.3.2 -> 2.3.4
Source: CHANGELOG.md

## 2.3.4 (2026-09-03)

### Fixed

- Ensure the vcs-versioning testsuite passes without setuptools-scm installed; the egg-info vs PKG-INFO discovery priority test moved to the setuptools-scm testsuite, which owns the egg-info entry point it needs. ([#1512](https://github.com/pypa/setuptools-scm/issues/1512))

## 2.3.3 (2026-09-03)

### Fixed

- The `semver-pep440` and `semver-pep440-release-branch` version schemes now keep the PEP 440 epoch of the tag they are derived from, instead of emitting a version that sorts below it. ([#1513](https://github.com/pypa/setuptools-scm/issues/1513))

--===============8602663997049001588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.2.tar.gz;downloadfilename=vcs_versioning-2.3.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.4.tar.gz;downloadfilename=vcs_versioning-2.3.4.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 278538 to 278380 (-0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.3.2 [default] to 2.3.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.3.2" to "2.3.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 777152 to 777583 (+0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info

--===============8602663997049001588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info

--===============8602663997049001588==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.3.2-2.3.4.patch"

RnJvbSAwN2QyZDkzNTVmOGY5M2EwMmM0NWY1NWYwMWJjYTFkYjY1ZWVjMzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNCBTZXAgMjAyNiAwNToyNzo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdmNzLXZlcnNpb25pbmc6IHVwZ3JhZGUgMi4zLjIgLT4gMi4zLjQKClNvdXJjZTogQ0hB
TkdFTE9HLm1kCgojIyAyLjMuNCAoMjAyNi0wOS0wMykKCiMjIyBGaXhlZAoKLSBFbnN1cmUgdGhl
IHZjcy12ZXJzaW9uaW5nIHRlc3RzdWl0ZSBwYXNzZXMgd2l0aG91dCBzZXR1cHRvb2xzLXNjbSBp
bnN0YWxsZWQ7IHRoZSBlZ2ctaW5mbyB2cyBQS0ctSU5GTyBkaXNjb3ZlcnkgcHJpb3JpdHkgdGVz
dCBtb3ZlZCB0byB0aGUgc2V0dXB0b29scy1zY20gdGVzdHN1aXRlLCB3aGljaCBvd25zIHRoZSBl
Z2ctaW5mbyBlbnRyeSBwb2ludCBpdCBuZWVkcy4gKFsjMTUxMl0oaHR0cHM6Ly9naXRodWIuY29t
L3B5cGEvc2V0dXB0b29scy1zY20vaXNzdWVzLzE1MTIpKQoKIyMgMi4zLjMgKDIwMjYtMDktMDMp
CgojIyMgRml4ZWQKCi0gVGhlIGBzZW12ZXItcGVwNDQwYCBhbmQgYHNlbXZlci1wZXA0NDAtcmVs
ZWFzZS1icmFuY2hgIHZlcnNpb24gc2NoZW1lcyBub3cga2VlcCB0aGUgUEVQIDQ0MCBlcG9jaCBv
ZiB0aGUgdGFnIHRoZXkgYXJlIGRlcml2ZWQgZnJvbSwgaW5zdGVhZCBvZiBlbWl0dGluZyBhIHZl
cnNpb24gdGhhdCBzb3J0cyBiZWxvdyBpdC4gKFsjMTUxM10oaHR0cHM6Ly9naXRodWIuY29tL3B5
cGEvc2V0dXB0b29scy1zY20vaXNzdWVzLzE1MTMpKQotLS0KIC4uLi12Y3MtdmVyc2lvbmluZ18y
LjMuMi5iYiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy40LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjIuYmIgPT4g
cHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjMuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4z
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy4yLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjQuYmIK
aW5kZXggNTdlYTZhOTIyNy4uZTM1OGM3MjJkNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjMuNC5iYgpA
QCAtNSw3ICs1LDcgQEAgbGlicmFyeSB0aGF0IGNhbiBiZSB1c2VkIGluZGVwZW5kZW50bHkgb2Yg
c2V0dXB0b29scy4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UudHh0O21kNT1jOWIwNmFkMmViZDdlMmU4MmQzNGIzY2FmMzUzZTdkNSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI0YWJkZGZmOTdhZWNmNDRjZjNmZWM3MjdlYWU4ZDc2ZDljNmY3
MGY1YWNiMzlhZmM0MWY4MjRkNjlmMmFhYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjM0NDNk
YTE1YTM0YTMyNzU1YjA0MzI0ZTMzYzYxNjZhZGQzMDBjNzY2MWY0NTkwMjIyNTE5MGM5MzM3Zjcx
MSIKIAogU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4xCgo=

--===============8602663997049001588==--

