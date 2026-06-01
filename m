Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C61CD6E73
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1577.1780328141299016481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jqq7+Lfl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eTTo3UVB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3bb0b-2ed894fc-79b1-4a7a-8adb-dc99aea7fe49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OqLRlTm/s4MEzO5CelrGMT13PkmxRIf6ZgPBYFqtGRs=;
	b=jqq7+LflRWBlFHr69MWvuwWJOmCUFXeBqq00am2JRwWzgdXVa7dC9W2JtAXahA8m
	dzp/eFipnFb1KRCf2Ivf9Ja1w4EqqGWb744Z293I9QV8LEm9/JzEF8D98SeTmrkuvx/
	YaODgl/oGvr+RurZYVkLupVNpxlpKTqgAvc8E/qU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OqLRlTm/s4MEzO5CelrGMT13PkmxRIf6ZgPBYFqtGRs=;
	b=eTTo3UVBRdMXe7siBHIV23por1iMktigCSu1VSfSMY8gevwfIKAi1QO5tAXzUhuf
	FQOrrH3scL/KRylrhXk/jbf6XwxWH2QNxuFcs5AgHwAH4DAFzw5rklEsSDhszTYkaJU
	LnwV610PYyn/PMAFooSHPCsykQ7LwABhKmBlasCk=
Content-Type: multipart/mixed; boundary="===============3952259282815811537=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019e83d3bb0b-2ed894fc-79b1-4a7a-8adb-dc99aea7fe49-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237933

--===============3952259282815811537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.4.350.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.4.341.0-1.4.350.0.patch
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
From c028c0960dce364f84cb11cbebeb0733e41948f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:13:04 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.4.341.0 -> 1.4.350.0

---
 ...ers_1.4.341.0.bb => vulkan-validation-layers_1.4.350.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.341.0.bb => vulkan-validation-layers_1.4.350.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
index 0b9bead366..f518278c67 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "14de3c0d7b396853d81e6975aad3713984a697a6"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "b9d4f9ead8d97c1bb0d174ea07d8aed8273818a5"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============3952259282815811537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-76e0ccf26202cea81d3013f53fa127025b51efe7"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:76e0ccf26202cea81d3013f53fa127025b51efe7"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 125 Local 115 Mirrors 0 Missed 10 Current 490 (92% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 536 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 612 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1460 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 615 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1474 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_unpack)
NOTE: Running task 1476 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_patch)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1481 of 1493 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/au
 h/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/open
 embedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'glslang', 'spirv-headers', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'vulkan-utility-libraries', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 16.1.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Warning at scripts/CMakeLists.txt:36 (message):
|   CMAKE_BUILD_TYPE not set.  Using Debug for dependency build type
| 
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Cloning into '.'...
| fatal: unable to access 'https://github.com/KhronosGroup/Vulkan-Headers.git/': Could not resolve host: github.com
| 
| Starting builds in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64
| Error cloning on iteration 1/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 2/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 3/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 4/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 5/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 6/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 7/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 8/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 9/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Waiting 60 seconds before trying again
| Removing old tree /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Error cloning on iteration 10/10: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| Failed to clone https://github.com/KhronosGroup/Vulkan-Headers.git on all retries.
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 983, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 969, in main
|     repo.Checkout()
|     ~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 490, in Checkout
|     self.Clone()
|     ~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 455, in Clone
|     raise e
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 439, in Clone
|     command_output(['git', 'clone', self.url, '.'], self.repo_dir)
|     ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/scripts/update_deps.py", line 329, in command_output
|     raise RuntimeError(f'Failed to run {cmd} in {directory}')
| RuntimeError: Failed to run ['git', 'clone', 'https://github.com/KhronosGroup/Vulkan-Headers.git', '.'] in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0/external/Linux/Debug/x86_64/Vulkan-Headers
| CMake Error at scripts/CMakeLists.txt:133 (message):
|   Could not run update_deps.py which is necessary to download dependencies.
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/run.do_configure.3515504:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/sources/vulkan-validation-layers-1.4.350.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPytho
 n3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DUSE_ROBIN_HOOD_HASHING=OFF -DGLSLANG_INSTALL_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/recipe-sysroot/usr/lib -DVULKAN_HEADERS_INSTALL_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/recipe-sysroot/usr -DSPIRV_HEADERS_INSTALL_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/recipe-sysroot/usr -DBUILD_WSI_WAYLAND_S
 UPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/run.do_configure.3515504, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/run.do_configure.3515504, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/run.do_configure.3515504, line 179
NOTE: recipe vulkan-validation-layers-1.4.350.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1481 tasks of which 1474 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601120350.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601120350.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/log.do_configure.3515504
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-validation-layers-1.4.350.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/run.do_configure.3515504' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-validation-layers/1.4.350.0/temp/log.do_configure.3515504
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb:do_configure) failed with exit code '1'

--===============3952259282815811537==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBjMDI4YzA5NjBkY2UzNjRmODRjYjExY2JlYmViMDczM2U0MTk0OGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjoxMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12YWxpZGF0aW9uLWxheWVyczogdXBncmFkZSAxLjQuMzQxLjAgLT4gMS40LjM1MC4wCgot
LS0KIC4uLmVyc18xLjQuMzQxLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4z
NTAuMC5iYn0gfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZh
bGlkYXRpb24tbGF5ZXJzXzEuNC4zNDEuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNf
MS40LjM1MC4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNDEuMC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNTAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzQxLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNTAu
MC5iYgppbmRleCAwYjliZWFkMzY2Li5mNTE4Mjc4YzY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzQxLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXll
cnNfMS40LjM1MC4wLmJiCkBAIC04LDggKzgsOCBAQCBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNF
ID0gIkFwYWNoZS0yLjAgJiBNSVQgJiBCU0wtMS4wICIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT1iMWExN2Q1NDhlMDA0YmZiYmZhYTBjNDA5ODhiNmIzMSIKIAot
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVmFsaWRhdGlv
bkxheWVycy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQ
Vn0iCi1TUkNSRVYgPSAiMTRkZTNjMGQ3YjM5Njg1M2Q4MWU2OTc1YWFkMzcxMzk4NGE2OTdhNiIK
K1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRp
b25MYXllcnMuZ2l0O2JyYW5jaD12dWxrYW4tc2RrLTEuNC4zNTA7cHJvdG9jb2w9aHR0cHM7dGFn
PXZ1bGthbi1zZGstJHtQVn0iCitTUkNSRVYgPSAiYjlkNGY5ZWFkOGQ5N2MxYmIwZDE3NGVhMDdk
OGFlZDgyNzM4MThhNSIKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gInZ1bGthbiIKIAot
LSAKMi40Ny4xCgo=

--===============3952259282815811537==--

