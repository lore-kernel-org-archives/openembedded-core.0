Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00672F42123
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19817.1776261877438640873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cElUzgWf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LNvAZCR6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91754c74-c1c003b9-ead4-43dc-9fe3-607d8dac30bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261877;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QJtIaqZLWIn3Fn0ReVVHFgGXSNOtMkWVQPgw3lT+6UU=;
	b=cElUzgWfvZH2xoTdWofu5W4Zn9GLuSJCUwG1OYMpE++mg1q68XJnDYT9StcwNCh5
	21vKXXAzMo+jGJJEgw4tQyWyLOuI/M1G+m5cj80cTOs0lfoOO+XtqV3kCZS0dvcWJEO
	lk0PDpz6GHtl3ffZA0nBvK3e228RQZCfVAEPHJug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261877;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QJtIaqZLWIn3Fn0ReVVHFgGXSNOtMkWVQPgw3lT+6UU=;
	b=LNvAZCR6U1IKlasZ3s8Jo+jey3PB6RGWm5tZ/asylS7L49R8VXCLFRSSXUIfALsI
	sp/8TnJcg5l6skVdfAq/anvK0SnCJ+/lHz1D0/QkzYCB+n/l5zSRj5o4PgI3n81M+fM
	bEBOP3hTjIanAo3PZg5vLMpV33XiEWc2DlvXLUWU=
Content-Type: multipart/mixed; boundary="===============6121262463759931696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2026.4 SUCCEEDED
Message-ID: <0101019d91754c74-c1c003b9-ead4-43dc-9fe3-607d8dac30bf-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235232

--===============6121262463759931696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2026.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2025.12-2026.4.patch
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
From 8f1be5801d897e9cebcc67b90bb1d0f26e09cbb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:31:02 +0000
Subject: [PATCH] python3-dtschema: upgrade 2025.12 -> 2026.4

---
 .../{python3-dtschema_2025.12.bb => python3-dtschema_2026.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.12.bb => python3-dtschema_2026.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.12.bb b/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.12.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.4.bb
index 5ae67805b9..cbd459c151 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.12.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7"
+SRC_URI[sha256sum] = "10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============6121262463759931696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-f0bc7e64260cc1ef32419212681ce28ebcc5e515"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:f0bc7e64260cc1ef32419212681ce28ebcc5e515"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 589 Local 491 Mirrors 0 Missed 98 Current 331 (83% match, 89% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 351 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 352 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 395 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 418 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 473 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pdm-backend-native-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 558 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtschema-2026.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-attrs/25.4.0/temp/log.do_packagedata_setscene.2108114
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 563 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_package_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pdm-backend-native-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 574 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 581 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 593 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.10.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pdm-backend-native-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pdm-backend-native-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 596 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.10.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 869 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 937 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 994 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_recipe_qa)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 997 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1003 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1007 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1011 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_recipe_qa: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_package_setscene: Started
NOTE: Running task 1021 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1044 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_recipe_qa)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1054 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_recipe_qa)
NOTE: Running task 1055 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1056 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 676 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_recipe_qa: Started
NOTE: Running setscene task 686 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_recipe_qa: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 689 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 693 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1057 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1064 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_fetch)
NOTE: Running task 1068 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1157 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: Running task 1158 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_fetch)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1160 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1162 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 1163 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_fetch: Started
NOTE: Running setscene task 720 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_fetch: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_fetch: Started
NOTE: Running setscene task 736 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: Running task 1208 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1209 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1210 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1213 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_fetch)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: Running task 1239 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_fetch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_fetch: Started
NOTE: Running task 1241 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_unpack)
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 766 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 769 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 770 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1251 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running task 1262 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_patch)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1271 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1277 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_patch: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-dtschema-2026.4-r0: task do_unpack: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 794 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 795 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 840 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 869 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1335 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: Running task 1336 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1362 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_unpack)
NOTE: Running task 1365 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: Running task 1368 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1375 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1387 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_check_backend)
NOTE: Running task 1389 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_unpack)
NOTE: recipe python3-dtschema-2026.4-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1410 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_patch: Started
NOTE: Running setscene task 877 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1417 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_check_backend: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1418 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_patch)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1431 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_check_backend)
NOTE: recipe python3-dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 880 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1432 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1433 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_check_backend: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_check_backend: Succeeded
NOTE: Running task 1436 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 882 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1441 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch unihash changed to 591dde05ef9a1e8bec07a1915686ce7e76ffa1398d97120ed6cb4e0fbc1b95b8
NOTE: recipe python3-webcolors-25.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_deploy_source_date_epoch unihash changed to c28b28052f93b80496c09b49ef124ef3198f536a1dccf3391d33d29c0407cee9
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_deploy_source_date_epoch unihash changed to 05ae9e5c9f2c5bba2e6033ed5f6224d71fc2c1efb12274c816ce3255dd274506
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch unihash changed to 1587cac2ed424ccbf9321718af239df5fc15a6a809af9c6e040411701243b5d6
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_deploy_source_date_epoch unihash changed to a8f6d547d21dddbb5ff8cb550df0b3a0385b1b580009aaf91a61c7f8a35ba29e
NOTE: Running setscene task 863 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1449 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1454 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1480 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_recipe_qa)
NOTE: Running task 1481 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_recipe_qa)
NOTE: Running task 1517 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1561 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_deploy_source_date_epoch unihash changed to 96c84cfb4249da0424c6c5eb3cb174ece4a623784ff4960447045dd1bfddd2f5
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 881 of 920 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1594 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_recipe_spdx)
NOTE: Running task 1596 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_recipe_spdx)
NOTE: Running task 1599 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: Running task 1613 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_create_recipe_spdx)
NOTE: Running task 1614 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1615 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1617 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe meson-native-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 895 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe python3-referencing-0.37.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 896 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1618 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1619 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-native-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_patch)
NOTE: recipe python3-referencing-0.37.0-r0: task do_fetch: Started
NOTE: Running task 1641 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1642 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1647 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 1648 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_fetch: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1649 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_unpack)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 1653 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1655 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_check_backend)
NOTE: recipe python3-referencing-0.37.0-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 905 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch unihash changed to 35f1e7a19d6ff7087842acc9c06ce3f09aba8da7a5becc06df929c201a1d046c
NOTE: recipe python3-referencing-0.37.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_check_backend: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_check_backend: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1656 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_unpack)
NOTE: Running task 1657 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_patch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1658 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_check_backend)
NOTE: Running task 1659 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_unpack: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_check_backend: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_check_backend: Succeeded
NOTE: Running task 1662 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dtc-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_deploy_source_date_epoch unihash changed to b04f7333fcbc5a2d473dd7ebd48ff7a52a033c5c23dbb73590d4b925dcee7936
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1675 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_patch: Succeeded
NOTE: Running task 1682 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1683 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch unihash changed to 1b62e07a504b484c46a919f39058ce852c5cddfa5da26bd67f68b23b6c3c2f32
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 917 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-referencing-0.37.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_deploy_source_date_epoch unihash changed to c8a197610d9a4f45b0c5945ee8695a46dd7fabadad0e1d9c94fbe7a23255ca01
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_deploy_source_date_epoch unihash changed to 9e491f315a15ece017c6b82ecfb3d434876ca88066e4aaff05448d72d221d3eb
NOTE: Setscene tasks completed
NOTE: Running task 1957 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2052 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2055 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2057 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2058 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2074 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2091 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2092 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2093 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2171 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2172 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2173 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_packagedata)
NOTE: recipe python3-dtschema-2026.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2231 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2233 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2234 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_configure)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2235 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_configure)
NOTE: recipe python3-dtschema-2026.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2236 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 2237 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_configure)
NOTE: Running task 2238 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_configure)
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_configure)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_configure: Started
NOTE: Running task 2241 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_configure)
NOTE: recipe python3-referencing-0.37.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2242 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_configure)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_configure: Started
NOTE: Running task 2243 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_configure_ptest_base)
NOTE: Running task 2244 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_configure: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_configure: Started
NOTE: Running task 2246 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-referencing-0.37.0-r0: task do_configure: Started
NOTE: Running task 2247 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_compile)
NOTE: Running task 2248 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: Running task 2250 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_compile)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_compile: Started
NOTE: Running task 2251 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_compile)
NOTE: recipe python3-dtschema-2026.4-r0: task do_compile: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2252 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_compile)
NOTE: Running task 2253 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: Running task 2254 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_compile)
NOTE: Running task 2255 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_compile: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2256 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2264 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_install)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: Running task 2266 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_install)
NOTE: recipe python3-referencing-0.37.0-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: Running task 2268 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_compile_ptest_base)
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: Running task 2270 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-referencing-0.37.0-r0: task do_install: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2271 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_unpack)
NOTE: Running task 2272 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2273 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: Running task 2274 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2275 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_install)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2276 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_install)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_install: Started
NOTE: Running task 2278 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 2279 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_populate_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_install: Succeeded
NOTE: Running task 2280 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: Running task 2281 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_package)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_populate_sysroot: Started
NOTE: Running task 2282 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_patch)
NOTE: recipe python3-referencing-0.37.0-r0: task do_install: Succeeded
NOTE: Running task 2283 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_package)
NOTE: recipe python3-dtschema-2026.4-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_install)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package)
NOTE: Running task 2286 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_populate_sysroot)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_patch: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_package: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_install: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package: Started
NOTE: Running task 2287 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_install_ptest_base)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: Running task 2288 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_install_ptest_base)
NOTE: Running task 2289 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_package)
NOTE: Running task 2291 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package)
NOTE: Running task 2292 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_populate_sysroot)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2293 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_rust_create_wrappers)
NOTE: Running task 2296 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_rust_gen_targets)
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2297 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_package: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_install: Succeeded
NOTE: Running task 2298 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_package)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2299 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_populate_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2300 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_populate_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_deploy_source_date_epoch unihash changed to 7403e00fb7459c4c387ab425468ab88da436ab4c9b60e1934ed9f5caec4539d9
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2301 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_configure)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2303 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_configure_ptest_base)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_package: Succeeded
NOTE: recipe python3-referencing-0.37.0-r0: task do_package: Succeeded
NOTE: Running task 2305 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.9.1.bb:do_packagedata)
NOTE: Running task 2306 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-referencing_0.37.0.bb:do_packagedata)
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2307 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: Running task 2308 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_packagedata: Started
NOTE: Running task 2309 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_compile)
NOTE: recipe python3-referencing-0.37.0-r0: task do_packagedata: Started
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: Running task 2311 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2312 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb)
NOTE: Running task 2313 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk: Started
NOTE: Running task 2314 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-referencing-0.37.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2315 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-25.10.0-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package: Succeeded
NOTE: Running task 2317 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata)
NOTE: Running task 2318 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_packagedata)
NOTE: recipe python3-idna-3.11-r0: task do_package: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_packagedata: Started
NOTE: Running task 2319 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Started
NOTE: Running task 2320 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_create_spdx)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-webcolors-25.10.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa unihash changed to ebc14ffcf3b8f7ba4067b8076bb581e8dd45051bf9a13ece14ca30ccfcecd931
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_create_spdx)
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata unihash changed to b12bbb86920680fa7c0c56bd836dc3e1d930b3c194594897809eb3d19d215343
NOTE: Setscene tasks completed
NOTE: Running task 2323 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package_write_deb)
NOTE: Running task 2324 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package_qa)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_create_spdx: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_ipk: Started
NOTE: Running task 2326 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_qa: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_packagedata: Started
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_create_spdx)
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb:do_package_qa unihash changed to 79d69a20017687654e78cf1245cf107b71bb92317b319413ff44bf13075af02e
NOTE: recipe dtc-1.7.2-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-ruamel-yaml-0.19.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2330 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2331 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2333 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2335 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2336 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2337 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_configure)
NOTE: recipe python3-dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_compile)
NOTE: recipe python3-dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata unihash changed to 62f74018e598145bcea3889f8155132538fa8178064ce9c88c6d34135142901b
NOTE: Setscene tasks completed
NOTE: Running task 2341 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2342 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_install)
NOTE: recipe python3-dtc-1.7.2-r0: task do_install: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package)
NOTE: Running task 2344 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe python3-dtc-1.7.2-r0: task do_package: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_packagedata)
NOTE: recipe python3-dtc-1.7.2-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_create_spdx)
NOTE: Running task 2347 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package_write_ipk)
NOTE: Running task 2348 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package_write_deb)
NOTE: Running task 2349 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package_write_rpm)
NOTE: Running task 2350 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package_qa)
NOTE: Running task 2351 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_package_write_ipk)
NOTE: Running task 2352 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_package_write_deb)
NOTE: Running task 2353 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_package_write_rpm)
NOTE: Running task 2354 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_package_qa)
NOTE: recipe python3-dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_qa: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_qa: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2355 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_create_package_spdx)
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_package_spdx: Started
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtc_1.7.2.bb:do_package_qa unihash changed to 6bd4664f1847d36792c389430f0770663eea02026cbea65f92d0406cbf4d1f7a
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dtc-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtschema-2026.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_compile_ptest_base)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2357 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_install)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_install: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_install_ptest_base)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2359 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_package)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_package: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rpds-py_0.30.0.bb:do_packagedata)
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_packagedata: Started
NOTE: recipe python3-rpds-py-0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2361 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package_write_ipk)
NOTE: Running task 2362 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package_write_deb)
NOTE: Running task 2363 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package_write_rpm)
NOTE: Running task 2364 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonschema_4.26.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.26.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2365 of 2365 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dtschema_2026.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2365 tasks of which 2139 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-src went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-dbg went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-ptest went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-staticdev went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-dev went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-doc went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs-locale went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-attrs went backwards which would break package feeds (from 0:26.1.0-r0 to 0:25.4.0-r0) [version-going-backwards]
ERROR: python3-attrs-25.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6121262463759931696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/WHEEL was removed

--===============6121262463759931696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2025.12-2026.4.patch"

RnJvbSA4ZjFiZTU4MDFkODk3ZTljZWJjYzY3YjkwYmIxZDBmMjZlMDljYmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MzE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjUuMTIgLT4gMjAyNi40CgotLS0KIC4uLi97cHl0
aG9uMy1kdHNjaGVtYV8yMDI1LjEyLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNi40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyNS4x
Mi5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjYuNC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS4xMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjQuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjQuYmIKaW5kZXggNWFlNjc4MDVi
OS4uY2JkNDU5YzE1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjUuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjYuNC5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2No
ZW1hIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzI3ZmRmNWQ1ZWM2MDkzNGNjM2VkZGFiMDll
NjhiZTIzMTAxNzNhMzNlMTVlZWUyNGRmZmE4OTc4NzcwNmRiNyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxMGNkMGZmZTIzOWY4ZDg4OTEzMzkwYWM1ZDgyMTNmYWUzODJlODdhMjA2NDNiMjFjNjU3
MTRkZWQ4MmE0NDYwIgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2
ZSIKIFJERVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ3LjEKCg==

--===============6121262463759931696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.12.tar.gz;downloadfilename=dtschema-2025.12.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2026.4.tar.gz;downloadfilename=dtschema-2026.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-dtschema: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2025.12" to "2026.4"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2025.12 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 408486 to 411030 (+1%)
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2025.12" to "2026.4"
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/dtschema-2026.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/dtschema-2025.12.dist-info/WHEEL was removed

--===============6121262463759931696==--

