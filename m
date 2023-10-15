Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE3FC004C9
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.102666.1697399114305380349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PwhEJaeE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RFKKs/x0;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b34df0afb-4cb8ddc4-310a-401d-abc8-c17a3d1b9556-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6UFuGFbwq13qosnvONrspJMidXY7Wgg04WqVRJBsERE=;
	b=PwhEJaeEdXXkWQsJ5k5oxpMlmrbzm528fwVnphJ9qkRYpOHFYyxvfhJ8+4hzEQIc
	822rJZHPFdqw2nOZDP6xCVZMwhdjBBrX0rNVtBbny4RD95DKYrCo8U/SfFSyohWNs74
	eDNRho9kAtUmRypUwM29nr2ksUHR2moh53uA55T8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6UFuGFbwq13qosnvONrspJMidXY7Wgg04WqVRJBsERE=;
	b=RFKKs/x0chdAjfd/RgnCjKfEa5sECd+VqzkDnb9ktluB84GYTBfETxFz012trHvb
	YcbcoX2r0M6PULrJCMHFnrsERg6O2YTrRmXcSzkPWF3Cetw986fTe90r90QJ6dlDIZA
	OLl7adWAXRehmsuNASRbBeWm+byOijM4+6FUa+a0=
Content-Type: multipart/mixed; boundary="===============8724610105077863913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.0.6 SUCCEEDED
Message-ID: <0101018b34df0afb-4cb8ddc4-310a-401d-abc8-c17a3d1b9556-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189212

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *2.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.0.5-2.0.6.patch
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
From d9b062f29de24f59fc7c8b895f4f4964f6ac31fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:37:09 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.0.5 -> 2.0.6

---
 .../{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
index 9c15791d34..cd2a9dd4ef 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "13abf37382ea2ce6fb744d4dad67838eec857c9f4f57009891805e0b5e123594"
+SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-32 sysroot...done.
Removing 72 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 472 Local 385 Mirrors 0 Missed 87 Current 379 (81% match, 89% complete)
Removing 8 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 380 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 424 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa)
NOTE: Running task 425 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 427 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa)
NOTE: Running task 428 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 452 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_recipe_qa)
NOTE: Running task 456 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 467 of 2429 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.7.0.bb:do_rust_gen_targets)
NOTE: Running task 468 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: Running task 477 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_recipe_qa)
NOTE: Running task 502 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa)
NOTE: Running task 503 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_recipe_qa)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 535 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: Running task 536 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_recipe_qa)
NOTE: Running task 537 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 538 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_recipe_qa)
NOTE: Running task 539 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: Running task 540 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.7.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 524 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.7.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 575 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 576 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 580 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 581 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_fetch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 582 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: Running task 583 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 584 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 585 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: Running task 586 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 587 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 588 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 592 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 593 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_fetch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 594 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 537 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 598 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 544 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: Running task 599 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: Running task 600 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: Running task 606 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: Running task 607 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_unpack)
NOTE: Running task 608 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 561 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: Running task 612 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 613 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 614 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 615 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 618 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 619 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 584 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 586 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 636 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 607 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 648 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 649 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 655 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 703 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 710 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1098 of 2429 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 715 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1156 of 2429 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1185 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: Running task 1188 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 1189 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running task 1314 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Running task 1351 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: Running task 1352 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: Running setscene task 733 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1412 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 747 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1426 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 1427 of 2429 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_compile)
NOTE: Running task 1441 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1458 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Started
NOTE: Running task 1460 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 1462 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1463 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1464 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: Running task 1465 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_patch)
NOTE: Running task 1466 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1467 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: Running setscene task 749 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1481 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1541 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running setscene task 758 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Succeeded
NOTE: Running task 1552 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1553 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 1554 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic)
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1566 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2429 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Started
NOTE: Running task 1578 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1579 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1580 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 772 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1581 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1582 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1590 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 784 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1601 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic unihash changed to 90169c56e16e3876dbd0f89e6d4c609903cdcfd8c1d1e3d76528546aa1b3a7d5
NOTE: recipe rust-native-1.70.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1607 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1614 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1615 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_rust_gen_targets)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1626 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running task 1637 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1638 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1653 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1693 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 65b6804f18b5304f7fc6bf26f99eb080c6989c489e5ea6be5abbbd4524adf075
NOTE: Running setscene task 845 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1905 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2084 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2118 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2162 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2163 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: Running task 2196 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_collect_spdx_deps)
NOTE: Running task 2220 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2222 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2224 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2225 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2280 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2297 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2298 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2299 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 2301 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_configure)
NOTE: Running task 2302 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2303 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_configure)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Started
NOTE: Running task 2305 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Started
NOTE: Running task 2306 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2308 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Started
NOTE: Running task 2309 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_compile)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: Running task 2311 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Started
NOTE: Running task 2316 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_package)
NOTE: Running task 2322 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_sysroot)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: Running task 2327 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2328 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: Running task 2330 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 2331 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_create_spdx)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package_write_rpm)
NOTE: Running task 2334 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2335 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Failed
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_install: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2335 tasks of which 2192 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-iso8601/2.0.0/temp/log.do_packagedata.2641909
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata) failed with exit code '1'

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-2.0.5.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-2.0.6.dist-info

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 105 Local 39 Mirrors 0 Missed 66 Current 694 (37% match, 91% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 716 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1332 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1485 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: Running task 1561 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1636 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_recipe_qa)
NOTE: Running task 1637 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Started
NOTE: Running task 1881 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1883 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1884 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_fetch)
NOTE: Running task 1885 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1886 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_fetch)
NOTE: Running task 1887 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_fetch)
NOTE: Running task 1888 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1894 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: Running task 1896 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1897 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: Running task 1898 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 1899 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1900 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 2141 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_unpack)
NOTE: Running task 2142 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_unpack)
NOTE: Running task 2143 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 2144 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Started
NOTE: Running task 2145 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2146 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_unpack)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2150 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: Running task 2151 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: Running task 2152 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 2153 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_fetch)
NOTE: Running task 2154 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: Running task 2155 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2156 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2157 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: Running task 2158 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_patch)
NOTE: Running task 2160 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: Running task 2161 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: Running task 2162 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_unpack)
NOTE: Running task 2163 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Started
NOTE: Running task 2164 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 2165 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 2166 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 2167 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Started
NOTE: Running task 2168 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 2169 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 2171 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2173 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2174 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: Running task 2178 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2179 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2191 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2192 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2193 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2194 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2196 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_patch)
NOTE: Running task 2197 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2198 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2200 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2201 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_compile)
NOTE: Running task 2203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running task 2204 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2205 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2206 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: Running task 2210 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2212 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2213 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2214 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_package)
NOTE: Running task 2225 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Started
NOTE: Running task 2231 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_create_spdx)
NOTE: Running task 2233 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata)
NOTE: Running task 2234 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Started
NOTE: Running task 2235 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: Running task 2236 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Failed
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2236 tasks of which 2129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-iso8601/2.0.0/temp/log.do_packagedata.2590273
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata) failed with exit code '1'

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 106 Local 40 Mirrors 0 Missed 66 Current 693 (37% match, 91% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 715 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1332 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1485 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: Running task 1561 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1637 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1638 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: Running task 1882 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1884 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1885 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_fetch)
NOTE: Running task 1886 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1887 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_fetch)
NOTE: Running task 1888 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1889 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_fetch)
NOTE: Running task 1894 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1895 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_recipe_qa)
NOTE: Running task 1896 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: Running task 1898 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: Running task 1900 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 1901 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2141 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 2142 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_unpack)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 2143 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 2144 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_unpack)
NOTE: Running task 2145 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 2146 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2147 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_unpack)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2150 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2151 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2152 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 2153 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2154 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: Running task 2155 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2156 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2157 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_patch)
NOTE: Running task 2158 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_patch)
NOTE: Running task 2160 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 2161 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_unpack)
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 2163 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 2164 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 2165 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: Running task 2166 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2167 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 2168 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 2169 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Started
NOTE: Running task 2170 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2171 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_patch)
NOTE: Running task 2173 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: Running task 2175 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 2176 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 2177 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2181 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2188 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 2189 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2190 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2191 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_configure)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2192 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2193 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2194 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_patch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: Running task 2198 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Started
NOTE: Running task 2199 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2201 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_compile)
NOTE: Running task 2203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2204 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2206 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Started
NOTE: Running task 2207 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2209 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_rust_gen_targets)
NOTE: Running task 2210 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Started
NOTE: Running task 2211 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2212 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2213 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_package)
NOTE: Running task 2224 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 2225 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: Running task 2230 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_packagedata)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2231 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_create_spdx)
NOTE: Running task 2233 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_packagedata)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Started
NOTE: Running task 2235 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2237 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_create_spdx)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2237 tasks of which 2129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-iso8601/2.0.0/temp/log.do_packagedata.2609694
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata) failed with exit code '1'

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.0.5.tar.gz;downloadfilename=urllib3-2.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.0.6.tar.gz;downloadfilename=urllib3-2.0.6.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.0.5" to "2.0.6"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.0.5 [default] to 2.0.6 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 855936 to 855958 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.0.5" to "2.0.6"
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-2.0.5.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-2.0.6.dist-info

--===============8724610105077863913==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.0.5-2.0.6.patch"

RnJvbSBkOWIwNjJmMjlkZTI0ZjU5ZmM3YzhiODk1ZjRmNDk2NGY2YWMzMWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6Mzc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4wLjUgLT4gMi4wLjYKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi4wLjUuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuMC42LmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMC41LmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjAuNi5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjAuNS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMC42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuMC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjAuNi5iYgppbmRleCA5YzE1NzkxZDM0Li5jZDJhOWRkNGVmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjAu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjAuNi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3No
YXpvdy91cmxsaWIzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9NTJkMjczYTMwNTRjZWQ1NjEyNzVkNGQxNTI2MGVjZGEiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxM2FiZjM3MzgyZWEyY2U2ZmI3NDRkNGRhZDY3ODM4ZWVjODU3
YzlmNGY1NzAwOTg5MTgwNWUwYjVlMTIzNTk0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIxOWUx
YTg1ZDIwNmI1NmQ3ZGYxZDVlNjgzZGY0YTc3MjUyNTJhOTY0ZTM5OTM2NDhkZDBmYjVhMWMxNTc1
NjQiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuMzkuMgoK

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 105 Local 39 Mirrors 0 Missed 66 Current 694 (37% match, 91% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 716 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1332 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1485 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: Running task 1561 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: Running task 1636 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1638 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Started
NOTE: Running task 1882 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1883 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1884 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_fetch)
NOTE: Running task 1885 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1886 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_fetch)
NOTE: Running task 1887 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1888 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_fetch)
NOTE: Running task 1894 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 1895 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1896 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_recipe_qa)
NOTE: Running task 1897 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: Running task 1898 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1899 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 2141 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 2142 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_unpack)
NOTE: Running task 2143 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_unpack)
NOTE: Running task 2144 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 2145 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2146 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 2149 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_unpack)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2150 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 2151 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 2152 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_fetch)
NOTE: Running task 2153 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: Running task 2154 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2156 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_collect_spdx_deps)
NOTE: Running task 2157 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_patch)
NOTE: Running task 2158 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: Running task 2159 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2160 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 2161 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Started
NOTE: Running task 2163 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 2164 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_unpack)
NOTE: Running task 2165 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 2166 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: Running task 2167 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2168 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: Running task 2169 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2170 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 2171 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2173 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: Running task 2174 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 2175 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_patch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: Running task 2176 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2180 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2181 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 2190 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2192 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2193 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_configure)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2194 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Started
NOTE: Running task 2196 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2197 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2198 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_configure)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2202 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Started
NOTE: Running task 2203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_compile)
NOTE: Running task 2204 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2205 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2206 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_compile)
NOTE: Running task 2210 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 2212 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2213 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2214 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_package)
NOTE: Running task 2224 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 2225 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_packagedata)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2231 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_packagedata)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2233 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_create_spdx)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package_write_rpm)
NOTE: Running task 2235 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Started
NOTE: Running task 2236 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2237 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_create_spdx)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Failed
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2237 tasks of which 2129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-iso8601/2.0.0/temp/log.do_packagedata.2619133
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata) failed with exit code '1'

--===============8724610105077863913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf16c1dc9b4836cafa51b43b89ffe8511d50389e"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 105 Local 39 Mirrors 0 Missed 66 Current 694 (37% match, 91% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 716 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1332 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1485 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_recipe_qa)
NOTE: Running task 1561 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1637 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1638 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: Running task 1882 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1884 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1885 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_fetch)
NOTE: Running task 1886 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 1887 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_fetch)
NOTE: Running task 1888 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_fetch)
NOTE: Running task 1889 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_fetch)
NOTE: Running task 1894 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_recipe_qa)
NOTE: Running task 1896 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa)
NOTE: Running task 1897 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_recipe_qa)
NOTE: Running task 1898 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1899 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_recipe_qa)
NOTE: Running task 1900 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2141 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_unpack)
NOTE: Running task 2142 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_unpack)
NOTE: Running task 2143 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: Running task 2144 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_unpack)
NOTE: Running task 2145 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 2146 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2147 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_unpack)
NOTE: Running task 2149 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2150 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 2151 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: Running task 2152 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 2153 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_fetch)
NOTE: Running task 2154 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_fetch)
NOTE: Running task 2155 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_fetch)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_patch)
NOTE: Running task 2157 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2158 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2159 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_patch)
NOTE: Running task 2160 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2161 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 2162 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_unpack)
NOTE: Running task 2163 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 2164 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 2165 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_unpack)
NOTE: Running task 2166 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: Running task 2167 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_unpack)
NOTE: Running task 2168 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Started
NOTE: Running task 2169 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: Running task 2171 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Started
NOTE: Running task 2172 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2176 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_patch)
NOTE: Running task 2177 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2178 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2181 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: Running task 2183 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2184 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyopenssl-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2189 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2190 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2191 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_patch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2194 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_configure)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: Running task 2196 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_compile)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2198 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2199 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2200 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2201 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_configure)
NOTE: recipe python3-psutil-5.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2202 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_configure)
NOTE: Running task 2203 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2204 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_compile)
NOTE: Running task 2205 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: Running task 2206 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2209 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb:do_rust_gen_targets)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2210 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: Running task 2213 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_install)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_package)
NOTE: Running task 2224 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2225 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-iso8601-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_package)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_install)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_install)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_package)
NOTE: Running task 2230 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_packagedata)
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2231 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_create_spdx)
NOTE: Running task 2233 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb:do_package_write_rpm)
NOTE: Running task 2234 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_packagedata)
NOTE: recipe python3-iso8601-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Started
NOTE: Running task 2235 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_install: Succeeded
NOTE: Running task 2236 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2237 of 2299 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb:do_create_spdx)
NOTE: recipe python3-certifi-2023.7.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iso8601-2.0.0-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2023.7.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2237 tasks of which 2129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-src went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dbg went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-staticdev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-dev went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-doc went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601-locale went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: QA Issue: Package version for package python3-iso8601 went backwards which would break package feeds (from 0:2.1.0-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: python3-iso8601-2.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-iso8601/2.0.0/temp/log.do_packagedata.2599803
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb:do_packagedata) failed with exit code '1'

--===============8724610105077863913==--

