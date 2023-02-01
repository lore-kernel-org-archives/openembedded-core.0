Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59939C742A7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30359.1675272856635694310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=etimdWrc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b26c8-f457ee02-87d0-4b66-b073-50118099c91c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=voC7IRl0m+rucm16wGMurtu+lDpF8hbHEZSJ4RvXhGs=;
	b=etimdWrcj+pdvONC/N2KmmvxzxLY4BeoXg8SI0yIyExdV01t+CiaykQuen2RAHTG
	8+c+zbzMNl7s7pvJdl+kwOiieOgEjgrUDWbW/A00OWH50VWAsOiE9qVYQRCKspEM+ts
	8v3+cO2KkJXJKUSGZWd6kzDglMekNtVqkSym09gQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=voC7IRl0m+rucm16wGMurtu+lDpF8hbHEZSJ4RvXhGs=;
	b=g0bhiyy3WXwuftDe23d+oZmaK73D2Lq2Y0Wlo7xHG+er7XQwJddnEffbThQhHEK8
	c6sqTLeCS18JtkeHXjAhlL6Yh5qbAdQO+OJ1zJIuphK7hry+ezf7npDwjHN3uWRNiNS
	bXngHmUqoOvOkJ1PiJ9tTBwW6RUOxhlGPgyo+GOA=
Content-Type: multipart/mixed; boundary="===============1752702532166290328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.239.0 FAILED
Message-ID: <010101860e0b26c8-f457ee02-87d0-4b66-b073-50118099c91c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176625

--===============1752702532166290328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.239.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.236.0-1.3.239.0.patch
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
--===============1752702532166290328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c3b6fa129c192d4b2423f4104dd9e8d6f131730a"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 84 Mirrors 0 Missed 7 Current 235 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1146 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running task 1201 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_unpack)
NOTE: Running task 1202 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1204 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1205 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1206 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1207 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sy
 sroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'vulkan-headers', 'vulkan-loader', 'wayland', 'libx11', 'libxcb', 'libxrandr', 'ninja-native', 'patch-native', 'pseudo-native', 'libpthread-stubs', 'xorgproto', 'libxdmcp', 'libxau', 'xcb-proto', 'linux-libc-headers', 'zlib-native', 'flex-native', 'mpfr-native', 'binutils-cross-i686', 'libmpc-native', 'xz-native', 'gnu-config-native', 'libtool-native', 'gmp-native', 'zstd-native', 'texinfo-dummy-native', 'libgcc', 'libffi', 'expat', 'libxml2', 'util-macros', 'libxext', 'libxrender', 'openssl-native', 'bzip2-native', 'ncurses-native', 're2c-native', 'xtrans', 'autoconf-archive', 'attr-native', 'gettext-minimal-native', 'm4-native', 'python3', 'zlib', 'perl-native', 'bzip2', 'ncurses', 'util-linux-libuuid', 'readline', 'libtirpc', 'xz', 'opkg-utils', 'libnsl2', 'libxcrypt', 'sqlite3', 'gdbm', 'openssl', 'make-native', 'gdbm-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 12.2.0
| -- The CXX compiler identification is GNU 12.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Using find_package to locate Vulkan
| -- Found Vulkan: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot/usr/lib/libvulkan.so
| -- Vulkan FOUND = TRUE
| -- Vulkan Lib Dir = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot/usr/lib
| -- Vulkan Lib = /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot/usr/lib/libvulkan.so
| CMake Error at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot-native/usr/share/cmake-3.25/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
|   Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| Call Stack (most recent call first):
|   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot-native/usr/share/cmake-3.25/Modules/FindPackageHandleStandardArgs.cmake:600 (_FPHSA_FAILURE_MESSAGE)
|   /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/recipe-sysroot-native/usr/share/cmake-3.25/Modules/FindPkgConfig.cmake:99 (find_package_handle_standard_args)
|   vulkaninfo/CMakeLists.txt:70 (find_package)
| 
| 
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/run.do_configure.162144:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-wor
 ker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/run.do_configure.162144, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/run.do_configure.162144, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/run.do_configure.162144, line 198
NOTE: recipe vulkan-tools-1.3.239.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1207 tasks of which 1199 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.239.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/run.do_configure.162144', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.239.0-r0/temp/log.do_configure.162144
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb:do_configure) failed with exit code '1'

--===============1752702532166290328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.236.0-1.3.239.0.patch"

RnJvbSBkYzI2OTk4ZTU3NjlkODU2YjgzZTAxOGJhZWI2YzFhMjA2OWI1MzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTo1MDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjM2LjAgLT4gMS4zLjIzOS4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yMzYuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjIzOS4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yMzYu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjIzOS4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzYuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjM2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzkuMC5iYgppbmRleCBhMzU2MWJiYjVjLi5mZTU3
ZTBhM2MxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjM2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjIzOS4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImNlNDUzMzdjNTFlZDUzZTZmMWIzMzdhYTc0
NmE1YTk2YzUwMThmODYiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3Vw
L1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXNkay0xLjMuMjM5O3Byb3RvY29sPWh0dHBzIgorU1JD
UkVWID0gIjg0YzYxYzQ2M2FlY2RkYTM4NWRlMzNiMDE0OWM3MzY4MTE5YzIzZjYiCiAKIFMgPSAi
JHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzcuMwoK

--===============1752702532166290328==--

