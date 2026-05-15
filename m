Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A38CD4F4E
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34822.1778851228595118131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OrL2a79S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xzNPJ3B0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbe703-08e549ac-83b1-4bd2-adb4-7b131aa3037f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rom/WFQeeEY5Wpf44uPyUzYxn2vDC0bZdZnQRrsgpco=;
	b=OrL2a79S7uSUa0gSVlR3TBoLiMzrdhB4RQ2rjm34Z22GsBekqQ+UuVMUbaXskL9q
	M7So9mnSL9C5rd3WL0DO7IW//rgK+mB3Wy6Q8CGBSsTIfGKz8N8Yudl7wplw3jr6iHB
	EXHTv97PIXybszwFStmQier9m26W4r3RVcx1kPYw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rom/WFQeeEY5Wpf44uPyUzYxn2vDC0bZdZnQRrsgpco=;
	b=xzNPJ3B0dKUaKMvaaGAalBmxjIUfoMihHR13UxiEmaryJezO7yGzXv2CjrNuAph4
	0ae7rkeUVADUJy9AwPZ9jtrCHRHv+r4PDLtqO0wcL1xP7jxtrIx33zGTN35imjR3cl4
	JoP5xm6c9buytl3fcuI2oZyAQOFvFtWv+AFhziys=
Content-Type: multipart/mixed; boundary="===============4672660823269251582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.7.0 FAILED
Message-ID: <0101019e2bcbe703-08e549ac-83b1-4bd2-adb4-7b131aa3037f-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237169

--===============4672660823269251582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjitterentropy* to *3.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.6.3-3.7.0.patch
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
From 8361ab557da7e9486b02c81798010d52c9f41cd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:49:59 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.6.3 -> 3.7.0

---
 ...opy_3.6.3.bb => libjitterentropy_3.7.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb => libjitterentropy_3.7.0.bb} (55%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
similarity index 55%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index 7890dfa5c7..b80aaccc79 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2017 - 2025, Stephan Mueller <smueller@chronox.de>
+# +Copyright (C) 2017 - 2026, Stephan Mueller <smueller@chronox.de>
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Hardware RNG based on CPU timing jitter"
 DESCRIPTION = "The Jitter RNG provides a noise source using the CPU execution timing jitter. \
 It does not depend on any system resource other than a high-resolution time \
@@ -5,12 +24,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcaa2e2fa77c4ea22e45bf79e9a41093 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "c90ff465dcdb6a6949542c72a26a8ab496daa8cb"
+SRCREV = "e783cf1c450bce4d72f95c9f9c84546a6094976a"
 
 do_configure[noexec] = "1"
 
-- 
2.47.1


--===============4672660823269251582==
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
DISTRO_VERSION       = "6.0.99+snapshot-3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 133 Local 121 Mirrors 0 Missed 12 Current 220 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 280 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_populate_lic_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 852 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 306 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 853 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 870 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 335 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 353 of 353 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 966 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjitterentropy-3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjitterentropy-3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 976 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_configure)
NOTE: Running task 977 of 988 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile)
NOTE: recipe libjitterentropy-3.7.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-base.o src/jitterentropy-base.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-gcd.o src/jitterentropy-gcd.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-health.o src/jitterentropy-health.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-noise.o src/jitterentropy-noise.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-sha3.o src/jitterentropy-sha3.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-status.o src/jitterentropy-status.c
| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/sources/libjitterentropy-3.7.0=/usr/src/debug/libjitterentropy/3.7.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/
 build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/recipe-sysroot-native=  -pipe -Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion -std=c11 -DJENT_CONF_ENABLE_INTERNAL_TIMER -fstack-protector-strong -I. -Isrc   -c -o jitterentropy-timer.o src/jitterentropy-timer.c
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-sha3.h:23,
|                  from src/jitterentropy-sha3.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-status.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-health.h:23,
|                  from src/jitterentropy-health.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-gcd.h:23,
|                  from src/jitterentropy-gcd.c:22:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-base.c:32:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [<builtin>: jitterentropy-gcd.o] Error 1
| make: *** Waiting for unfinished jobs....
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-base.h:23,
|                  from src/jitterentropy-timer.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| make: *** [<builtin>: jitterentropy-status.o] Error 1
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [<builtin>: jitterentropy-sha3.o] Error 1
| In file included from ./jitterentropy.h:48,
|                  from src/jitterentropy-internal.h:45,
|                  from src/jitterentropy-noise.h:23,
|                  from src/jitterentropy-noise.c:21:
| ./jitterentropy-base-user.h: In function 'jent_get_nstime':
| ./jitterentropy-base-user.h:263:13: error: implicit declaration of function 'clock_gettime' [-Wimplicit-function-declaration]
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |             ^~~~~~~~~~~~~
| make: *** [<builtin>: jitterentropy-health.o] Error 1
| ./jitterentropy-base-user.h:263:27: error: 'CLOCK_REALTIME' undeclared (first use in this function)
|   263 |         if (clock_gettime(CLOCK_REALTIME, &time) == 0) {
|       |                           ^~~~~~~~~~~~~~
| ./jitterentropy-base-user.h:263:27: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [<builtin>: jitterentropy-base.o] Error 1
| make: *** [<builtin>: jitterentropy-timer.o] Error 1
| make: *** [<builtin>: jitterentropy-noise.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 172
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 157
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 162
| 	#4: base_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 140
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 134
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470, line 182
NOTE: recipe libjitterentropy-3.7.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 977 tasks of which 968 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515124945.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515124945.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2107470
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libjitterentropy-3.7.0-r0 do_compile: oe_runmake failed
ERROR: libjitterentropy-3.7.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/run.do_compile.2107470' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjitterentropy/3.7.0/temp/log.do_compile.2107470
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb:do_compile) failed with exit code '1'

--===============4672660823269251582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.6.3-3.7.0.patch"

RnJvbSA4MzYxYWI1NTdkYTdlOTQ4NmIwMmM4MTc5ODAxMGQ1MmM5ZjQxY2QwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6NDk6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNi4zIC0+IDMuNy4wCgotLS0KIC4uLm9weV8zLjYu
My5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNy4wLmJifSB8IDIzICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkve2xpYmppdHRlcmVudHJv
cHlfMy42LjMuYmIgPT4gbGliaml0dGVyZW50cm9weV8zLjcuMC5iYn0gKDU1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJv
cHlfMy42LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmpp
dHRlcmVudHJvcHlfMy43LjAuYmIKc2ltaWxhcml0eSBpbmRleCA1NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5XzMuNi4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmpp
dHRlcmVudHJvcHlfMy43LjAuYmIKaW5kZXggNzg5MGRmYTVjNy4uYjgwYWFjY2M3OSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRy
b3B5XzMuNi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkv
bGliaml0dGVyZW50cm9weV8zLjcuMC5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNv
cHlyaWdodCAoQykgMjAxNyAtIDIwMjUsIFN0ZXBoYW4gTXVlbGxlciA8c211ZWxsZXJAY2hyb25v
eC5kZT4KKyMgK0NvcHlyaWdodCAoQykgMjAxNyAtIDIwMjYsIFN0ZXBoYW4gTXVlbGxlciA8c211
ZWxsZXJAY2hyb25veC5kZT4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3Vy
Y2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICBtb2RpZmljYXRpb24sIGFy
ZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgCisj
CisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgUk5HIGJhc2VkIG9uIENQVSB0aW1pbmcgaml0dGVyIgog
REVTQ1JJUFRJT04gPSAiVGhlIEppdHRlciBSTkcgcHJvdmlkZXMgYSBub2lzZSBzb3VyY2UgdXNp
bmcgdGhlIENQVSBleGVjdXRpb24gdGltaW5nIGppdHRlci4gXAogSXQgZG9lcyBub3QgZGVwZW5k
IG9uIGFueSBzeXN0ZW0gcmVzb3VyY2Ugb3RoZXIgdGhhbiBhIGhpZ2gtcmVzb2x1dGlvbiB0aW1l
IFwKQEAgLTUsMTIgKzI0LDEyIEBAIHN0YW1wLiBJdCBpcyBhIHNtYWxsLXNjYWxlLCB5ZXQgZmFz
dCBlbnRyb3B5IHNvdXJjZSB0aGF0IGlzIHZpYWJsZSBpbiBhbG1vc3QgXAogYWxsIGVudmlyb25t
ZW50cyBhbmQgb24gYSBsb3Qgb2YgQ1BVIGFyY2hpdGVjdHVyZXMuIgogSE9NRVBBR0UgPSAiaHR0
cDovL3d3dy5jaHJvbm94LmRlL2plbnQuaHRtbCIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRl
ciB8IEJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PWUwMTAyN2M0YWQxZmU1YTQ3NjhmODQ4OGM5NDVkNDkxIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PWZjYWEyZTJmYTc3YzRlYTIyZTQ1YmY3OWU5YTQxMDkzIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuZ3BsdjI7bWQ1PWViNzIzYjYxNTM5ZmVl
ZjAxM2RlNDc2ZTY4YjVjNTBhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0Uu
YnNkO21kNT02NmE1Y2VkYWY2MmM0YjI2MzcwMjVmMDQ5ZjliODI2ZiBcCiAgICAgICAgICAgICAg
ICAgICAgICIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zbXVlbGxlckREL2ppdHRlcmVu
dHJvcHktbGlicmFyeS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9diR7UFZ9
IgotU1JDUkVWID0gImM5MGZmNDY1ZGNkYjZhNjk0OTU0MmM3MmEyNmE4YWI0OTZkYWE4Y2IiCitT
UkNSRVYgPSAiZTc4M2NmMWM0NTBiY2U0ZDcyZjk1YzlmOWM4NDU0NmE2MDk0OTc2YSIKIAogZG9f
Y29uZmlndXJlW25vZXhlY10gPSAiMSIKIAotLSAKMi40Ny4xCgo=

--===============4672660823269251582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy: SRC_URI changed from "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.6.3" to "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https;tag=v3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 53792 to 71056 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.6.3", added "/usr/lib/.debug/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 4567 to 4643 (+2%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: FILELIST: directory renamed /usr/src/debug/libjitterentropy/3.6.3 -> /usr/src/debug/libjitterentropy/3.7.0, removed "/usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-base.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-health.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.6.3/src/jitterentropy-gcd.c", added "/usr/src/debug/libjitterentropy/3.7.0/src
 /jitterentropy-base.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-status.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-noise.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-base.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-noise.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-health.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-timer.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.c /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-internal.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-sha3.h /usr/src/debug/libjitterentropy/3.7.0/src/jitterentropy-gcd.c"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.6.3" to "3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.6.3 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.6.3" to "3.7.0"
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============4672660823269251582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 53792 to 71056 (+32%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 34239 to 30285 (-12%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 119462 to 167814 (+40%)
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.3", added "/usr/lib/libjitterentropy.so.3.7.0"
packages/x86-64-v3-poky-linux/libjitterentropy/libjitterentropy: PKGSIZE changed from 38905 to 51193 (+32%)
Changes to packages/x86-64-v3-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.3 to libjitterentropy.so.3.7.0
  /usr/lib/libjitterentropy.so.3.6.3 moved to /usr/lib/libjitterentropy.so.3.7.0

--===============4672660823269251582==--

