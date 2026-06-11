Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83813CDE019
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50619.1781195511408346341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RNu7lFWT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G+qA2scJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786ac54-c8b68bf8-a558-4259-a127-7f5bc498274d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195517;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IdhfXbhztUsXaLu/jVdj0mekOy04Lq9u0/tRBEbSBzk=;
	b=RNu7lFWTYyEAmXY7yph3TMQul/I+kwT+6SsP5iTRkyevi0dT8EYUd2UWZ8Vf2gTZ
	1y1Qo+Pueh1tL0uzyaeYKFt5SaXmUdKJZqN+3YDs2UGFd7c8QcV+dk0BhE6xiimrudI
	wDujMUlKLOs77z3RoRDjL6H2iPAUFv6pIqeo45lY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195517;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IdhfXbhztUsXaLu/jVdj0mekOy04Lq9u0/tRBEbSBzk=;
	b=G+qA2scJGtfoGTJMWWw9+Wzfjc6PKvUk1VAYaDtJUKJQAs30qKuv4ACEcuFiPFhs
	FRdCKul7jKsiqRoD4mp1DCBLcgSz7qIW1OhA3hvpRkgkBFuwFJqeB7atTLsuRhV6AeF
	C9L0/977AFDc2rJq/5rE5LX+pnVBL6+Wvlny9JS8=
Content-Type: multipart/mixed; boundary="===============5597154957194053222=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-tools: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019eb786ac54-c8b68bf8-a558-4259-a127-7f5bc498274d-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238541

--===============5597154957194053222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.350.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.341.0-1.4.350.0.patch
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
From bdf675d40a80b0baf399b36d9f549a9c0d3b8f56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:51:50 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../{vulkan-tools_1.4.341.0.bb => vulkan-tools_1.4.350.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.341.0.bb => vulkan-tools_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
index 69c77f66e8..ece9961c71 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "48a4bcbdf619e57204783f8c1a04c76c160ddd5b"
+SRCREV = "1cb3a319969cf0d3e2315b0a87a27447f55b4167"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.1


--===============5597154957194053222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-f4b2c82e15c6683ed772a7cbd8521fef4305d366"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f4b2c82e15c6683ed772a7cbd8521fef4305d366"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 132 Local 122 Mirrors 0 Missed 10 Current 462 (92% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 550 of 594 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 589 of 594 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1415 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 594 of 594 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1429 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1430 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_unpack)
NOTE: Running task 1431 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1436 of 1448 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-w
 orker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/l
 ayers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'vulkan-loader', 'vulkan-volk', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 16.1.0
| -- The CXX compiler identification is GNU 16.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:59 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.350".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.341
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/run.do_configure.2127973:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/sources/vulkan-tools-1.4.350.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yo
 cto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/run.do_configure.2127973, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/run.do_configure.2127973, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/run.do_configure.2127973, line 179
NOTE: recipe vulkan-tools-1.4.350.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1436 tasks of which 1429 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611125134.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611125134.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/log.do_configure.2127973
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.350.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/run.do_configure.2127973' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.350.0/temp/log.do_configure.2127973
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb:do_configure) failed with exit code '1'

--===============5597154957194053222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBiZGY2NzVkNDBhODBiMGJhZjM5OWIzNmQ5ZjU0OWE5YzBkM2I4ZjU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6NTE6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS40LjM0MS4wIC0+IDEuNC4zNTAuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjQuMzQxLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zNTAuMC5iYn0gICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS40LjM0MS4w
LmJiID0+IHZ1bGthbi10b29sc18xLjQuMzUwLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS40LjM0MS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS40LjM1MC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXRvb2xzXzEuNC4zNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3Z1bGthbi92dWxrYW4tdG9vbHNfMS40LjM1MC4wLmJiCmluZGV4IDY5Yzc3ZjY2ZTguLmVjZTk5
NjFjNzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRv
b2xzXzEuNC4zNDEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi10b29sc18xLjQuMzUwLjAuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibGlicyIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFpbjtw
cm90b2NvbD1odHRwczt0YWc9dnVsa2FuLXNkay0ke1BWfSIKLVNSQ1JFViA9ICI0OGE0YmNiZGY2
MTllNTcyMDQ3ODNmOGMxYTA0Yzc2YzE2MGRkZDViIgorU1JDUkVWID0gIjFjYjNhMzE5OTY5Y2Yw
ZDNlMjMxNWIwYTg3YTI3NDQ3ZjU1YjQxNjciCiAKIGluaGVyaXQgY21ha2UgZmVhdHVyZXNfY2hl
Y2sgcGtnY29uZmlnCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIngxMSB3YXlsYW5kIgotLSAK
Mi40Ny4xCgo=

--===============5597154957194053222==--

