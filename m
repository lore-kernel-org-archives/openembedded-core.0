Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202C2C44507
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 06:06:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.266.1783749982918722245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 23:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=maixBBuj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GIFsO7Qa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f4fc8b7ad-45635664-ab28-438c-aeca-6f4eb5176855-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783749982;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=XybSXQqCZ4z2aBNWKtCtski30TH3LtSB8o5+gBm4QWQ=;
	b=maixBBujw4/DbO0SsP0uaZCC6r3wnua+RwjIXd4gQO7MC6ef3YjSHfZ/GpbKq/T8
	YkUkBcZWRn7Ueto09Xwd/v18u5prgcPcpaqW/Pu3ezGH3Bjee6zVvVvMi3tbA81WAmc
	RG9V5LUfdIOtzTCLt4nHM7anSr0B3MEAvJM09nIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783749982;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=XybSXQqCZ4z2aBNWKtCtski30TH3LtSB8o5+gBm4QWQ=;
	b=GIFsO7QaGNX3vkXAH09LGMdO8voxejMFL3Z5G/L5xtlAMIHcNzpHb0CpR9agUWRp
	JOTkYKcH19cA3+tjqDr+IhJc7DfuYhfJJleKCGg6Iu2vWadgyPscBrODKGdc8OsyPZW
	1r9SRqbKltv6fzQKAdQXpKg3AIMJ/J6eCjnyVJnA=
Content-Type: multipart/mixed; boundary="===============6869513666869799243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.26.4 SUCCEEDED
Message-ID: <0101019f4fc8b7ad-45635664-ab28-438c-aeca-6f4eb5176855-000000@us-west-2.amazonses.com>
Date: Sat, 11 Jul 2026 06:06:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 06:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240704

--===============6869513666869799243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.26.2-0.26.4.patch
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
From 11d1c99cb78c450f5e1e09ee3de16e841c8bc2a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 11 Jul 2026 06:06:15 +0000
Subject: [PATCH] p11-kit: upgrade 0.26.2 -> 0.26.4

---
 .../p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index ea636bfb0a..aaf64ce094 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -11,7 +11,7 @@ DEPENDS = "libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
-SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
+SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} trust"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-- 
2.47.1


--===============6869513666869799243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6540f948d23c7b5669e2fee73d73e0d3757b5409"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:6540f948d23c7b5669e2fee73d73e0d3757b5409"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 173 Local 123 Mirrors 0 Missed 50 Current 294 (71% match, 89% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 365 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 378 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 386 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 389 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 877 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_recipe_qa)
NOTE: Running task 902 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_write_config)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_write_config: Started
NOTE: recipe libffi-3.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 946 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe p11-kit-0.26.4-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 432 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe libffi-3.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 949 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_fetch)
NOTE: Running task 951 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 953 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 955 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 956 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_fetch)
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.6.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running task 958 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 441 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe p11-kit-0.26.4-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.6.0-r0: task do_unpack: Started
NOTE: Running task 961 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 963 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 964 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: Running task 965 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 442 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 443 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 444 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 967 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 969 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running setscene task 446 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.6.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 970 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 985 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 987 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 989 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe libffi-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 452 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-0.26.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_unpack)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running noexec task 994 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 458 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 996 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running setscene task 460 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1006 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1008 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1014 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1016 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1017 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1019 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1021 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: Running task 1022 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: Running task 1025 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: Running task 1026 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1028 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1029 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1030 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 1031 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 1033 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_patch: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_patch: Succeeded
NOTE: Running task 1035 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1038 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to 0cab5ecd0a07bb61c61a6db3beed6f90afa6573f5e36302eaa1c1ec1295aa8d6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Running setscene task 465 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1044 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1045 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1046 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Running task 1059 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1062 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1063 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1064 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1065 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1067 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1068 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.6+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.6+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1069 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.6+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.6+git-r0: task do_configure: Succeeded
NOTE: Running task 1070 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.6+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to 79db74f348cc621089856a0e00610403f5bc0bbffb498766e15c90ef97dc8019
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Running setscene task 465 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to fdf4d2d807d63001a4657eaa88a0118577dfcae019545059dfc6325e10574e34
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Running setscene task 463 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe musl-1.2.6+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1077 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.6+git-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_install: Succeeded
NOTE: Running task 1079 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1080 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-16.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package: Started
NOTE: recipe libgcc-16.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1081 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_configure)
NOTE: recipe libgcc-16.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-16.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1082 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_compile)
NOTE: recipe libgcc-16.1.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to 86f2f321caffd240faf51b2d7766354c10b294212a1a48d54b892b9c26c8943a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcc-16.1.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1085 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_install)
NOTE: recipe libgcc-16.1.0-r0: task do_install: Started
NOTE: recipe libgcc-16.1.0-r0: task do_install: Succeeded
NOTE: Running task 1086 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_multilib_install)
NOTE: recipe libgcc-16.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-16.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1087 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-16.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-16.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1089 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1090 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_package)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-16.1.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1091 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_configure)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-16.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_package unihash changed to c5ee3b7f5ce2339128d2389f71515c66b915bdb4ff78a81936f03207609ea3e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx became valid
NOTE: Running setscene task 463 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-runtime-16.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1094 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_compile)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1095 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_install)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_install: Succeeded
NOTE: Running task 1102 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_package)
NOTE: Running task 1103 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1104 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1105 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1106 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1107 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: Running task 1108 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_configure)
NOTE: Running task 1109 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1110 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe libffi-3.6.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1111 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1114 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1115 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1116 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_compile)
NOTE: recipe bash-completion-2.17.0-r0: task do_compile: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1117 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_install)
NOTE: recipe bash-completion-2.17.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_package unihash changed to 2562067199835ae8a950bcf0325c1ab949350cb9ece7fcd54de9506fe6afb567
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx became valid
NOTE: Running setscene task 462 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1121 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe libffi-3.6.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_compile)
NOTE: recipe libffi-3.6.0-r0: task do_compile: Started
NOTE: recipe libffi-3.6.0-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 1123 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to ec875da3f878e5fd654e5325af98b868505ae6c0320d827771d6ace2b4beb11b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.6.0-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libffi-3.6.0-r0: task do_install: Succeeded
NOTE: Running task 1125 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_package)
NOTE: recipe libffi-3.6.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package)
NOTE: recipe bash-completion-2.17.0-r0: task do_package: Started
NOTE: recipe libffi-3.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_package unihash changed to fc13bcda3adac4054b291e456122e5d40c57cae6e380489d92d67fb47d5840ba
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_create_spdx became valid
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.6.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libffi/3.6.0/temp/log.do_packagedata_setscene.2759520
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1129 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.6.0.bb:do_packagedata)
NOTE: recipe libffi-3.6.0-r0: task do_packagedata: Started
NOTE: recipe libffi-3.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package unihash changed to 5b0c74950fd95ae370a9de7e358645c1e9f30897bd97ea02be8bbf23f3e7c47d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1133 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1134 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: Running task 1135 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package)
NOTE: Running task 1137 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1138 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_configure)
NOTE: recipe p11-kit-0.26.4-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package unihash changed to 5a699cd8b1223fa47c5ecbceb88da6ab313cbe731bd286b730d97ed4e6987b51
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 465 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1141 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1142 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_compile)
NOTE: recipe p11-kit-0.26.4-r0: task do_compile: Started
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: Running task 1143 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_install)
NOTE: recipe ncurses-6.6-r0: task do_install: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_compile: Succeeded
NOTE: Running task 1144 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_install)
NOTE: recipe p11-kit-0.26.4-r0: task do_install: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_install: Succeeded
NOTE: Running task 1145 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_package)
NOTE: Running task 1146 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.26.4-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1149 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1150 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package: Succeeded
NOTE: Running task 1151 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_packagedata)
NOTE: recipe p11-kit-0.26.4-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1152 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_create_spdx)
NOTE: Running task 1153 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_package_write_ipk)
NOTE: Running task 1154 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_package_write_deb)
NOTE: Running task 1155 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_package_write_rpm)
NOTE: Running task 1156 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_package_qa)
NOTE: recipe p11-kit-0.26.4-r0: task do_create_spdx: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_ipk: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_deb: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1157 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_create_package_spdx)
NOTE: recipe p11-kit-0.26.4-r0: task do_create_package_spdx: Started
NOTE: recipe p11-kit-0.26.4-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_create_package_spdx: Succeeded
NOTE: recipe p11-kit-0.26.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package unihash changed to 0327172745aaeeac822967dc73a1d3ec5d286f77d9ff512a52b006e2b0ea06a8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata became valid
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1159 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1160 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1162 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1163 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1164 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to cd462e890252828531544d96b1804ccfc707b9f56023a83f15ef926d56451aef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_ipk became valid
NOTE: Running setscene task 463 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 466 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 467 of 467 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1168 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_package_write_rpm unihash changed to 33ae4703797824439c8d0e16e0904a4ffdf0a3a43abb7a48892561025f4eaf60
NOTE: Running noexec task 1170 of 1170 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1170 tasks of which 1047 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi-locale went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libffi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.6.0-r0) [version-going-backwards]
ERROR: libffi-3.6.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6869513666869799243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.26.2-0.26.4.patch"

RnJvbSAxMWQxYzk5Y2I3OGM0NTBmNWUxZTA5ZWUzZGUxNmU4NDFjOGJjMmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTEgSnVsIDIwMjYgMDY6MDY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjYuMiAtPiAwLjI2LjQKCi0tLQogLi4uL3AxMS1raXQve3AxMS1r
aXRfMC4yNi4yLmJiID0+IHAxMS1raXRfMC4yNi40LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvcDExLWtpdC97cDExLWtpdF8wLjI2LjIuYmIgPT4gcDExLWtpdF8wLjI2
LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9w
MTEta2l0XzAuMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8w
LjI2LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuNC5iYgppbmRleCBlYTYzNmJmYjBhLi5hYWY2NGNl
MDk0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRfMC4y
Ni4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2LjQu
YmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5EUyA9ICJsaWJmZmkiCiBERVBFTkRTOmFwcGVuZCA9
ICIke0AnIGdsaWItMi4wJyBpZiBkLmdldFZhcignR1RLRE9DX0VOQUJMRUQnKSA9PSAnVHJ1ZScg
ZWxzZSAnJ30iCiAKIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3AxMS1nbHVlL3AxMS1r
aXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9JHtQVn0iCi1TUkNSRVYgPSAiOGU2
ZTRlNmQ2NGQ5ZmU5MWM2MmIwMDUyYzEwNWIyYjcyZDRjMjRlZiIKK1NSQ1JFViA9ICJhMTQ3ODg4
NDlkMWVmNDQ0MjJkNjc5NTM0YTEzODIxZWFiNWJiNWY0IgogCiBQQUNLQUdFQ09ORklHID8/PSAi
JHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIGQpfSB0cnVz
dCIKIFBBQ0tBR0VDT05GSUdbc3lzdGVtZF0gPSAiLURzeXN0ZW1kPWVuYWJsZWQsLURzeXN0ZW1k
PWRpc2FibGVkLHN5c3RlbWQiCi0tIAoyLjQ3LjEKCg==

--===============6869513666869799243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGSIZE changed from 821 to 38299 (+4565%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.8", added "/usr/lib/libp11-kit.so.0.4.10"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.8 to libp11-kit.so.0.4.10
  /usr/lib/libp11-kit.so.0.4.10 was added
  /usr/lib/libp11-kit.so.0.4.8 was removed
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.8 to libp11-kit.so.0.4.10
  /usr/lib/libp11-kit.so.0.4.10 was added
  /usr/lib/libp11-kit.so.0.4.8 was removed

--===============6869513666869799243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/p11-kit: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit: SRC_URI changed from "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.2" to "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.4"
packages/x86-64-v3-poky-linux/p11-kit: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: FILELIST: removed "/usr/lib/.debug/libp11-kit.so.0.4.8", added "/usr/lib/.debug/libp11-kit.so.0.4.10"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 18064344 to 18070168 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGSIZE changed from 821 to 38299 (+4565%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGSIZE changed from 38240 to 38344 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PKGSIZE changed from 1829269 to 1833365 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: FILELIST: directory renamed /usr/src/debug/p11-kit/0.26.2/p11-kit -> /usr/src/debug/p11-kit/0.26.4/p11-kit, directory renamed /usr/src/debug/p11-kit/0.26.2/common -> /usr/src/debug/p11-kit/0.26.4/common, directory renamed /usr/src/debug/p11-kit/0.26.2/trust -> /usr/src/debug/p11-kit/0.26.4/trust
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 2027147 to 2033023 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.26.2" to "0.26.4"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.8", added "/usr/lib/libp11-kit.so.0.4.10"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGV changed from 0.26.2 [default] to 0.26.4 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 1893097 to 1893098 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PV changed from "0.26.2" to "0.26.4"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.8 to libp11-kit.so.0.4.10
  /usr/lib/libp11-kit.so.0.4.10 was added
  /usr/lib/libp11-kit.so.0.4.8 was removed
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.8 to libp11-kit.so.0.4.10
  /usr/lib/libp11-kit.so.0.4.10 was added
  /usr/lib/libp11-kit.so.0.4.8 was removed

--===============6869513666869799243==--

