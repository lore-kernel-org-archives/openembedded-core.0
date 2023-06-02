Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3855DC88CB6
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7543.1685693435554778550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HSZeH6xu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b288c4c-03fee4fb-8f20-4f14-acbd-a41a8c671eb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wJHaDgh4Ez7L0J/k42b6Nm96oLrYpaMZ8S4FHQj3huI=;
	b=HSZeH6xukJMedMu0E7/6LfNqUB0XeLFTb5z9lPbBYDhn0E8jQQje6w7TuK1R6XkX
	BzRTvA95QibOOI1ECpCSU6yqqwAaYYtzgziaN2AfG/3Ttx/lJxwCNrYTNUdxjo0eGgF
	GcO7mW4CDurC0hZYGFxp4K5sKARMcltaFREYMnJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wJHaDgh4Ez7L0J/k42b6Nm96oLrYpaMZ8S4FHQj3huI=;
	b=g+EjXTp9LQ9NsyGlO98AVnfoOrxRH6SdtzxVjsM4Zpo3jSMykpLMdSQXvy5eAmnv
	04yL0EcdHWq49zWRdGNOTQZRGhMlk6433v5vrKJK/Rhlqxu7Q/jg/aK5vSdZ1KOledr
	s0juoaowODkOr5c1lj7wfKKiZS61jTeV/M0c+BpI=
Content-Type: multipart/mixed; boundary="===============7467027742022738609=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.250.0 FAILED
Message-ID: <010101887b288c4c-03fee4fb-8f20-4f14-acbd-a41a8c671eb6-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182243

--===============7467027742022738609==
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
--===============7467027742022738609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4555e8058cc7826baa7d2600be1adb89b2f698df"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 85 Mirrors 0 Missed 7 Current 234 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1153 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1208 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1209 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1211 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1213 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1214 of 1222 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sy
 sroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'vulkan-headers', 'vulkan-loader', 'wayland', 'libx11', 'libxcb', 'libxrandr', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'libffi', 'libxml2', 'expat', 'mpfr-native', 'xz-native', 'gnu-config-native', 'flex-native', 'libmpc-native', 'gmp-native', 'binutils-cross-i686', 'zlib-native', 'zstd-native', 'libtool-native', 'linux-libc-headers', 'texinfo-dummy-native', 'libgcc', 'util-macros', 'xorgproto', 'libxrender', 'libxext', 'xcb-proto', 'libxau', 'libpthread-stubs', 'libxdmcp', 're2c-native', 'xtrans', 'attr-native', 'ncurses-native', 'openssl-native', 'bzip2-native', 'zlib', 'python3', 'gettext-minimal-native', 'm4-native', 'perl-native', 'libtirpc', 'bzip2', 'openssl', 'xz', 'libnsl2', 'gdbm', 'ncurses', 'libedit', 'libxcrypt', 'opkg-utils', 'sqlite3', 'util-linux-libuuid', 'make-native', 'gdbm-native']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.3814794:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-wo
 rker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.3814794, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.3814794, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.3814794, line 198
NOTE: recipe vulkan-tools-1.3.250.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1214 tasks of which 1206 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.250.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/run.do_configure.3814794', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.250.0-r0/temp/log.do_configure.3814794
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb:do_configure) failed with exit code '1'

--===============7467027742022738609==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSA3YWZiMjZlMjM0MzZkMDBiMDI2NGNmNTM2MWYwYTQ5MzQ4Y2QwMzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMTo0ODo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjQzLjAgLT4gMS4zLjI1MC4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yNDMuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI1MC4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yNDMu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI1MC4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNDMuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjQzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYgppbmRleCBkZmRkNzE2YWJkLi5iOGYx
M2JkYTMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjQzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjI1MC4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9c2Rr
LTEuMy4yNDM7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiMThiZGY1NTY1ZjVkMDI4MzE4Njk3
ODVjYmY3NThmYTdiMjk1YjdkNSIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKK1NSQ1JF
ViA9ICI2OTU4ODdhOTk0ZWY5Y2MwMGE3YWEzZjljMDBiMzFhNTZlYTc5NTM0IgogCiBTID0gIiR7
V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============7467027742022738609==--

