Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC1ACFD2E5
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.53361.1728588948281790444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LwweR+w/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VIKLvBri;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277ee20dd-183d98bc-8f89-4433-964b-09556a8db4c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UQBRX5h+lQyxS68K5LgCDG5XvVfhIYzarulxyt6gHWI=;
	b=LwweR+w/+YqlVULnaAU8xvbBWhs7STRL2nBv87Fb/DBppfQtbru+MepdUV5sCjxp
	eHqnimkuLx/bek6KvMFy7tz493O1WUXIlXhXlEWGBmGQ+4W4wVVQXgKc77Wq4FZkzQG
	4fQV4oWg52uqR23LmerkTLAIiFzywXgK4eJFs0N4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588947;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UQBRX5h+lQyxS68K5LgCDG5XvVfhIYzarulxyt6gHWI=;
	b=VIKLvBri1W14mT2K5eAfQza3Cot6cbmKbF5B/qQuwkOFj2ddOTHNp3zGh7hhxaY+
	/RplzKK072Diek2q6Fj967FNBJSS3TDGPJZgnCttv/n9M5hcLwR8VsITtf5CjNfthiT
	nYOrFe2FYS7DPDDgn2jEf8hVM67ZAgs/GHGV6Tng=
Content-Type: multipart/mixed; boundary="===============1200829730988374966=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.3 SUCCEEDED
Message-ID: <0101019277ee20dd-183d98bc-8f89-4433-964b-09556a8db4c6-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205456

--===============1200829730988374966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2024.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.2-2024.3.patch
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
From 44ce0a9ac3b89d87e5bffd18cc2c6317a2a8a891 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 04:58:01 +0000
Subject: [PATCH] shaderc: upgrade 2024.2 -> 2024.3

---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../0002-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2024.2.bb => shaderc_2024.3.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.2.bb => shaderc_2024.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..d6c454a0ec 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From 8bba74922c72682b0b6570637fe340c0c546beec Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..e7a090f7d9 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 9195ebe45add77a3248eb5480a6d99d6995fbba2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.2.bb b/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.3.bb
index c658e7df05..0948ba28d6 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "5dad9194c038702ef20ccabbe4e3c188f2b13cec"
+SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.1


--===============1200829730988374966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-64 sysroot...done.
Removing 8 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8f2a7b17895c465a78b8ccd05e6125af182a3e83"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 151 Local 140 Mirrors 0 Missed 11 Current 183 (92% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 198 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_populate_lic_setscene)
NOTE: recipe glslang-1_1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 257 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running task 684 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_recipe_qa)
NOTE: recipe glslang-1_1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.3-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 261 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glslang/1.3.290.0/temp/log.do_packagedata_setscene.2638883
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 262 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 263 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 685 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_fetch)
NOTE: recipe shaderc-2024.3-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.3-r0: task do_fetch: Succeeded
NOTE: Running task 686 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.3-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_unpack: Succeeded
NOTE: Running task 747 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_patch)
NOTE: recipe shaderc-2024.3-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 281 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 282 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shaderc-2024.3-r0: task do_patch: Succeeded
NOTE: Running task 748 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 749 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_generate_toolchain_file)
NOTE: recipe glslang-1_1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2024.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 300 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 321 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 322 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 334 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 957 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb:do_packagedata)
NOTE: Running task 958 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.290.0-r0: task do_packagedata: Started
NOTE: recipe shaderc-2024.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.290.0-r0: task do_packagedata: Succeeded
NOTE: Running task 969 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2024.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 970 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_configure)
NOTE: recipe shaderc-2024.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2024.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_configure: Started
NOTE: recipe shaderc-2024.3-r0: task do_configure: Succeeded
NOTE: Running task 971 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_compile)
NOTE: recipe shaderc-2024.3-r0: task do_compile: Started
NOTE: recipe shaderc-2024.3-r0: task do_compile: Succeeded
NOTE: Running task 972 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_install)
NOTE: recipe shaderc-2024.3-r0: task do_install: Started
NOTE: recipe shaderc-2024.3-r0: task do_install: Succeeded
NOTE: Running task 973 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_package)
NOTE: Running task 974 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_populate_sysroot)
NOTE: recipe shaderc-2024.3-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2024.3-r0: task do_package: Started
NOTE: recipe shaderc-2024.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_package: Succeeded
NOTE: Running task 975 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_packagedata)
NOTE: recipe shaderc-2024.3-r0: task do_packagedata: Started
NOTE: recipe shaderc-2024.3-r0: task do_packagedata: Succeeded
NOTE: Running task 976 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_create_spdx)
NOTE: Running task 977 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_package_write_ipk)
NOTE: Running task 978 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_package_write_deb)
NOTE: Running task 979 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_package_write_rpm)
NOTE: Running task 980 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_package_qa)
NOTE: recipe shaderc-2024.3-r0: task do_create_spdx: Started
NOTE: recipe shaderc-2024.3-r0: task do_package_write_ipk: Started
NOTE: recipe shaderc-2024.3-r0: task do_package_write_deb: Started
NOTE: recipe shaderc-2024.3-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2024.3-r0: task do_package_qa: Started
NOTE: recipe shaderc-2024.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 981 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_create_package_spdx)
NOTE: recipe shaderc-2024.3-r0: task do_create_package_spdx: Started
NOTE: recipe shaderc-2024.3-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe shaderc-2024.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 982 of 982 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.3.bb:do_build)
NOTE: Tasks Summary: Attempted 982 tasks of which 960 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.296.0-r0 to 1:1.3.290.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.290.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1200829730988374966==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.2-2024.3.patch"

RnJvbSA0NGNlMGE5YWMzYjg5ZDg3ZTViZmZkMThjYzJjNjMxN2EyYThhODkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDQ6NTg6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjQuMiAtPiAyMDI0LjMKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICAgIHwgMiArLQogLi4u
LzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBh
dGNoIHwgMiArLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNC4yLmJiID0+IHNoYWRlcmNfMjAy
NC4zLmJifSAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
e3NoYWRlcmNfMjAyNC4yLmJiID0+IHNoYWRlcmNfMjAyNC4zLmJifSAoOTUlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCmluZGV4IDVjNDlhYTdmZDUuLmQ2YzQ1NGEwZWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVy
bmFsLWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQxZjVmNTgzMWU3
YTUyYzI2MTY4ZjgxZjI1ZDA0NzA4NjBjYTZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOGJiYTc0OTIyYzcyNjgyYjBiNjU3MDYzN2ZlMzQwYzBjNTQ2YmVlYyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29t
PgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBjbWFrZTogZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmct
aGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggMzlmOTgyYjdmMy4uZTdhMDkwZjdkOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJz
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGVjMjQ0Mjk0MGUxZDUzMzg5NzE4NjFiYjgxNTM3YmFlM2E2YzE5ZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDkxOTVlYmU0NWFkZDc3YTMyNDhlYjU0ODBhNmQ5OWQ2OTk1ZmJi
YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNt
YS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXggZ2xzbGFuZyBoZWFkZXIgZmls
ZSBsb2NhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hh
ZGVyY18yMDI0LjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIw
MjQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjMuYmIKaW5kZXggYzY1OGU3ZGYwNS4uMDk0OGJh
MjhkNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDI0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0
LjMuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9nb29n
bGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNSRVYgPSAiNWRhZDkxOTRjMDM4NzAyZWYyMGNjYWJiZTRlM2MxODhmMmIxM2NlYyIKK1NSQ1JF
ViA9ICI3MjIzZGMzZDVlMzRiYmNjNDRmMzE1MDU0NmRiZmE4YTVkYTU4YzRjIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmct
ZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItbGli
c2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0g
CjIuNDQuMQoK

--===============1200829730988374966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5038128 to 5038704 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 325552 to 325804 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2024.2 [default] to 2024.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3774478 to 3774926 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2024.2" to "2024.3"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2024.2 [default] to 2024.3 [default]

--===============1200829730988374966==--

