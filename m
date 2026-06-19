Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461D0CDB471
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37024.1781849908775979663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oPOp29DA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=So7TV0q4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ede87e317-04ca6ffd-11f4-41d6-962d-ca6306bc7f0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lMSfeaKXJahEvyvaY4CijFIZ2SQRoN8uHiOTjjAl/qQ=;
	b=oPOp29DAuTlsIjrlmXtf6QIrcIvTOFuZcKSb1U672Bjc75+Rq22dOcPJ1qZ3j/12
	gKr6Qjutk3f37zjDCra0YifDISRUSZ8t8hmKdKCCjioGJLtNH5tqhp+t+QEQCvblJBL
	fw0OiGK73cq10U97CJDd3t9s0LwOKMicZ0itB0Kk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lMSfeaKXJahEvyvaY4CijFIZ2SQRoN8uHiOTjjAl/qQ=;
	b=So7TV0q4dUITt/a6tiZI3JuHdYPC35FQZ2UXn3PILKBwK5VHnBGQb1T2a0LWotvf
	Sqv87Y5XT+7d81wcUKebINiLsCMG/Wy42rMBHkQsj3wUdqLJ65oE5y6k3NbvVpzrnxg
	YqWbNuH15P9i8VsndviujcgZEOr0+4WmmzKIYhq4=
Content-Type: multipart/mixed; boundary="===============1551462770498693874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87e317-04ca6ffd-11f4-41d6-962d-ca6306bc7f0a-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239122

--===============1551462770498693874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.4.350.0-1.4.350.1.patch
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
From d8d5c9b32d39da42e94839792f18e3903867feb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 05:49:28 +0000
Subject: [PATCH] spirv-tools: upgrade 1.4.350.0 -> 1.4.350.1

---
 .../spir/{spirv-tools_1.4.350.0.bb => spirv-tools_1.4.350.1.bb}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.350.0.bb => spirv-tools_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb
-- 
2.47.1


--===============1551462770498693874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c6a2121491c570484864401db4e84657d86b7ff5"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:c6a2121491c570484864401db4e84657d86b7ff5"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 187 Local 175 Mirrors 0 Missed 12 Current 195 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 245 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 313 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 862 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 324 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 327 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 328 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 330 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/spirv-headers/1.4.350.0/temp/log.do_packagedata_setscene.1699608
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_package_setscene)
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 863 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 893 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_create_recipe_spdx)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_package_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 348 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_patch: Succeeded
NOTE: Running task 904 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 905 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_generate_toolchain_file)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 365 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 380 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1006 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_packagedata)
NOTE: Running task 1010 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1014 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_configure: Succeeded
NOTE: Running task 1015 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_compile: Succeeded
NOTE: Running task 1016 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_install)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_install: Succeeded
NOTE: Running task 1017 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_package)
NOTE: Running task 1018 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1020 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_create_spdx)
NOTE: Running task 1021 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_package_write_ipk)
NOTE: Running task 1022 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_package_write_deb)
NOTE: Running task 1023 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_package_write_rpm)
NOTE: Running task 1024 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_package_qa)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_ipk: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_deb: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_qa: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1025 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_create_package_spdx)
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_qa: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_package_spdx: Started
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1026 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1026 tasks of which 1004 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.350.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1551462770498693874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSBkOGQ1YzliMzJkMzlkYTQyZTk0ODM5NzkyZjE4ZTM5MDM4NjdmZWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDU6NDk6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjQuMzUwLjAgLT4gMS40LjM1MC4xCgotLS0KIC4uLi9zcGly
L3tzcGlydi10b29sc18xLjQuMzUwLjAuYmIgPT4gc3BpcnYtdG9vbHNfMS40LjM1MC4xLmJifSAg
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtdG9vbHNfMS40LjM1MC4wLmJi
ID0+IHNwaXJ2LXRvb2xzXzEuNC4zNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM1MC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM1MC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29s
c18xLjQuMzUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2
LXRvb2xzXzEuNC4zNTAuMS5iYgotLSAKMi40Ny4xCgo=

--===============1551462770498693874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-tools: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-bin: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-bin: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-src: FILELIST: directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/opt -> /usr/src/debug/spirv-tools/1.4.350.1/source/opt, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/cfg -> /usr/src/debug/spirv-tools/1.4.350.1/tools/cfg, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/include/spirv-tools -> /usr/src/debug/spirv-tools/1.4.350.1/include/spirv-tools, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools -> /usr/src/debug/spirv-tools/1.4.350.1/tools, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/diff -> /usr/src/debug/spirv-tools/1.4.350.1/tools/diff, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/val -> /usr/src/debug/spirv-tools/1.4.350.1/tools/val, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/reduce -> /usr/src/debug/spirv-tools/1.4.350.1/tools/reduce, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/lint -> /usr/src/debug/spirv-tools
 /1.4.350.1/tools/lint, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/dis -> /usr/src/debug/spirv-tools/1.4.350.1/tools/dis, directory renamed /usr/src/debug/spirv-tools/1.4.350.0 -> /usr/src/debug/spirv-tools/1.4.350.1, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/val -> /usr/src/debug/spirv-tools/1.4.350.1/source/val, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/util -> /usr/src/debug/spirv-tools/1.4.350.1/tools/util, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/link -> /usr/src/debug/spirv-tools/1.4.350.1/tools/link, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/as -> /usr/src/debug/spirv-tools/1.4.350.1/tools/as, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/opt -> /usr/src/debug/spirv-tools/1.4.350.1/tools/opt, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/util -> /usr/src/debug/spirv-tools/1.4.350.1/source/util, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/sou
 rce/diff -> /usr/src/debug/spirv-tools/1.4.350.1/source/diff, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/lint -> /usr/src/debug/spirv-tools/1.4.350.1/source/lint, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source -> /usr/src/debug/spirv-tools/1.4.350.1/source, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/link -> /usr/src/debug/spirv-tools/1.4.350.1/source/link, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/tools/objdump -> /usr/src/debug/spirv-tools/1.4.350.1/tools/objdump, directory renamed /usr/src/debug/spirv-tools/1.4.350.0/source/reduce -> /usr/src/debug/spirv-tools/1.4.350.1/source/reduce
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/spirv-tools/spirv-tools: PV changed from "1.4.350.0" to "1.4.350.1"

--===============1551462770498693874==--

