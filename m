Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CF1D5E391
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17405.1765872153735338759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jTDzo/sY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J3PZp0p4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b262ece1d-2e0dcc62-750e-4d76-85fd-24cc236ab03e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YJXXk1KsOSka5faz5pKB+W3CJexJh29wWnCH5NAKe6Y=;
	b=jTDzo/sYD8mT4JndEtonoSCko1iuliGZA7iB/FXE5xb5hT/R5rlJvu72bFEe7xUC
	6Q+s0vJ8HreEk/Op6si7v1xAT0BZhqblxDjUy97HFLmbewzxl8b7aTky3EjRR4w9/Cm
	oXnk5iiUhv3Nzv6TlO+2dKTCAm2BoZwLcq+DruYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YJXXk1KsOSka5faz5pKB+W3CJexJh29wWnCH5NAKe6Y=;
	b=J3PZp0p4ILJshEqk98UeyNdeNk2ZjxDiJPalpJbtN9flXsgv5ZhPztuDFgmg6UgP
	3L8AQReg4tst4zTboCRVOzdPkvDgCqgPQUi1UtPsqNyryHOewGnGbl8ATY68i8pyl7F
	JxI/EAPdeHf3KwocC7JgIk0tSRj3CLr+z30lgDAU=
Content-Type: multipart/mixed; boundary="===============2006554524146176235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-loader: upgrading to 1.4.335.0 FAILED
Message-ID: <0101019b262ece1d-2e0dcc62-750e-4d76-85fd-24cc236ab03e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227872

--===============2006554524146176235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.335.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.4.328.1-1.4.335.0.patch
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
From 1d07afaa807b1356bf4d7b1dd19f3ad038afeaf2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:54:32 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.4.328.1 -> 1.4.335.0

---
 ...{vulkan-loader_1.4.328.1.bb => vulkan-loader_1.4.335.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.328.1.bb => vulkan-loader_1.4.335.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
index d80e84a34e..8799221313 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "0a278cc725089cb67bf6027076e5d72f97c04d86"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.335;protocol=https"
+SRCREV = "057ca1e5f2b61bbb3942e3a7464d488d5bde4a3c"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============2006554524146176235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a59ba7fa9c27ea8ae7309e958489fc43419ad436"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a59ba7fa9c27ea8ae7309e958489fc43419ad436"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 223 Local 206 Mirrors 0 Missed 17 Current 697 (92% match, 98% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 728 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 863 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 865 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 867 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 872 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 879 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 912 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 917 of 920 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1771 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 2547 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_unpack)
NOTE: Running task 2548 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: Running task 2549 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_patch)
NOTE: Running task 2550 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Running task 2552 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2554 of 2580 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/au
 h/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Found Git: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/git (found version "2.47.1")
| -- Looking for secure_getenv
| -- Looking for secure_getenv - found
| -- Looking for __secure_getenv
| -- Looking for __secure_getenv - not found
| -- Looking for realpath
| -- Looking for realpath - found
| -- Looking for alloca.h
| -- Looking for alloca.h - found
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| -- The ASM compiler identification is GNU
| -- Found assembler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc
| -- Looking for cet.h
| -- Looking for cet.h - found
| CMake Warning at loader/CMakeLists.txt:359 (message):
|   Could not find working x86_64 GAS assembler
| 
|   Support for unknown physical device and device functions is disabled due to
|   missing the required assembly support code.  To support unknown functions,
|   assembly must be added for the platform.
| 
| 
| 
| -- Found PkgConfig: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Configuring done (0.8s)
| CMake Error at loader/CMakeLists.txt:23 (target_link_libraries):
|   The link interface of target "loader_specific_options" contains:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Error at loader/CMakeLists.txt:512 (target_link_libraries):
|   Target "vulkan" links to:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| -- Generating done (0.0s)
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     CMAKE_EXPORT_NO_PACKAGE_REGISTRY
|     FETCHCONTENT_FULLY_DISCONNECTED
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
|     VulkanHeaders_INCLUDE_DIR
|     VulkanRegistry_DIR
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/run.do_configure.2613565:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/sources/vulkan-loader-1.4.335.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild
 /yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DASSEMBLER_WORKS=FALSE -DVulkanHeaders_INCLUDE_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/recipe-sysroot/usr/include -DVulkanRegistry_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/recipe-sysroot//usr/share -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/run.do_configure.2613565, line 162
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/run.do_configure.2613565, line 141
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/run.do_configure.2613565, line 180
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2554 tasks of which 2547 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216045419.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216045419.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/log.do_configure.2613565
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.335.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/run.do_configure.2613565' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.335.0/temp/log.do_configure.2613565
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_configure) failed with exit code '1'

--===============2006554524146176235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSAxZDA3YWZhYTgwN2IxMzU2YmY0ZDdiMWRkMTlmM2FkMDM4YWZlYWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6NTQ6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tbG9hZGVyOiB1cGdyYWRlIDEuNC4zMjguMSAtPiAxLjQuMzM1LjAKCi0tLQogLi4ue3Z1
bGthbi1sb2FkZXJfMS40LjMyOC4xLmJiID0+IHZ1bGthbi1sb2FkZXJfMS40LjMzNS4wLmJifSB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tbG9hZGVyXzEuNC4z
MjguMS5iYiA9PiB2dWxrYW4tbG9hZGVyXzEuNC4zMzUuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjMyOC4xLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tbG9hZGVyXzEuNC4zMzUuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjMyOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjMzNS4wLmJiCmluZGV4IGQ4MGU4NGEz
NGUuLjg3OTkyMjEzMTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLWxvYWRlcl8xLjQuMzI4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tbG9hZGVyXzEuNC4zMzUuMC5iYgpAQCAtOSw4ICs5LDggQEAgU0VDVElPTiA9
ICJsaWJzIgogCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9N2RiZWZlZDIzMjQyNzYwYWEzNDc1ZWU0MjgwMWM1YWMiCi1T
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Mb2FkZXIuZ2l0
O2JyYW5jaD12dWxrYW4tc2RrLTEuNC4zMjg7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiMGEy
NzhjYzcyNTA4OWNiNjdiZjYwMjcwNzZlNWQ3MmY5N2MwNGQ4NiIKK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUxvYWRlci5naXQ7YnJhbmNoPXZ1bGthbi1z
ZGstMS40LjMzNTtwcm90b2NvbD1odHRwcyIKK1NSQ1JFViA9ICIwNTdjYTFlNWYyYjYxYmJiMzk0
MmUzYTc0NjRkNDg4ZDViZGU0YTNjIgogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAidnVs
a2FuIgogCi0tIAoyLjQ3LjEKCg==

--===============2006554524146176235==--

