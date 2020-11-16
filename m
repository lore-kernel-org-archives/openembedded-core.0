Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39493.1605551303737590398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1AEB338C1162
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.15.5 FAILED
Message-ID: <MADEUP.164810677E9E24BC.25243@lists.openembedded.org>
X-Groupsio-MsgNum: 144633
Content-Type: multipart/mixed; boundary="===============7264706064894447878=="

--===============7264706064894447878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.15.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.15.3-1.15.5.patch
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

--===============7264706064894447878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1389 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (785 cached, 6 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64_i686 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:25f55a00f4ca4eb6338956e0684a2253d5a32012"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 13 Found 4 Missed 9 Current 122 (30% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 497 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_fetch)
NOTE: Running task 498 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_fetch)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_fetch: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_fetch: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_fetch: Succeeded
NOTE: Running task 521 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_unpack)
NOTE: Running task 522 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe go-runtime-1.15.5-r0: task do_fetch: Succeeded
NOTE: Running task 523 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_unpack)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_unpack: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_unpack: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_unpack: Succeeded
NOTE: Running task 524 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_patch)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_patch: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_unpack: Succeeded
NOTE: Running task 525 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_patch)
NOTE: recipe go-runtime-1.15.5-r0: task do_patch: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_patch: Succeeded
NOTE: Running task 526 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 527 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_configure)
NOTE: Running task 528 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_compile)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_compile: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_patch: Succeeded
NOTE: Running task 529 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 530 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_populate_lic)
NOTE: recipe go-runtime-1.15.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_populate_lic: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe go-runtime-1.15.5-r0: task do_populate_lic: Succeeded
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_compile: Succeeded
NOTE: Running task 531 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_install)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_install: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_install: Succeeded
NOTE: Running task 532 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.15.bb:do_populate_sysroot)
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_populate_sysroot: Started
NOTE: recipe go-cross-core2-32-1.15.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 533 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe go-runtime-1.15.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 534 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_configure)
NOTE: recipe go-runtime-1.15.5-r0: task do_configure: Started
NOTE: recipe go-runtime-1.15.5-r0: task do_configure: Succeeded
NOTE: Running task 535 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_compile)
NOTE: recipe go-runtime-1.15.5-r0: task do_compile: Started
ERROR: go-runtime-1.15.5-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/temp/run.do_compile.8546' failed with exit code 2:
Building Go cmd/dist using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go. (go1.15.3 linux/amd64)
Building Go toolchain1 using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go.
Building Go bootstrap cmd/go (go_bootstrap) using Go toolchain1.
Building Go toolchain2 using go_bootstrap and Go toolchain1.
Building Go toolchain3 using go_bootstrap and Go toolchain2.
Building std for target, linux/386.
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
go tool dist: FAILED: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/go/pkg/tool/native_native/go_bootstrap install -gcflags=all= -ldflags=all= std: exit status 1
WARNING: exit code 2 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/temp/log.do_compile.8546
Log data follows:
| DEBUG: Executing shell function do_compile
| Building Go cmd/dist using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go. (go1.15.3 linux/amd64)
| Building Go toolchain1 using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go.
| Building Go bootstrap cmd/go (go_bootstrap) using Go toolchain1.
| Building Go toolchain2 using go_bootstrap and Go toolchain1.
| Building Go toolchain3 using go_bootstrap and Go toolchain2.
| Building std for target, linux/386.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| go tool dist: FAILED: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/go/pkg/tool/native_native/go_bootstrap install -gcflags=all= -ldflags=all= std: exit status 1
| WARNING: exit code 2 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/temp/run.do_compile.8546' failed with exit code 2:
| Building Go cmd/dist using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go. (go1.15.3 linux/amd64)
| Building Go toolchain1 using /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/recipe-sysroot-native/usr/lib/go.
| Building Go bootstrap cmd/go (go_bootstrap) using Go toolchain1.
| Building Go toolchain2 using go_bootstrap and Go toolchain1.
| Building Go toolchain3 using go_bootstrap and Go toolchain2.
| Building std for target, linux/386.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| go tool dist: FAILED: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/go-runtime/1.15.5-r0/go/pkg/tool/native_native/go_bootstrap install -gcflags=all= -ldflags=all= std: exit status 1
| WARNING: exit code 2 from a shell command.
| 
NOTE: recipe go-runtime-1.15.5-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 535 tasks of which 518 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.15.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7264706064894447878==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.15.3-1.15.5.patch"

From 7674f70207897a6293eabd08e54a0132933267c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 13:49:23 +0000
Subject: [PATCH] go-runtime: upgrade 1.15.3 -> 1.15.5

---
 meta/recipes-devtools/go/go-1.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index a35921c1f8..31e68d14ee 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.3"
+PV = "1.15.5"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
+SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
-- 
2.20.1


--===============7264706064894447878==--
