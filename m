Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4FCC07542
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8480.1698848703495532161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nk5nGAJt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W2GeM9l+;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460bcd-50f07319-ce9c-49f5-808c-3032f400b829-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R2poQpGKW6kie7wwSpLpnTE7r4RfKcpqmLozZ1nWgNw=;
	b=Nk5nGAJtVgOiYhUy9N2qldKFanVzngVOd76CpVyHJhtFMYDRtWlW/MpUJiGpao9+
	dkGVuCxF6JHlWCzm0KnUH+1PwGytgAF7IXnhi+cyT4tc4AGf6/BZFw8xEAp/EHVbv0i
	9P4sK38S3i+DhjSfLNvB6xUU1OfNdhF0ORazUwGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R2poQpGKW6kie7wwSpLpnTE7r4RfKcpqmLozZ1nWgNw=;
	b=W2GeM9l+0yt5T7T4TjHkl7yx3C2E34NNQff9538yWJuazcyfFjyHIwaAtkYx5XR2
	b0iBabXwsmz9XdSsGAB+tf2RRe1X4mxPP+TTX3U8GKiIGXXmfrHALkkCj5GMvZ3gFad
	JPi6UKM/Js8VPPnX6h1EkYkFXNmjMD63GAuIZXvE=
Content-Type: multipart/mixed; boundary="===============8495582641205307922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018b8b460bcd-50f07319-ce9c-49f5-808c-3032f400b829-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190004

--===============8495582641205307922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.268.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.261.1-1.3.268.0.patch
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
From ac0338da419bfb2afcd9be51b4097d8e3c826d77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:19:25 +0000
Subject: [PATCH] glslang: upgrade 1.3.261.1 -> 1.3.268.0

---
 .../glslang/{glslang_1.3.261.1.bb => glslang_1.3.268.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.261.1.bb => glslang_1.3.268.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
index e607045148..668184ba62 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "76b52ebf77833908dc4c0dd6c70a9c357ac720bd"
+SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============8495582641205307922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b6658b82ff8a9270cc6d7789b8c81fa7c9c0565f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b6658b82ff8a9270cc6d7789b8c81fa7c9c0565f"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 22 Mirrors 0 Missed 10 Current 261 (68% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 766 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_recipe_qa)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_unpack)
NOTE: Running task 855 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_patch)
NOTE: Running task 857 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_collect_spdx_deps)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_patch: Succeeded
NOTE: Running task 858 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 859 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: Running task 860 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:
 do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'ninja-native', 'patch-native', 'pseudo-native', 'python3-native', 'xz-native', 'util-linux-libuuid-native', 'bzip2-native', 'libtirpc-native', 'libedit-native', 'libnsl2-native', 'gdbm-native', 'libtool-native', 'libffi-native', 'sqlite3-native', 'openssl-native', 'expat-native', 'zlib-native', 'ncurses-native', 're2c-native', 'zstd-native', 'flex-native', 'gnu-config-native', 'linux-libc-headers', 'texinfo-dummy-native', 'mpfr-native', 'gmp-native', 'libmpc-native', 'binutils-cross-x86_64', 'libgcc', 'attr-native', 'gettext-minimal-native', 'perl-native', 'm4-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:280 (message):
|   ENABLE_OPT set but SPIR-V tools not found.  Please run
|   update_glslang_sources.py, set the ALLOW_EXTERNAL_SPIRV_TOOLS option to use
|   a local install of SPIRV-Tools, or set ENABLE_OPT=0.
| 
| 
| -- optimizer enabled
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| -- Found Python3: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 (found version "3.11.5") found components: Interpreter
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1985205:168 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sy
 sroot-native/usr/bin/python3-native/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DENABLE_PCH=OFF -DENABLE_CTEST=OFF -DBUILD_EXTERNAL=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1985205, line 168
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1985205, line 147
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1985205, line 186
NOTE: recipe glslang-1_1.3.268.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 861 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glslang-1_1.3.268.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1985205', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/log.do_configure.1985205
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure) failed with exit code '1'

--===============8495582641205307922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSBhYzAzMzhkYTQxOWJmYjJhZmNkOWJlNTFiNDA5N2Q4ZTNjODI2ZDc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjoxOToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI2MS4xIC0+IDEuMy4yNjguMAoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjYxLjEuYmIgPT4gZ2xzbGFuZ18xLjMuMjY4LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjYxLjEuYmIgPT4gZ2xz
bGFuZ18xLjMuMjY4LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuMy4yNjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNjEuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjY4LjAu
YmIKaW5kZXggZTYwNzA0NTE0OC4uNjY4MTg0YmE2MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjY4LjAuYmIKQEAgLTgsNyArOCw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZl
cmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAm
IE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRh
NDVmZTgwN2RjMyIKIAotU1JDUkVWID0gIjc2YjUyZWJmNzc4MzM5MDhkYzRjMGRkNmM3MGE5YzM1
N2FjNzIwYmQiCitTUkNSRVYgPSAiMzZkMDhjMGQ5NDBjZjMwN2EyMzkyODI5OWVmNTJjNzk3MGQ4
Y2VlNiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5n
aXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjM5
LjIKCg==

--===============8495582641205307922==--

