Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5F2C0015E
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.818.1686887485042687300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aITa7BrW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2544c09-dc4cc0b8-0a61-4be1-8d9e-0681d2efc7c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1L0Lwak8s1j8V77+jEYHnMKn6JyW2N3kunzQPVSOxpQ=;
	b=aITa7BrWqwF40NdSU2TxdUc/l5vswqNmdW/5ZiAK7gco+Zxr4oXDELU7Xa6p3ghQ
	XEeOjIOk0DGuWYDXkg7882D8prAS8X08HAeAPWc58tzMktNiJg9DUwyGg5X2OrtsclS
	cK3dL4xosPCKuvZNRcO8FrxbpduqLOrPC7kx46ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1L0Lwak8s1j8V77+jEYHnMKn6JyW2N3kunzQPVSOxpQ=;
	b=kJ1vVEkXCRwRnR5fo6/3+fG6cRpRqmAKDccLtfK/LrVbAhrCUjOGxLDWw+AWtp7Y
	ok9ex4TfT8GRRhHJnbTTRJREK4Zk/vvB8OjIKv+JsvHEVqHBqM4xJ1EZAKEuYQiOxJl
	GcmaKwSssN5+53cjZB2lRopducdxZr2Vh1iKMk8I=
Content-Type: multipart/mixed; boundary="===============8854934717257491001=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.250.0 FAILED
Message-ID: <01010188c2544c09-dc4cc0b8-0a61-4be1-8d9e-0681d2efc7c9-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182972

--===============8854934717257491001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.250.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.243.0-1.3.250.0.patch
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
From 0a71c826a35f368c821f50fadfa31b114ce27400 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 21:09:48 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.243.0 -> 1.3.250.0

---
 .../{vulkan-tools_1.3.243.0.bb => vulkan-tools_1.3.250.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.243.0.bb => vulkan-tools_1.3.250.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
index dfdd716abd..b8f13bda33 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.243;protocol=https"
-SRCREV = "18bdf5565f5d02831869785cbf758fa7b295b7d5"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "695887a994ef9cc00a7aa3f9c00b31a56ea79534"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8854934717257491001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:612c76e3707abcd470fc607ffc5f687b93f941f3"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 128 Local 119 Mirrors 0 Missed 9 Current 300 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1317 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1408 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1409 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1410 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1411 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1412 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1413 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1414 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1415 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sy
 sroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'vulkan-headers', 'vulkan-loader', 'wayland', 'libx11', 'libxcb', 'libxrandr', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'libffi', 'libxml2', 'expat', 'libxau', 'libxdmcp', 'xorgproto', 'xcb-proto', 'libpthread-stubs', 're2c-native', 'linux-libc-headers', 'libtool-native', 'attr-native', 'util-macros', 'xtrans', 'xz-native', 'binutils-cross-i686', 'flex-native', 'zlib-native', 'gnu-config-native', 'mpfr-native', 'gmp-native', 'zstd-native', 'libmpc-native', 'texinfo-dummy-native', 'bzip2-native', 'openssl-native', 'ncurses-native', 'libgcc', 'libxrender', 'libxext', 'zlib', 'python3', 'gettext-minimal-native', 'm4-native', 'perl-native', 'ncurses', 'libtirpc', 'util-linux-libuuid', 'sqlite3', 'openssl', 'libedit', 'libnsl2', 'libxcrypt', 'gdbm', 'xz', 'opkg-utils', 'bzip2', 'gdbm-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.1.1
| -- The CXX compiler identification is GNU 13.1.1
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Using find_package to locate Vulkan
| -- Found Vulkan: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot/usr/lib/libvulkan.so
| -- Vulkan FOUND = TRUE
| -- Vulkan Lib Dir = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot/usr/lib
| -- Vulkan Lib = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot/usr/lib/libvulkan.so
| CMake Error at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot-native/usr/share/cmake-3.26/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
|   Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| Call Stack (most recent call first):
|   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot-native/usr/share/cmake-3.26/Modules/FindPackageHandleStandardArgs.cmake:600 (_FPHSA_FAILURE_MESSAGE)
|   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/recipe-sysroot-native/usr/share/cmake-3.26/Modules/FindPkgConfig.cmake:99 (find_package_handle_standard_args)
|   vulkaninfo/CMakeLists.txt:70 (find_package)
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.2020089:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-wo
 rker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.2020089, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.2020089, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.2020089, line 198
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1415 tasks of which 1406 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.250.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.2020089', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/log.do_configure.2020089
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure) failed with exit code '1'

--===============8854934717257491001==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSAwYTcxYzgyNmEzNWYzNjhjODIxZjUwZmFkZmEzMWIxMTRjZTI3NDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjE6MDk6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI0My4wIC0+IDEuMy4yNTAuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjQzLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjQz
LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjQzLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjUwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI0My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjUwLjAuYmIKaW5kZXggZGZkZDcxNmFiZC4uYjhm
MTNiZGEzMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjI0My4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuMy4yNTAuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXNk
ay0xLjMuMjQzO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjE4YmRmNTU2NWY1ZDAyODMxODY5
Nzg1Y2JmNzU4ZmE3YjI5NWI3ZDUiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25v
c0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCitTUkNS
RVYgPSAiNjk1ODg3YTk5NGVmOWNjMDBhN2FhM2Y5YzAwYjMxYTU2ZWE3OTUzNCIKIAogUyA9ICIk
e1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============8854934717257491001==--

