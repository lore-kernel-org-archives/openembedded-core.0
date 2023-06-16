Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190EEC04A94
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.809.1686887483191781218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XrRiE3sL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2544b6a-8d42a970-5c29-4084-840d-c9f2a6ee1ae6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NORnagtaK99Y4+M39WGcybn1ycMwPUv24g/a9hpksYQ=;
	b=XrRiE3sLgXxAVN6+yE9CVrB0LACGU/rwqrXI8bdLXdhvb7f9h6vWqXa4hazZwAk+
	+pl36VULjmHG98LLa9CuJVFRoszKy/3b0whaOUusX1WDPbdnwPjlQjm/IHtPsm7DiTv
	Dp2QBZkc7Pc5pTps7G3XxynBKg7o/es7+HO2vEvA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NORnagtaK99Y4+M39WGcybn1ycMwPUv24g/a9hpksYQ=;
	b=EbHM/InRn/DqzLjQhBWEFA7qBLJcX6fAa5+fD1s76Jyj/3GuKlzQfVAcaNtri3J6
	5v3ft9I+Z/DmdxjYNNM4Y10WCTiW9DaKMq9K7EwMg6xk29vPz7q5owJZAQ4shCnnVH8
	n1Fn7yaKjndlMFKpCUbYS04gaduY1q/IKGvDZMjQ=
Content-Type: multipart/mixed; boundary="===============4016895330201519394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.4 SUCCEEDED
Message-ID: <01010188c2544b6a-8d42a970-5c29-4084-840d-c9f2a6ee1ae6-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182966

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.2-2023.4.patch
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
From 2d0194b570c46afa28f6ca90f462aabbb7a70d26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 20:51:59 +0000
Subject: [PATCH] shaderc: upgrade 2023.2 -> 2023.4

---
 ...isable-building-external-dependencies.patch | 18 ++++++++----------
 .../{shaderc_2023.2.bb => shaderc_2023.4.bb}   |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.2.bb => shaderc_2023.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index cc9a400028..a6bf1bdd65 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,7 +1,7 @@
-From 071a9d71bea91bbefcf15e061fc87e53568f3188 Mon Sep 17 00:00:00 2001
+From 08eaf5b5b3834bb84206f506413bd67bfcc0158c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH 1/3] cmake: disable building external dependencies
+Subject: [PATCH] cmake: disable building external dependencies
 
 - add cmake option to disable the build of the third_party dependencies
 - change the update_build_version.py to use pkg-config when third_party dependencies not found
@@ -9,24 +9,25 @@ Subject: [PATCH 1/3] cmake: disable building external dependencies
 Upstream-Status: Inappropriate [OE-core specific]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  CMakeLists.txt                | 13 ++++++++++---
  utils/update_build_version.py | 22 +++++++++++++++-------
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5c74cd8..b358f6b 100644
+index 633c244..75b01da 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -41,6 +41,7 @@ else()
+@@ -67,6 +67,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
 +option(BUILD_EXTERNAL "Build external dependencies in /third_party" ON)
  
- set (CMAKE_CXX_STANDARD 11)
+ set (CMAKE_CXX_STANDARD 17)
  
-@@ -101,8 +102,14 @@ endif(MSVC)
+@@ -129,8 +130,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +44,7 @@ index 5c74cd8..b358f6b 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -112,7 +119,7 @@ add_subdirectory(examples)
+@@ -142,7 +149,7 @@ endif()
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
@@ -104,6 +105,3 @@ index 5785390..f72b762 100755
      mkdir_p(os.path.dirname(output_file))
  
      if os.path.isfile(output_file):
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.2.bb b/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.4.bb
index 07fae0bb7e..739e7ae81c 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "55f4bbd993de3a3cad34cb41cd07b82fa1c77dd6"
+SRCREV = "7a8b3da0583425cf511336cf3afbdcf2ebc8b36b"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.39.2


--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13cea3fc9c633b0f38550ce97bda0545aeea175a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 12 Mirrors 0 Missed 24 Current 196 (33% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 689 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 722 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 723 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 730 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 782 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 783 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 784 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 785 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 786 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: Running task 788 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 791 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: Running task 794 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 796 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 797 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 798 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 799 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 800 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 801 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to b1454c899fea3a5be0b701d7d169b0458b747d3be359dbc370c91fb01a6301b1
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 804 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 805 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 806 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 807 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 808 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 809 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 810 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 811 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 812 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 813 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 814 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 815 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 816 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 817 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 818 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 818 tasks of which 776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.1748112
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6617920 to 6632156 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 62114 to 63477 (+2%)
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 319425 to 323859 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2466106 to 2474228 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PKGSIZE changed from 298420 to 302516 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2023.2 [default] to 2023.4 [default]

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13cea3fc9c633b0f38550ce97bda0545aeea175a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 13 Mirrors 0 Missed 24 Current 195 (35% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 689 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 722 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 723 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 730 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 782 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 783 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 784 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 785 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: Running task 786 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 787 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: Running task 788 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 791 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 792 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: Running task 794 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 796 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 797 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 798 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 799 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 800 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 801 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to b1454c899fea3a5be0b701d7d169b0458b747d3be359dbc370c91fb01a6301b1
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 804 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 805 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 806 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 807 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 808 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 809 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 810 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 811 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 812 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 813 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 814 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 815 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 816 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 817 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 818 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 819 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: Running task 820 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 821 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 821 tasks of which 776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.1753948
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13cea3fc9c633b0f38550ce97bda0545aeea175a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 13 Mirrors 0 Missed 24 Current 195 (35% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 689 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 722 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 723 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 730 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 782 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 783 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 784 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 785 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: Running task 786 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: Running task 788 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 791 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: Running task 794 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 796 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 797 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 798 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 799 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 800 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 801 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to b1454c899fea3a5be0b701d7d169b0458b747d3be359dbc370c91fb01a6301b1
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 804 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 805 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 806 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 807 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 808 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 809 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 810 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 811 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 812 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 813 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 814 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 815 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 816 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 817 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 818 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 819 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: Running task 820 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 821 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 822 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_configure)
NOTE: recipe shaderc-2023.4-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 823 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.4-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 823 tasks of which 776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.1768272
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13cea3fc9c633b0f38550ce97bda0545aeea175a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 13 Mirrors 0 Missed 24 Current 195 (35% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 689 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 722 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 723 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 730 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 782 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 783 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 784 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 785 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 786 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: Running task 788 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 790 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 791 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: Running task 794 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 795 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 796 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 797 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 798 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 799 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 800 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: Running task 801 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 802 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to b1454c899fea3a5be0b701d7d169b0458b747d3be359dbc370c91fb01a6301b1
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 803 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 804 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 805 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 806 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 807 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 808 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 809 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 810 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 811 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 812 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 813 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 814 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 815 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 816 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: Running task 817 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 818 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 819 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 820 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 821 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 822 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_configure)
NOTE: recipe shaderc-2023.4-r0: task do_configure: Started
NOTE: recipe shaderc-2023.4-r0: task do_configure: Succeeded
NOTE: Running task 823 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_compile)
NOTE: recipe shaderc-2023.4-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 824 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 824 tasks of which 776 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.1762099
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============4016895330201519394==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.2-2023.4.patch"

RnJvbSAyZDAxOTRiNTcwYzQ2YWZhMjhmNmNhOTBmNDYyYWFiYmI3YTcwZDI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjA6NTE6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjMuMiAtPiAyMDIzLjQKCi0tLQogLi4uaXNhYmxlLWJ1aWxkaW5n
LWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQogLi4u
L3tzaGFkZXJjXzIwMjMuMi5iYiA9PiBzaGFkZXJjXzIwMjMuNC5iYn0gICB8ICAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNfMjAyMy4yLmJiID0+IHNoYWRlcmNf
MjAyMy40LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNp
ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtl
LWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCmluZGV4IGNjOWE0
MDAwMjguLmE2YmYxYmRkNjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNp
ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1j
bWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gMDcxYTlkNzFiZWE5MWJiZWZjZjE1ZTA2MWZjODdlNTM1NjhmMzE4OCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDhlYWY1YjViMzgzNGJiODQyMDZmNTA2NDEz
YmQ2N2JmY2MwMTU4YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVz
bWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0
NTo1NiArMDAwMAotU3ViamVjdDogW1BBVENIIDEvM10gY21ha2U6IGRpc2FibGUgYnVpbGRpbmcg
ZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCitTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiBkaXNhYmxlIGJ1
aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwogCiAtIGFkZCBjbWFrZSBvcHRpb24gdG8gZGlz
YWJsZSB0aGUgYnVpbGQgb2YgdGhlIHRoaXJkX3BhcnR5IGRlcGVuZGVuY2llcwogLSBjaGFuZ2Ug
dGhlIHVwZGF0ZV9idWlsZF92ZXJzaW9uLnB5IHRvIHVzZSBwa2ctY29uZmlnIHdoZW4gdGhpcmRf
cGFydHkgZGVwZW5kZW5jaWVzIG5vdCBmb3VuZApAQCAtOSwyNCArOSwyNSBAQCBTdWJqZWN0OiBb
UEFUQ0ggMS8zXSBjbWFrZTogZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMK
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0UtY29yZSBzcGVjaWZpY10KIAogU2ln
bmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CisKIC0t
LQogIENNYWtlTGlzdHMudHh0ICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKy0tLQogIHV0
aWxzL3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5IHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQog
IDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA1Yzc0Y2Q4
Li5iMzU4ZjZiIDEwMDY0NAoraW5kZXggNjMzYzI0NC4uNzViMDFkYSAxMDA2NDQKIC0tLSBhL0NN
YWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTQxLDYgKzQxLDcgQEAgZWxz
ZSgpCitAQCAtNjcsNiArNjcsNyBAQCBlbHNlKCkKICBlbmRpZigpCiAgCiAgb3B0aW9uKFNIQURF
UkNfRU5BQkxFX1dFUlJPUl9DT01QSUxFICJFbmFibGUgcGFzc2luZyAtV2Vycm9yIHRvIGNvbXBp
bGVyLCBpZiBhdmFpbGFibGUiIE9OKQogK29wdGlvbihCVUlMRF9FWFRFUk5BTCAiQnVpbGQgZXh0
ZXJuYWwgZGVwZW5kZW5jaWVzIGluIC90aGlyZF9wYXJ0eSIgT04pCiAgCi0gc2V0IChDTUFLRV9D
WFhfU1RBTkRBUkQgMTEpCisgc2V0IChDTUFLRV9DWFhfU1RBTkRBUkQgMTcpCiAgCi1AQCAtMTAx
LDggKzEwMiwxNCBAQCBlbmRpZihNU1ZDKQorQEAgLTEyOSw4ICsxMzAsMTQgQEAgZW5kaWYoTVNW
QykKICAKICAKICAjIENvbmZpZ3VyZSBzdWJkaXJlY3Rvcmllcy4KQEAgLTQzLDcgKzQ0LDcgQEAg
aW5kZXggNWM3NGNkOC4uYjM1OGY2YiAxMDA2NDQKICAKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNo
YWRlcmNfdXRpbCkKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRlcmMpCi1AQCAtMTEyLDcgKzEx
OSw3IEBAIGFkZF9zdWJkaXJlY3RvcnkoZXhhbXBsZXMpCitAQCAtMTQyLDcgKzE0OSw3IEBAIGVu
ZGlmKCkKICBhZGRfY3VzdG9tX3RhcmdldChidWlsZC12ZXJzaW9uCiAgICAke1BZVEhPTl9FWEVD
VVRBQkxFfQogICAgJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9L3V0aWxzL3VwZGF0ZV9idWls
ZF92ZXJzaW9uLnB5CkBAIC0xMDQsNiArMTA1LDMgQEAgaW5kZXggNTc4NTM5MC4uZjcyYjc2MiAx
MDA3NTUKICAgICAgbWtkaXJfcChvcy5wYXRoLmRpcm5hbWUob3V0cHV0X2ZpbGUpKQogIAogICAg
ICBpZiBvcy5wYXRoLmlzZmlsZShvdXRwdXRfZmlsZSk6Ci0tLSAKLTIuMzAuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjMuMi5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy40LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjMuNC5iYgppbmRleCAwN2ZhZTBiYjdlLi43MzllN2FlODFjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjMuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjMuNC5iYgpAQCAtNiw3ICs2LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjIgogTElDRU5T
RSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ1JFViA9ICI1NWY0YmJkOTkz
ZGUzYTNjYWQzNGNiNDFjZDA3YjgyZmExYzc3ZGQ2IgorU1JDUkVWID0gIjdhOGIzZGEwNTgzNDI1
Y2Y1MTEzMzZjZjNhZmJkY2YyZWJjOGIzNmIiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNp
ZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWds
c2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggXAotLSAKMi4zOS4yCgo=

--===============4016895330201519394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-32 sysroot...done.
Removing 8 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13cea3fc9c633b0f38550ce97bda0545aeea175a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 46 Mirrors 0 Missed 24 Current 167 (65% match, 89% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 191 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 558 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 573 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 574 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 575 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 608 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 609 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 610 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 611 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 199 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 205 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 686 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 214 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 687 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 215 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 689 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 690 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 691 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 692 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 693 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 218 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 694 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 695 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 696 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 221 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 702 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 703 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to b1454c899fea3a5be0b701d7d169b0458b747d3be359dbc370c91fb01a6301b1
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 231 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 234 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 235 of 237 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 800 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 807 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 812 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: Running task 813 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 814 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 815 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 816 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 817 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 818 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 819 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 820 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 821 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 822 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 823 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 824 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 825 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 826 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 827 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 828 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 829 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 830 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 831 of 849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 831 tasks of which 788 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.1779739
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============4016895330201519394==--

