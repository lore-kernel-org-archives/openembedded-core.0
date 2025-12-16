Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635FFD5C0FE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17394.1765872135549692799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dJK9xw7J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=M2C+b7Hf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262e9623-19b4544d-8c4a-4521-a424-c65b9ac66445-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=huK9YHc01PLE9rEEn8twnL5Df9O0QDvM5+n9Z21uYJM=;
	b=dJK9xw7JEpNOOmGbDHt7/ItL6DouCpvZaf7HxcRY0XkpERDw/bCfL58EPsN3fAJa
	1WtnNUETXNUwINABrUOz8u+KrzcCcf9V9KmtU/X/O161T6/Eyn0fXE3gcL9dANzggEK
	MaT8BM20JbpoUcEf20nDwWddw4EN4Aioz1eGLxR0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=huK9YHc01PLE9rEEn8twnL5Df9O0QDvM5+n9Z21uYJM=;
	b=M2C+b7Hf4AzJWTv3fjUYOUiNMoW2bktP0xLeG+WKg1uGeTB+DLo1aLdeH1pbc7fw
	gKdDeLuKTqkGF6EwFe0LqfPhsKrdwCAkxCBgbkF/uD4jd/FIDGjdiHGvS/5rDuwfP8F
	KKf8/QehDDUKJ4qXNQkavoHwymYwaIg4Qq4tsce4=
Content-Type: multipart/mixed; boundary="===============9213436388803854311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 25.3.0 SUCCEEDED
Message-ID: <0101019b262e9623-19b4544d-8c4a-4521-a424-c65b9ac66445-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227819

--===============9213436388803854311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *25.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-25.1.0-25.3.0.patch
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
From 38b07e32b2e7266809261d1c9c103556aa95ea3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:55:54 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 25.1.0 -> 25.3.0

---
 ...{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
index c1f571c552..b5230293d2 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280fc205b"
+SRC_URI[sha256sum] = "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============9213436388803854311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info -> /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============9213436388803854311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.1.0.tar.gz;downloadfilename=pyopenssl-25.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.3.0.tar.gz;downloadfilename=pyopenssl-25.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info -> /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 473306 to 477660 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============9213436388803854311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d27b329f7a6e7ae9c72cd2806b6b04fc755a913b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:d27b329f7a6e7ae9c72cd2806b6b04fc755a913b"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 500 Local 468 Mirrors 0 Missed 32 Current 288 (93% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 290 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 302 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 303 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 374 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 375 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.9.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-poetry-core-native-2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 410 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.91.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-cffi/1.17.1/temp/log.do_packagedata_setscene.180198
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 438 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-poetry-core-native-2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 442 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.9.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 456 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 458 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 464 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-native-2.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-native-2.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-native-2.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 483 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.9.4.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-native-2.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 492 of 788 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.91.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycparser-native-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-native-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-maturin-native-1.9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 551 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 967 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: Running task 1045 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_fetch)
NOTE: Running task 1053 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_fetch)
NOTE: Running task 1065 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1080 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1166 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_fetch)
NOTE: Running task 1167 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_fetch)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1168 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_unpack)
NOTE: Running task 1169 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1175 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: Running task 1176 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1177 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Started
NOTE: Running setscene task 606 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_unpack)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1249 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: Running task 1252 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_fetch)
NOTE: Running task 1281 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_unpack)
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_patch)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: Running task 1283 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_patch)
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_fetch: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1284 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_unpack: Started
NOTE: Running task 1285 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: Running task 1288 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1295 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_patch)
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Started
NOTE: Running setscene task 617 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pycparser/2.22/temp/log.do_packagedata_setscene.181764
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 618 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_package_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_patch: Started
NOTE: Running task 1364 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1366 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_check_backend)
NOTE: Running task 1367 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1369 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 637 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 638 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1385 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_check_backend)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1456 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1462 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 672 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_patch: Started
NOTE: Running setscene task 676 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_patch)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1489 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_rust_gen_targets)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 704 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_gen_targets: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 705 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 730 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 753 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running task 1591 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1830 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1961 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1982 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2117 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2118 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2119 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2123 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2149 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata)
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2190 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2198 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2199 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2200 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_configure)
NOTE: Running task 2201 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: recipe python3-psutil-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_configure)
NOTE: Running task 2203 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2204 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_rust_create_wrappers)
NOTE: Running task 2205 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_configure: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2207 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: Running task 2208 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_compile)
NOTE: recipe python3-psutil-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_compile)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2210 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2211 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: Running task 2212 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_configure)
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_compile: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2213 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_configure_ptest_base)
NOTE: Running task 2215 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2216 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: Running task 2217 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_compile)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_install)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_install)
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install)
NOTE: Running task 2222 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package)
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_install)
NOTE: Running task 2225 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install_ptest_base)
NOTE: recipe python3-psutil-7.0.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2226 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_package unihash changed to acef9b5c2867d19c5da51021ffee87a8a53fb65dc3e024dc970f4742010a3607
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata became valid
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Started
NOTE: Running setscene task 788 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_package unihash changed to cef35ea8d10e2a32e863ca68431a2ec59ea62c1964ad2d1f031e855061fb0e1b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata became valid
NOTE: recipe python3-psutil-7.0.0-r0: task do_install: Succeeded
NOTE: Running setscene task 788 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata_setscene)
NOTE: Running task 2228 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_install)
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_install: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package unihash changed to 648a9b4e3f757eca1c1260fb46422ee2c99826a9ee22133c81ab25c00596beb5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 788 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-psutil/7.0.0/temp/log.do_packagedata_setscene.187448
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 2231 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package unihash changed to 023d5c7b391473bc02e96d25a43ffad3ec2901a4ab46523756d987839862d445
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata became valid
NOTE: Running setscene task 788 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_install: Succeeded
NOTE: Running task 2233 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package)
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package unihash changed to dce73744010191ec401597e7e5401d524f36835144c584dbc26f6c7e114cda36
NOTE: Setscene tasks completed
NOTE: Running task 2234 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2235 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2236 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_install)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2238 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-45.0.7-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2239 tasks of which 2154 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216005520.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216005520.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-bcrypt/4.3.0/temp/log.do_packagedata.189285
Summary: There were 35 ERROR messages, returning a non-zero exit code.
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-ptest went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-src went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dbg went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-staticdev went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dev went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-doc went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-locale went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-src went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dbg went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-tests went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-staticdev went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dev went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-doc went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-locale went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-bcrypt/4.3.0/temp/log.do_packagedata.189285
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata) failed with exit code '1'

--===============9213436388803854311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-25.1.0-25.3.0.patch"

RnJvbSAzOGIwN2UzMmIyZTcyNjY4MDkyNjFkMWM5YzEwMzU1NmFhOTVlYTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NTU6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5b3BlbnNzbDogdXBncmFkZSAyNS4xLjAgLT4gMjUuMy4wCgotLS0KIC4uLntweXRo
b24zLXB5b3BlbnNzbF8yNS4xLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjUuMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEu
MC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNS4zLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNS4xLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjMuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNS4zLjAuYmIKaW5kZXggYzFmNTcx
YzU1Mi4uYjUyMzAyOTNkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5b3BlbnNzbF8yNS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNS4zLjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRk
ZGMzYzZiZDU3IgogCiBERVBFTkRTICs9ICJvcGVuc3NsIHB5dGhvbjMtY3J5cHRvZ3JhcGh5Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGQwMzE4ODQ0ODJlMGM2N2VlOTJiZjlhNGQ4Y2NlYjA4
ZDkyYWJhNzEzNjQzMmZmYjA3MDNjNTI4MGZjMjA1YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJj
OTgxY2IwYTNmZDg0ZTg2MDJkN2FmYzIwOTUyMjc3M2I5NGMxYzI0NDZhM2M3MTBhNzViMDZmZTFi
ZWFlMzI5IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAKMi40Ny4xCgo=

--===============9213436388803854311==--

