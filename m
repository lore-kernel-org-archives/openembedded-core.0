Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E9CC27C6F
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.6014.1689456453642951403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HI6v5kcr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73adc3-a3627e09-b987-4ade-930a-b1a5751836d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EKULsyRXG1VTZ9ZN21VD0WRUkJd8P/FEMRzYM3HTmI4=;
	b=HI6v5kcr80RjRYv/g+StgfO3rAeBSvwBVSVDCejvdE9nDLUZ+CbhVaz93/ZFbYo5
	YaMDo822tmO/obVLUEWXaF+oQDkz0zGfapOnmznAQIMcoAri3u0kuoV+1auGb2t3L73
	LgiZUMTt2nPn3verMXIcctI5MjvtZ0AuZ4malTf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EKULsyRXG1VTZ9ZN21VD0WRUkJd8P/FEMRzYM3HTmI4=;
	b=WtWexSIXg2+sWtWJ94fCpzzsUCUKgiSXvwSxpN7XGSBIIYtKLEvSjfV4M0n1yBtd
	SwrbWILQwg5LsnGTM43oWbkcHm773gRlLJk7PycDDg4K88d6tDlBB08FMPuI2/nEFOJ
	2PWGTlGPWeaUwu0dBCAd9bl9eeOa9yc1q2jB6dmE=
Content-Type: multipart/mixed; boundary="===============2446164230292306943=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.16.02 FAILED
Message-ID: <010101895b73adc3-a3627e09-b987-4ade-930a-b1a5751836d7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184350

--===============2446164230292306943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.16.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.15.08-0.16.02.patch
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
From c712631efed048efe3126952a3be820dc94129bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 15:34:59 +0000
Subject: [PATCH] stress-ng: upgrade 0.15.08 -> 0.16.02

---
 .../stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.02.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
index 9952c4ef8a..265e2eee64 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "4fc205238518cdaf80cf18e8bd411708f7ba3856"
+SRCREV = "945c7f1e80280a0754302ee3cc9d14f3cbb6596c"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.39.2


--===============2446164230292306943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.15.08-0.16.02.patch"

RnJvbSBjNzEyNjMxZWZlZDA0OGVmZTMxMjY5NTJhM2JlODIwZGM5NDEyOWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTU6MzQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJlc3Mtbmc6IHVwZ3JhZGUgMC4xNS4wOCAtPiAwLjE2LjAyCgotLS0KIC4uLi9zdHJlc3Mtbmcv
e3N0cmVzcy1uZ18wLjE1LjA4LmJiID0+IHN0cmVzcy1uZ18wLjE2LjAyLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcve3N0cmVzcy1uZ18wLjE1LjA4LmJiID0+IHN0
cmVzcy1uZ18wLjE2LjAyLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTUuMDguYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE2LjAyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTUu
MDguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5n
XzAuMTYuMDIuYmIKaW5kZXggOTk1MmM0ZWY4YS4uMjY1ZTJlZWU2NCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xNS4wOC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE2LjAyLmJiCkBAIC03
LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0NvbGluSWFuS2luZy9zdHJlc3MtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNGZjMjA1MjM4NTE4Y2RhZjgwY2YxOGU4YmQ0MTE3
MDhmN2JhMzg1NiIKK1NSQ1JFViA9ICI5NDVjN2YxZTgwMjgwYTA3NTQzMDJlZTNjYzlkMTRmM2Ni
YjY1OTZjIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9ICJjb3JldXRpbHMtbmF0
aXZlIGxpYmJzZCIKLS0gCjIuMzkuMgoK

--===============2446164230292306943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:893ee90e831877ffe75256db19bdad3a9edbcef6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 35 Mirrors 0 Missed 9 Current 189 (79% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 762 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_fetch)
NOTE: recipe stress-ng-0.16.02-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_unpack)
NOTE: Running task 847 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.16.02-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_unpack: Succeeded
NOTE: Running task 848 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_patch)
NOTE: Running task 849 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_collect_spdx_deps)
NOTE: recipe stress-ng-0.16.02-r0: task do_patch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_collect_spdx_deps: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_patch: Succeeded
NOTE: Running task 850 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_deploy_source_date_epoch)
NOTE: Running task 851 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_populate_lic)
NOTE: recipe stress-ng-0.16.02-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.16.02-r0: task do_populate_lic: Succeeded
NOTE: recipe stress-ng-0.16.02-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 852 of 862 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure)
NOTE: recipe stress-ng-0.16.02-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.7.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do
 _populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'bash-completion', 'libbsd', 'coreutils-native', 'patch-native', 'pseudo-native', 'libtool-native', 'attr-native', 'libmd', 'libgcc', 'linux-libc-headers', 'mpfr-native', 'zstd-native', 'libmpc-native', 'binutils-cross-i686', 'gmp-native', 'flex-native', 'zlib-native', 'xz-native', 'texinfo-dummy-native', 'gnu-config-native', 'gettext-minimal-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: make VERBOSE=1 makeconfig
| Generating config..
| make CC="i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/recipe-sysroot" STATIC= -f Makefile.config
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/git'
| checking compiler ...
| /bin/sh: ./test/test-compiler: No such file or directory
| /bin/sh: configs/$(./test/test-compiler): Is a directory
| make[1]: *** [Makefile.config:314: compiler] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/git'
| make: *** [Makefile:577: config.h] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609, line 169
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609, line 153
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609, line 148
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609, line 143
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609, line 182
NOTE: recipe stress-ng-0.16.02-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 852 tasks of which 844 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: stress-ng-0.16.02-r0 do_configure: oe_runmake failed
ERROR: stress-ng-0.16.02-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/run.do_configure.3953609', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.16.02-r0/temp/log.do_configure.3953609
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.16.02.bb:do_configure) failed with exit code '1'

--===============2446164230292306943==--

