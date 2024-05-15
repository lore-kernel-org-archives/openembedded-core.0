Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96872C3DA52
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1232.1715794337235437525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h8tuBocN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G20NKcDv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fe7d1-61501058-06cc-4511-822e-ac94f7abfb23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k5e45dYV5ddM+YRkwXXB+6EhHi00dA8H4LBuTjpup+c=;
	b=h8tuBocN/LR5+fvCDAPla+5gky4YEcwJQCFTT83tX0GwMESW2h3HZBOFEGAno2Cr
	BS1596pD5A3Ilpgq68Dq1ITyVjAWuJEu5BKPhaNkmM6kAPGUBEz93ZQdxdW4jQB8vNg
	V7ya0GC0b667vQPWCmlro1TsDbemR+ovf5Hoc5+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k5e45dYV5ddM+YRkwXXB+6EhHi00dA8H4LBuTjpup+c=;
	b=G20NKcDvEL20mRDChmEuoz5XaZBfKaYjiU3V1aj6zpQ0A1HFr03As8gXzF6YUhcU
	Jy9EiC3epmB78fc6QiLG6Z3Svd9ODNiOYBixBrz3BVpgQb3jne4QfmNXy9McZ9To1op
	jmx6K2XgtMjTLYliIAmy0oSDFHOrdM713JdcWVYA=
Content-Type: multipart/mixed; boundary="===============7815700732024547836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.49 SUCCEEDED
Message-ID: <0101018f7d4fe7d1-61501058-06cc-4511-822e-ac94f7abfb23-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199415

--===============7815700732024547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgpg-error* to *1.49* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.48-1.49.patch
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
From 0104990e65831530c1e20289c4f0a59d10de4e52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 17:09:50 +0000
Subject: [PATCH] libgpg-error: upgrade 1.48 -> 1.49

---
 .../0001-Do-not-fail-when-testing-config-scripts.patch         | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch | 3 +--
 .../{libgpg-error_1.48.bb => libgpg-error_1.49.bb}             | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.48.bb => libgpg-error_1.49.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index d72838bb05..b93389db89 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 75622f8b21459eb556b36edc3537fdaded7f04bf Mon Sep 17 00:00:00 2001
+From ffdca4f94cd845302574e87a517b89c7ab5d3eba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 3d886bcaa4..a328f5787e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From b0df1cb468264a9bb9113524f0e1318c456b2348 Mon Sep 17 00:00:00 2001
+From 11e8cde00cd67f5f13c8671a473ca54aab669665 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -12,7 +12,6 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Refactored for 1.33
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-
 ---
  src/gpg-error.m4 | 192 ++---------------------------------------------
  1 file changed, 5 insertions(+), 187 deletions(-)
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
index 9f2b49209d..b7d41ab489 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "89ce1ae893e122924b858de84dc4f67aae29ffa610ebf668d5aa539045663d6f"
+SRC_URI[sha256sum] = "8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.44.0


--===============7815700732024547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 42 recipes from the core2-64 sysroot...done.
Removing 40 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fac07e24e3c9b4dd71892533a64258c2200cab9c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fac07e24e3c9b4dd71892533a64258c2200cab9c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 273 Local 172 Mirrors 0 Missed 101 Current 202 (63% match, 78% complete)
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 220 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 224 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 227 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 284 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 292 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 293 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 294 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 296 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 297 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 298 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 299 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 300 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 307 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 310 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 311 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 334 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 346 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 380 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 382 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 383 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 384 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 385 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 386 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 387 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 389 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 394 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 736 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 737 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 751 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 753 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_fetch)
NOTE: Running task 755 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 761 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 762 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 763 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_fetch)
NOTE: Running task 764 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_fetch)
NOTE: Running task 765 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_fetch)
NOTE: Running task 770 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 771 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 424 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 425 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 426 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 774 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: Running task 775 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_unpack)
NOTE: Running task 776 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 782 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_unpack)
NOTE: Running task 783 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: Running task 784 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe shadow-4.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 427 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 429 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 786 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe perl-5.38.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 787 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_fetch)
NOTE: Running task 790 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe shadow-4.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 794 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_patch)
NOTE: Running task 797 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Started
NOTE: Running task 799 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: recipe shadow-4.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 430 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: Running setscene task 432 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: Running setscene task 433 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 434 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 800 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_patch)
NOTE: Running task 801 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 803 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 804 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 806 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_patch)
NOTE: Running task 807 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 809 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: Running task 810 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: Running task 811 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Started
NOTE: recipe shadow-4.15.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: Running setscene task 438 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_unpack: Started
NOTE: Running setscene task 439 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 440 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 812 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Succeeded
NOTE: Running task 815 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_unpack: Started
NOTE: Running setscene task 441 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 442 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: Running task 817 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 819 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running setscene task 444 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 446 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 821 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 824 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 825 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe shadow-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 826 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 827 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 829 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: Running task 831 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 832 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch unihash changed to 40911cd1a055dac24829504acfa4a2218ed97135c0e21e7e124c95d5b8542a7a
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 445 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 835 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: Running task 836 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: Running task 837 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 838 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 839 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Succeeded
NOTE: Running task 843 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe perl-5.38.2-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 845 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: Running task 846 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe shadow-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 847 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 849 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe perl-5.38.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: Running task 858 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: Running task 863 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 453 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 864 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 868 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 880 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 904 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: Running task 914 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 965 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running task 968 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_lic)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_unpack)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running noexec task 975 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_lic: Started
NOTE: Running task 977 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: Running task 979 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 981 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_lic: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe perl-5.38.2-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_lic unihash changed to d07cea94261f7275aca586a370f53ba521a98400536c89558a052ba0c855734a
NOTE: Running setscene task 458 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 459 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 985 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_patch)
NOTE: Running task 988 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 992 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 996 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 998 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: Running task 1000 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: Running task 1001 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: Running task 1002 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: Running task 1005 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1008 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1009 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1010 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1012 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 1013 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1015 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to de4955b5e8bba7de65f37b3555f493771055cf00e045cace35ad109539e1cc71
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046af30f485647cdc4daf97991a290103f143d7d3bc201e5aa9bffcd6d2b5b32
NOTE: Running setscene task 381 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1018 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: Running task 1019 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1025 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 1027 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1041 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1043 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1048 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_patch)
NOTE: Running task 1049 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_patch: Succeeded
NOTE: Running noexec task 1051 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_configure)
NOTE: Running noexec task 1052 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_compile)
NOTE: Running task 1053 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_install)
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_install: Succeeded
NOTE: Running task 1066 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1069 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1070 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1071 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1072 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1074 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1076 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1077 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to 7bc86d9a4624c9799e93a71956ee080017a69089661fd8f7afa088666b6e2aeb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Running setscene task 446 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package unihash changed to 34ca37ca7f4c4c82f436276f433eee577196ad0cffb524e22aa35db2faf457a7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_create_spdx became valid
NOTE: Running setscene task 446 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1088 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_install: Succeeded
NOTE: Running task 1090 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1091 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Started
NOTE: recipe libgcc-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1092 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_configure)
NOTE: recipe libgcc-13.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1093 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_compile)
NOTE: recipe libgcc-13.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to 4466bede4f47b1de4d315179d1bd09962859025e2e92f7a5b0e7b1112c8fb135
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 448 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1094 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1097 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-13.2.0-r0: task do_install: Started
NOTE: recipe libgcc-13.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-13.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1098 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_multilib_install)
NOTE: recipe libgcc-13.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-13.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1099 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-13.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-13.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1101 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1102 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package)
NOTE: recipe libgcc-13.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1103 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_configure)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package unihash changed to fb931bf291c154cee5a5ac2c4ad4a23bac6e09ffbc63f72b60eec45c9587c285
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx became valid
NOTE: Running setscene task 450 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1106 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1107 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_compile)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1108 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_install)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_install: Succeeded
NOTE: Running task 1110 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1116 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1117 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package)
NOTE: Running task 1118 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1119 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1120 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1121 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1123 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1124 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1125 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1126 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_configure)
NOTE: recipe libcap-ng-0.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1127 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: Running task 1128 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe bash-completion-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_configure)
NOTE: Running task 1130 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1131 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1132 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_configure)
NOTE: Running task 1133 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_configure: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1135 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1136 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1137 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: Running task 1139 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1140 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1141 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1142 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1143 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1144 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1145 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1146 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_configure)
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1148 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1149 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1151 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1153 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_compile)
NOTE: recipe bash-completion-2.13.0-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1154 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_compile)
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_install)
NOTE: recipe bash-completion-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1156 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_install)
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_package unihash changed to 76674efdd4950027edbe3b159dc6c243e83d963fa7e20905c9013312976826c1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.8.4-r0: task do_configure: Succeeded
NOTE: Running setscene task 445 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1163 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1164 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1165 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running task 1166 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1167 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1168 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe bash-completion-2.13.0-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1171 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package)
NOTE: Running task 1172 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: Running task 1174 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package)
NOTE: Running task 1177 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_collect_spdx_deps)
NOTE: Running task 1178 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_package)
NOTE: Running task 1179 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_collect_spdx_deps)
NOTE: recipe libcap-ng-0.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1180 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_install: Started
NOTE: Running task 1181 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1182 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1183 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1184 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libcap-ng-0.8.4-r0: task do_install: Succeeded
NOTE: Running task 1186 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 1187 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1188 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1189 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1191 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package unihash changed to fcf94d5b3488c3f26571541b4f5b5e5b7f8bfeb196517c5ae031ba58f6ca9f74
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx became valid
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1192 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1193 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: Running task 1194 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package unihash changed to 0ed95fc78022aebe921a12cc702ab38abd23c5fc7ac6c70c58b227704c9eebc5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx became valid
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: Running task 1197 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: Running task 1199 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_collect_spdx_deps)
NOTE: Running task 1200 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 212a390fc1fa0c5479767dd43152fcfbbfbf70f3117749c9258e1c212f16cf32
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe libgpg-error-1.49-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.49-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: Running setscene task 455 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1201 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: Running task 1202 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_collect_spdx_deps)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: Running task 1203 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1209 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1210 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile)
NOTE: recipe libcap-ng-0.8.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_package unihash changed to 82c876504188e372a2d81b4876beccc1c0ece3449da1827893acf50ee0804f1e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata became valid
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Started
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running task 1212 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: Running task 1214 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_collect_spdx_deps)
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1215 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libcap-ng/0.8.4/temp/log.do_packagedata_setscene.3142362
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1216 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 1217 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1219 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1220 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_package unihash changed to 0066cdb277ad8e76e7c10bdc0d646fe30ec490d8e63ddf1817cea8595922b65f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata became valid
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: Running task 1221 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 0404170f728705487bea8fcf28266d99c081abaa32fc43ee213c784ad3292de8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx became valid
NOTE: Running setscene task 463 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to b7bf641fcd508aef0a2b6e2edd920730a169c1ad7460c6447da6fb825325bc32
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 456 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 467 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package unihash changed to 973068392fb8760f9626e9e2af39aaff0e49b230eca8e2a8bfc18b9d99037de8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx became valid
NOTE: Running setscene task 469 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to e4027089ffc1a0700b9a5cc4bbfb51e6c98746a832cd38241694c41cd801e23b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1232 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Succeeded
NOTE: Running task 1234 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm unihash changed to b0c4774b0b6669f4a8093ca44034567373126c4cc6e26343e6cb4fa3cb4b7768
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1235 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install)
NOTE: recipe libgpg-error-1.49-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1236 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1237 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1238 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: Running task 1239 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1240 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package)
NOTE: Running task 1241 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1242 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot unihash changed to dff321d81757663381c8c9d815f0451c0e55c81bfaada39210872f5f0c127a0c
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1243 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1245 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_compile: Succeeded
NOTE: Running task 1246 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1247 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1249 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1250 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe ncurses-6.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1251 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_compile: Started
NOTE: Running task 1253 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_package)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_package: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package unihash changed to 341a9e6b9ca6d5c7cfe23b8308c82ec32fdf575cb7bf954fe66474bcf77ec73a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1255 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx: Started
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 02dbfa21d10f807166514680a6269c54accc3f40afc3057d1d7faea59fdd57ed
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_package unihash changed to 53fdc922d7578d4a6aac9a9a24dbf91f0aa855f9c032f6038c16c8f2fe177435
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata became valid
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1256 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1258 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1262 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1264 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1266 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 1b159839c4ac24afeeb7e963f3f26d942c837989f4f571ef0cc6ea2288bd20c5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 3692f270753ebfdb74dd1a5fcfcf910522acae785af63428d6ef575c5ede4917
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_compile: Succeeded
NOTE: Running task 1268 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1270 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1271 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_install: Succeeded
NOTE: Running task 1273 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1274 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1275 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1276 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1277 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1278 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1280 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1281 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: Running task 1282 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1283 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe shadow-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1284 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_configure)
NOTE: recipe shadow-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1285 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_configure: Started
NOTE: recipe shadow-4.15.0-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_configure: Succeeded
NOTE: Running task 1286 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_compile)
NOTE: recipe util-linux-2.39.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1287 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure)
NOTE: recipe libcap-2.69-r0: task do_compile: Started
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_compile: Succeeded
NOTE: Running task 1288 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_install)
NOTE: recipe libcap-2.69-r0: task do_install: Started
NOTE: recipe libcap-2.69-r0: task do_install: Succeeded
NOTE: Running task 1290 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1291 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to 30424a6e24741e52b83511bb7384e9a380bd98013f30d89aad3c8a2f4caa4964
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 465 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1294 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to 44b3bade346f5af6380b0598ae32acdc869a1cf85169b89c1124b27ec6d4c0ef
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx became valid
NOTE: Running setscene task 471 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1296 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package)
NOTE: Running task 1298 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.69-r0: task do_package: Started
NOTE: recipe shadow-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1299 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1300 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1301 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1302 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1303 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1304 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1305 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile)
NOTE: recipe perl-5.38.2-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_package unihash changed to 35eb2d35b69910e16a8a6c05e68359df48b4cdfb78e8ace0d0f85fb7a8f7f16d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata became valid
NOTE: recipe shadow-4.15.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running task 1306 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_compile)
NOTE: recipe shadow-4.15.0-r0: task do_compile: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 1308 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 18ed9883b1d1471de552d951d0a7504f5774fee7ee96fe7e83416e3e2ec18124
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1309 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_install)
NOTE: recipe shadow-4.15.0-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 1311 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_package)
NOTE: Running task 1313 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1314 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_configure)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_configure: Succeeded
NOTE: Running task 1315 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_compile)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_compile: Succeeded
NOTE: Running task 1316 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_install)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_install: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1317 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install)
NOTE: recipe bash-5.2.21-r0: task do_install: Started
NOTE: recipe shadow-4.15.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_package unihash changed to b7e5447ffd2a24ccc7f009f0a4cabac0f808e1f59e01aded5c533b2d33684d2b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_packagedata became valid
NOTE: Running setscene task 474 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1319 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package)
NOTE: Running task 1321 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1323 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile)
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_install: Succeeded
NOTE: Running task 1324 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package: Succeeded
NOTE: Running task 1325 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata unihash changed to 8744960629caf5fa9c4431dfcbcf5353ea1f5ae9442d39bae91497cf4effd0ff
NOTE: Setscene tasks completed
NOTE: Running task 1326 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx)
NOTE: Running task 1327 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk)
NOTE: Running task 1328 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb)
NOTE: Running task 1329 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk unihash changed to 14990c6c4a029b6d534be11a45da144fe66aea93df3efcd5e069170c47d638b7
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb unihash changed to 5fe16b4d90367664c73eb7cb077e1103e211505be9ba79853e2c6581b4990235
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm unihash changed to 9dd467b7b0b1eddf8a044b38251b8dcd9cf1f610803c98683824df19e3f709d5
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1330 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_package: Started
NOTE: recipe util-linux-2.39.3-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1332 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install)
NOTE: recipe util-linux-2.39.3-r0: task do_install: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install: Succeeded
NOTE: Running task 1333 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.39.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1334 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package unihash changed to f9f6b387f478eb923b1a712c47f1fe1f1db7d4653210bfad1a53a3f36e64fb42
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata became valid
NOTE: recipe util-linux-2.39.3-r0: task do_package: Started
NOTE: Running setscene task 470 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_ipk)
NOTE: Running task 1338 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_deb)
NOTE: Running task 1339 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_rpm)
NOTE: Running task 1340 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_qa)
NOTE: Running task 1341 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_runtime_spdx)
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_ipk: Started
NOTE: recipe libgpg-error-1.49-r0: task do_create_runtime_spdx: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_deb: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package_qa: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.49-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_ipk unihash changed to 0bf7fc2835ae806138e19773db9828f3f2df76f22573c9076eb303ef0c6ea428
NOTE: recipe libgpg-error-1.49-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_qa unihash changed to 90e338b19ea95baecf33257ae346a1917e100356822dbc23d8a68b6c8ab3c422
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_deb unihash changed to 3f9dc0b9a976573e7ae96bf2fb6f9ac24dc753fbad7d1caaed0506b5a91916fb
NOTE: recipe libgpg-error-1.49-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package_write_rpm unihash changed to 6bdf431e3b95a687d75e5a20a6762f4278d40668e32d6d88f3dd01b3650111e8
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1342 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1343 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package unihash changed to 9ab16302345fccc2ea1bc6fd083398f41b197373f4cb34e32ec6b6cb96a34a90
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 1345 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1346 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 1347 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1348 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_compile: Succeeded
NOTE: Running task 1349 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1350 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_install)
NOTE: recipe perl-5.38.2-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package unihash changed to d5c121cf8f3e0cb221355ee7fd439303bbc433f48b8055fa52822d158a7e8455
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.38.2-r0: task do_install: Succeeded
NOTE: Running task 1352 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.38.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.38.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1353 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package)
NOTE: recipe perl-5.38.2-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package unihash changed to 869870f6636687ae52f2386095d4f2db14a01c00f661b01364380f0a91d3ead7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata became valid
NOTE: Running setscene task 475 of 475 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1355 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk)
NOTE: Running task 1356 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb)
NOTE: Running task 1357 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk unihash changed to 82ac6f2d45144f988a4c3a0738214a56881d456c768c4e5b4ff4c60e40316054
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb unihash changed to 227374a75dc2da3fd314547cac924feb3deba7a6ee04d25340a3cb9f0823d642
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm unihash changed to 4fdf710fced60a36088e0858619911b8762c3e260c265a2083077369640103d7
NOTE: Running noexec task 1358 of 1358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_build)
NOTE: Tasks Summary: Attempted 1358 tasks of which 1032 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.5-r0 to 0:0.8.4-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7815700732024547836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.48-1.49.patch"

RnJvbSAwMTA0OTkwZTY1ODMxNTMwYzFlMjAyODljNGYwYTU5ZDEwZGU0ZTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTc6MDk6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJncGctZXJyb3I6IHVwZ3JhZGUgMS40OCAtPiAxLjQ5CgotLS0KIC4uLi8wMDAxLURvLW5vdC1m
YWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCAgICAgICAgIHwgMiArLQogbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0
Y2ggfCAzICstLQogLi4uL3tsaWJncGctZXJyb3JfMS40OC5iYiA9PiBsaWJncGctZXJyb3JfMS40
OS5iYn0gICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJy
b3Ive2xpYmdwZy1lcnJvcl8xLjQ4LmJiID0+IGxpYmdwZy1lcnJvcl8xLjQ5LmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJy
b3IvMDAwMS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLzAwMDEtRG8tbm90
LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoCmluZGV4IGQ3MjgzOGJiMDUu
LmI5MzM4OWRiODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJv
ci9saWJncGctZXJyb3IvMDAwMS1Eby1ub3QtZmFpbC13aGVuLXRlc3RpbmctY29uZmlnLXNjcmlw
dHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1l
cnJvci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNzU2MjJmOGIyMTQ1OWViNTU2YjM2ZWRjMzUzN2ZkYWRlZDdm
MDRiZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmZkY2E0Zjk0Y2Q4NDUzMDI1NzRl
ODdhNTE3Yjg5YzdhYjVkM2ViYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAyOCBGZWIg
MjAyMCAwOToxOTo1NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgZmFpbCB3aGVuIHRl
c3RpbmcgY29uZmlnIHNjcmlwdHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2gKaW5kZXggM2Q4
ODZiY2FhNC4uYTMyOGY1Nzg3ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGIwZGYxY2I0NjgyNjRhOWJiOTExMzUyNGYwZTEzMThjNDU2YjIzNDgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDExZThjZGUwMGNkNjdmNWYxM2M4NjcxYTQ3
M2NhNTRhYWI2Njk2NjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDI5IE1hciAyMDE4IDE1OjEy
OjE3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN1cHBvcnQgcGtnY29uZmlnCkBAIC0xMiw3ICsx
Miw2IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNv
bT4KIFJlZmFjdG9yZWQgZm9yIDEuMzMKIFNpZ25lZC1vZmYtYnk6IEFybWluIEt1c3RlciA8YWt1
c3RlcjgwOEBnbWFpbC5jb20+CiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEu
Zm5zdEBjbi5mdWppdHN1LmNvbT4KLQogLS0tCiAgc3JjL2dwZy1lcnJvci5tNCB8IDE5MiArKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDE4NyBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS40OC5iYiBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS40OS5iYgpzaW1pbGFy
aXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJy
b3IvbGliZ3BnLWVycm9yXzEuNDguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdwZy1lcnJvci9saWJncGctZXJyb3JfMS40OS5iYgppbmRleCA5ZjJiNDkyMDlkLi5iN2Q0MWFi
NDg5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3Bn
LWVycm9yXzEuNDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xp
YmdwZy1lcnJvcl8xLjQ5LmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19N
SVJST1J9L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3ItJHtQVn0udGFyLmJ6MiBcCiAgICAgICAg
ICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4OWNlMWFlODkzZTEyMjkyNGI4NThkZTg0ZGM0ZjY3YWFlMjlmZmE2MTBlYmY2NjhkNWFh
NTM5MDQ1NjYzZDZmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiNzlkNTQ2MzlkYmY0YWJjMDhi
NTQwNmZiMmYzN2U2NjlhMmRlYzA5MWRkMDI0ZmI4N2RkMzY3MTMxYzYzYTkiCiAKIEJJTkNPTkZJ
RyA9ICIke2JpbmRpcn0vZ3BnLWVycm9yLWNvbmZpZyIKIAotLSAKMi40NC4wCgo=

--===============7815700732024547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libgpg-error: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.48.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.49.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1051320 to 1055408 (+0%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.35.0", added "/usr/lib/.debug/libgpg-error.so.0.36.0"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-dev: PKGSIZE changed from 208179 to 208819 (+0%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 916576 to 921410 (+1%)
packages/core2-64-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error: PV changed from "1.48" to "1.49"
packages/core2-64-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.48 [default] to 1.49 [default]
packages/core2-64-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.35.0", added "/usr/lib/libgpg-error.so.0.36.0"
Changes to packages/core2-64-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so.0.35.0 moved to /usr/lib/libgpg-error.so.0.36.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so.0.35.0 moved to /usr/lib/libgpg-error.so.0.36.0

--===============7815700732024547836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.35.0", added "/usr/lib/libgpg-error.so.0.36.0"
Changes to packages/core2-64-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so.0.35.0 moved to /usr/lib/libgpg-error.so.0.36.0
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.35.0 to libgpg-error.so.0.36.0
  /usr/lib/libgpg-error.so.0.35.0 moved to /usr/lib/libgpg-error.so.0.36.0

--===============7815700732024547836==--

