Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99732C10F1E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:34 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.144515.1671136353610903836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fA+Ql7E+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185177d1ae1-8e48579d-2642-4d05-8cf1-fb3b83fa7aa4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oLLHwIo9NbSdj6mMcnkIHzy1EHA46+UxjSszPz4PwjQ=;
	b=fA+Ql7E+Is2B4X8SEaL8qYt1PxJHtx360ptnK7yJXmerOIXF8OYuHpCA1nTGoGxq
	Wt4MiSsozUeK7DfH4j0YrsMCXwvXasQTw7IA+ZgkM3HvbKMSZhTdheBbhFB84eOvJQx
	YmzPDejvTkyksAEV1v3IKbnazDlOMoE0v5TzFA2c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oLLHwIo9NbSdj6mMcnkIHzy1EHA46+UxjSszPz4PwjQ=;
	b=YyAmhzHVpXYIYPz96Drb7XyRVTqOVO1kexztiga0UAQ35zsEOaiMw8HZee307r//
	9hXwnU0fx9ZtGFTWpBgyqcry8uY/c1+t+SDziVIG5r0SgnsqT2htjjVIGPmTkXrlgyf
	wfeb3Pneql+2g8tXidMKxLY7lJQ17JIFzqDqhIF8=
Content-Type: multipart/mixed; boundary="===============6332741401768576370=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.236.0 FAILED
Message-ID: <01010185177d1ae1-8e48579d-2642-4d05-8cf1-fb3b83fa7aa4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174695

--===============6332741401768576370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.236.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.3.231.1-1.3.236.0.patch
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
--===============6332741401768576370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4e2709ade3ea9aa70ffebb563ac623e3f333dd77"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 131 Local 121 Mirrors 0 Missed 10 Current 237 (92% match, 97% complete)
Removing 2 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 368 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 870 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 891 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_fetch)
NOTE: Running task 941 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_write_config)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-native-1_1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 951 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_unpack)
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-native-1_1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 988 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 989 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 990 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1291 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1334 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1336 of 1351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot', '
 /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'vulkan-headers', 'wayland', 'libx11', 'libxcb', 'libxrandr', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'expat', 'libxml2', 'libffi', 'zstd-native', 'xz-native', 'zlib-native', 'ncurses-native', 'curl-native', 'bzip2-native', 'libmpc-native', 'binutils-cross-i686', 'gmp-native', 'flex-native', 'linux-libc-headers', 'libtool-native', 'texinfo-dummy-native', 'gnu-config-native', 'mpfr-native', 'attr-native', 're2c-native', 'libgcc', 'util-macros', 'autoconf-archive', 'xorgproto', 'xtrans', 'libxext', 'libxrender', 'libxdmcp', 'xcb-proto', 'libpthread-stubs', 'libxau', 'zlib', 'python3', 'gettext-minimal-native', 'openssl-native', 'm4-native', 'openssl', 'xz', 'readline', 'sqlite3', 'opkg-utils', 'bzip2', 'libtirpc', 'gdbm', 'util-linux-libuuid', 'libnsl2', 'libxcrypt', 'ncurses', 'perl-native', 'make-native', 'gdbm-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 12.2.0
| -- The CXX compiler identification is GNU 12.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| ********************************************************************************
| * NOTE: Not adding target to run update_deps.py automatically.                 *
| ********************************************************************************
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| CMake Error at CMakeLists.txt:112 (find_package):
|   Could not find a package configuration file provided by "VulkanHeaders"
|   with any of the following names:
| 
|     VulkanHeadersConfig.cmake
|     vulkanheaders-config.cmake
| 
|   Add the installation prefix of "VulkanHeaders" to CMAKE_PREFIX_PATH or set
|   "VulkanHeaders_DIR" to a directory containing one of the above files.  If
|   "VulkanHeaders" provides a separate development package or SDK, be sure it
|   has been installed.
| 
| 
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/run.do_configure.1788168:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-
 worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DBUILD_TESTS=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/python3 -DASSEMBLER_WORKS=FALSE -DVulkanHeaders_INCLUDE_DIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/recipe-sysroot/usr/include -DVulkanRegistry_DIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/recipe-sysroot//usr/share -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/run.do_configure.1788168, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/run.do_configure.1788168, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/run.do_configure.1788168, line 198
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1336 tasks of which 1324 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.3.236.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/run.do_configure.1788168', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.3.236.0-r0/temp/log.do_configure.1788168
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_configure) failed with exit code '1'

--===============6332741401768576370==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.3.231.1-1.3.236.0.patch"

RnJvbSBhOTU0YTExZDBmMzVhZDM1NWQ1MmZkMTRhODQzYzU5Y2YwMTgzNDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTY6MTQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tbG9hZGVyOiB1cGdyYWRlIDEuMy4yMzEuMSAtPiAxLjMuMjM2LjAKCi0tLQogLi4ue3Z1
bGthbi1sb2FkZXJfMS4zLjIzMS4xLmJiID0+IHZ1bGthbi1sb2FkZXJfMS4zLjIzNi4wLmJifSB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tbG9hZGVyXzEuMy4y
MzEuMS5iYiA9PiB2dWxrYW4tbG9hZGVyXzEuMy4yMzYuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjIzMS4xLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tbG9hZGVyXzEuMy4yMzYuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjIzMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS4zLjIzNi4wLmJiCmluZGV4IDdhYWI3NDQ2
ZjYuLjU2ZjlkNzY1ZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLWxvYWRlcl8xLjMuMjMxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tbG9hZGVyXzEuMy4yMzYuMC5iYgpAQCAtOSw4ICs5LDggQEAgU0VDVElPTiA9
ICJsaWJzIgogCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9N2RiZWZlZDIzMjQyNzYwYWEzNDc1ZWU0MjgwMWM1YWMiCi1T
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Mb2FkZXIuZ2l0
O2JyYW5jaD1zZGstMS4zLjIzMTtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJlZWRiZjA4Mjky
YTZiZTE5YzM1MjdlNzdhZTJkZjNmMjA5Y2FiMjg1IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL0tocm9ub3NHcm91cC9WdWxrYW4tTG9hZGVyLmdpdDticmFuY2g9c2RrLTEuMy4yMzY7cHJv
dG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiMWVlODNhMjVjMmMyMGUyZWZiZmMwYWM5NzZjN2EzZGRi
NWZjMjkxYyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zNy4zCgo=

--===============6332741401768576370==--

