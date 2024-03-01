Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E654EC54E7E
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36642.1709330717707630673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Iq3UJMk3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VlryO5MG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd9b5-aeb4a32f-8b27-4abc-a187-c8f6bf5ee3f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QzhJs1KzAALUoPkDo/Ewkdx8f/UTu0Eph2XRSjOtxho=;
	b=Iq3UJMk3amCP/PD53Ap24cwnaAr07gFEYBS4wuVzXlyadkm/zcHykvD/Pod/m0uu
	4ZwoRviJMkoacNhUhBEpBBI9upgjiTDxwkJJgIC3Vjh5KAZGJBVFzD/LSaps86/Yl5O
	Qpe0DFxbNP5tCRr9qPI6vKCxpykxb/QOt/RiuTyg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QzhJs1KzAALUoPkDo/Ewkdx8f/UTu0Eph2XRSjOtxho=;
	b=VlryO5MGOTMPH6NU+VtDPmqExBsYSYWZchTbzTeDN1q/to/b+OZAaUC/ybUOz7ny
	Mub/C6oJ1mo3bAkfr058Hus6xCS3TRRTjQ5I2DPxFp4jJQbIyFVFroxKl2uhTw69Pf5
	i6vobsHm5rI3FwMzvH/jK3a2H+11kKB55wxRtoAE=
Content-Type: multipart/mixed; boundary="===============2411746746277692351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.275.0 FAILED
Message-ID: <0101018dfc0cd9b5-aeb4a32f-8b27-4abc-a187-c8f6bf5ee3f9-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196521

--===============2411746746277692351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.275.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.268.0-1.3.275.0.patch
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
From fece2cdb59c180082833989337dd47ec23f5ed6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 17:15:51 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.268.0 -> 1.3.275.0

---
 .../{vulkan-tools_1.3.268.0.bb => vulkan-tools_1.3.275.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.268.0.bb => vulkan-tools_1.3.275.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
index 78bd9b0e04..b4bd23b837 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "1532001f7edae559af1988293eec90bc5e2607d5"
+SRCREV = "c86d42cf9eb620eeac377e3bff46ae342c5cd664"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============2411746746277692351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-49901e3564b44b6642abcdf9c9ea52fa515459ef"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:49901e3564b44b6642abcdf9c9ea52fa515459ef"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 175 Local 163 Mirrors 0 Missed 12 Current 391 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_recipe_qa unihash changed to 18236bae44c9e6f9ebbe839ec75efb8579013ba76430cb067b4e27e68325276e
NOTE: Setscene tasks completed
NOTE: Running task 1575 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_fetch: Succeeded
NOTE: Running task 1576 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_unpack)
NOTE: Running task 1577 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_patch)
NOTE: Running task 1579 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_generate_toolchain_file)
NOTE: Running task 1582 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_populate_lic unihash changed to 2a58b007f7aade262494ad890afe7640ae53d67e3abc90f20e1a31ea2e9b363b
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_deploy_source_date_epoch unihash changed to fac0e3e7198d347b374dda59a5c41058fcc10b2e2b11128a5cfaa5decedd082b
NOTE: Setscene tasks completed
NOTE: Running task 1583 of 1595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.
 8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'vulkan-headers', 'vulkan-loader', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Found Git: /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/git (found version "2.42.0")
| -- Checking for module 'wayland-client'
| --   Found wayland-client, version 1.22.0
| -- Configuring done (0.5s)
| -- Generating done (0.0s)
| CMake Error at vulkaninfo/CMakeLists.txt:109 (target_link_libraries):
|   Target "vulkaninfo" links to:
| 
|     volk::volk_headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     CMAKE_EXPORT_NO_PACKAGE_REGISTRY
|     FETCHCONTENT_FULLY_DISCONNECTED
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/run.do_configure.3123804:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/bui
 ldtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/run.do_configure.3123804, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/run.do_configure.3123804, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/run.do_configure.3123804, line 180
NOTE: recipe vulkan-tools-1.3.275.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1583 tasks of which 1573 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301171530.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301171530.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.275.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/run.do_configure.3123804', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.275.0/temp/log.do_configure.3123804
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb:do_configure) failed with exit code '1'

--===============2411746746277692351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSBmZWNlMmNkYjU5YzE4MDA4MjgzMzk4OTMzN2RkNDdlYzIzZjVlZDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNzoxNTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjY4LjAgLT4gMS4zLjI3NS4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yNjguMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI3NS4wLmJifSAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjY4LjAu
YmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNzUuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjY4LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjc1LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tdG9vbHNfMS4zLjI2OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjc1LjAuYmIKaW5kZXggNzhiZDliMGUwNC4uYjRiZDIz
YjgzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9v
bHNfMS4zLjI2OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LXRvb2xzXzEuMy4yNzUuMC5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9ICJsaWJzIgogTElD
RU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50
eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMuZ2l0O2JyYW5jaD1tYWluO3By
b3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjE1MzIwMDFmN2VkYWU1NTlhZjE5ODgyOTNlZWM5MGJj
NWUyNjA3ZDUiCitTUkNSRVYgPSAiYzg2ZDQyY2Y5ZWI2MjBlZWFjMzc3ZTNiZmY0NmFlMzQyYzVj
ZDY2NCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============2411746746277692351==--

