Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BD7D5E385
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17393.1765872135280841953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Sx2ck+pS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Pq0Q2wNX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262ecec6-f7686675-1460-4afe-8dbe-a34c7661824f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y7EZpBnac70Fqa4I5XvW9RstOL0JdBPigYf1o60t5ag=;
	b=Sx2ck+pS1XEFtph050eDRmd8SxBwF13h7UrSsTve4enPfni+atcXREMqrwWpKJPZ
	XN/QYp2KsWQOzrczpEqolEcjW0U5lnBrnW40K92ymJNW5NmzRztBZlJ4xgxnpUGyfwB
	WNFeM44QP/6BUmlOdj66xV9gBctROYjbAjdufkik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y7EZpBnac70Fqa4I5XvW9RstOL0JdBPigYf1o60t5ag=;
	b=Pq0Q2wNXKPjwA+0SnMGlpFIJfvm7hRkHQNSpXDH3PheJsKYrVVhqrSmKP6rLgR7w
	a5LG3E8fdQfkoM3sTTNKk7q52oR2wmya++V66ShB7BiQmRGLRrWkleXbgSjy/LbtS4k
	Z/7HQiluXb+NSRSpFlbgimdVQ+fwcOkFuK/1be4w=
Content-Type: multipart/mixed; boundary="===============7598912481646678772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-tools: upgrading to 1.4.335.0 FAILED
Message-ID: <0101019b262ecec6-f7686675-1460-4afe-8dbe-a34c7661824f-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227874

--===============7598912481646678772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.335.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.328.1-1.4.335.0.patch
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
From 56f8253cefb2fc76a49bcd480d0e1fc92b81dc9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:05:07 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.328.1 -> 1.4.335.0

---
 .../{vulkan-tools_1.4.328.1.bb => vulkan-tools_1.4.335.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.328.1.bb => vulkan-tools_1.4.335.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
index 34823b295c..b5bf3d0923 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "c08c91e473dcab3d5042e85856b005562fa5dbbb"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "8542e6dcfc6daef20d561220f1d91a02c25d95b2"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.1


--===============7598912481646678772==
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
DISTRO_VERSION       = "5.2.99+snapshot-41c477604e5f93074e055d9f9b0dfce36e02984a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:41c477604e5f93074e055d9f9b0dfce36e02984a"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 103 Local 94 Mirrors 0 Missed 9 Current 399 (91% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 429 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 501 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 502 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1419 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_unpack)
NOTE: Running task 1421 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1422 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_patch)
NOTE: Running task 1423 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1427 of 1439 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-w
 orker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/l
 ayers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'vulkan-loader', 'vulkan-volk', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.2.0
| -- The CXX compiler identification is GNU 15.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:59 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.335".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.328
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/run.do_configure.2636571:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/sources/vulkan-tools-1.4.335.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yo
 cto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/run.do_configure.2636571, line 162
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/run.do_configure.2636571, line 141
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/run.do_configure.2636571, line 180
NOTE: recipe vulkan-tools-1.4.335.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1427 tasks of which 1420 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216050454.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216050454.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/log.do_configure.2636571
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.335.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/run.do_configure.2636571' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.335.0/temp/log.do_configure.2636571
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb:do_configure) failed with exit code '1'

--===============7598912481646678772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSA1NmY4MjUzY2VmYjJmYzc2YTQ5YmNkNDgwZDBlMWZjOTJiODFkYzliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MDU6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS40LjMyOC4xIC0+IDEuNC4zMzUuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjQuMzI4LjEuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMzUuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjQuMzI4
LjEuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMzUuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzI4LjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzM1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS40LjMyOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzM1LjAuYmIKaW5kZXggMzQ4MjNiMjk1Yy4uYjVi
ZjNkMDkyMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS40LjMyOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuNC4zMzUuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXZ1
bGthbi1zZGstMS40LjMyODtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJjMDhjOTFlNDczZGNh
YjNkNTA0MmU4NTg1NmIwMDU1NjJmYTVkYmJiIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBz
IgorU1JDUkVWID0gIjg1NDJlNmRjZmM2ZGFlZjIwZDU2MTIyMGYxZDkxYTAyYzI1ZDk1YjIiCiAK
IGluaGVyaXQgY21ha2UgZmVhdHVyZXNfY2hlY2sgcGtnY29uZmlnCiBBTllfT0ZfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSB3YXlsYW5kIgotLSAKMi40Ny4xCgo=

--===============7598912481646678772==--

