Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.62.1594831395441999928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51C93E01E95; Wed, 15 Jul 2020 09:43:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56E7CE01E9F
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.14.5 FAILED
Message-Id: <20200715164315.51C93E01E95@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:15 -0700 (PDT)
X-Groupsio-MsgNum: 140649
Content-Type: multipart/mixed; boundary="===============1137916279104676769=="

--===============1137916279104676769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.14.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.14.4-1.14.5.patch
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

--===============1137916279104676769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (0 cached, 778 parsed). 1339 targets, 44 skipped, 0 masked, 0 errors.
Removing 6 recipes from the core2-32 sysroot...done.
Removing 6 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:efb698c6331281aeefc022544af49698aaaca05d"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 37 Missed 13 Current 98 (74% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 99 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 100 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 101 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 102 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 103 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 114 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 118 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb:do_package_write_rpm_setscene)
NOTE: Running task 436 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_fetch)
NOTE: Running task 443 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.14.bb:do_fetch)
NOTE: Running task 444 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.14.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-1.14.5-r0: task do_fetch: Started
NOTE: recipe go-runtime-1.14.5-r0: task do_fetch: Started
NOTE: recipe libgcc-10.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_fetch: Succeeded
NOTE: Running task 445 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_unpack)
NOTE: recipe gcc-runtime-10.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 446 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe go-1.14.5-r0: task do_fetch: Succeeded
NOTE: recipe go-runtime-1.14.5-r0: task do_fetch: Succeeded
NOTE: Running task 447 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.14.bb:do_unpack)
NOTE: Running task 448 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.14.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_unpack: Started
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe go-runtime-1.14.5-r0: task do_unpack: Started
NOTE: recipe go-1.14.5-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-10.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 119 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-10.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 121 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 122 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 123 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 125 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 126 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 127 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 129 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 130 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 131 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb:do_packagedata_setscene)
NOTE: recipe go-1.14.5-r0: task do_unpack: Succeeded
NOTE: Running task 453 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.14.bb:do_patch)
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 132 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 133 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 134 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe go-1.14.5-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.0+gitAUTOINC+fca7428c09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 140 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 141 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 142 of 148 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_unpack: Succeeded
NOTE: Running task 475 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_patch)
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_patch: Started
ERROR: go-1.14.5-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/go/1.14.5-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Patch 0009-ld-replace-glibc-dynamic-linker-with-musl.patch is already applied; check your series file
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/go/1.14.5-r0/temp/log.do_patch.6323
NOTE: recipe go-1.14.5-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.14.bb:do_patch) failed with exit code '1'
NOTE: recipe go-runtime-1.14.5-r0: task do_unpack: Succeeded
ERROR: go-cross-core2-32-1.14.5-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/go-cross-core2-32/1.14.5-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Patch 0009-ld-replace-glibc-dynamic-linker-with-musl.patch is already applied; check your series file
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/go-cross-core2-32/1.14.5-r0/temp/log.do_patch.6843
NOTE: recipe go-cross-core2-32-1.14.5-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_patch) failed with exit code '1'
NOTE: recipe gcc-cross-i686-10.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 475 tasks of which 466 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.14.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-cross_1.14.bb:do_patch
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1137916279104676769==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.14.4-1.14.5.patch"

From 7bc35b9a50e95299a761fadbf99bf80c64dd42b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 05:15:05 +0000
Subject: [PATCH] go: upgrade 1.14.4 -> 1.14.5

---
 meta/recipes-devtools/go/go-1.14.inc          | 25 +++++++++++--------
 ...place-glibc-dynamic-linker-with-musl.patch | 21 ++++++++++++++--
 meta/recipes-devtools/go/go_1.14.bb           |  1 +
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 1050116950..30364b65db 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -7,15 +7,18 @@ FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-"
+SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main \
+           file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+           file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+           file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+           file://0004-ld-add-soname-to-shareable-objects.patch \
+           file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+           file://0006-cmd-dist-separate-host-and-target-builds.patch \
+           file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+           file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+           file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch \
+           "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "7011af3bbc2ac108d1b82ea8abb87b2e63f78844f0259be20cde4d42c5c40584"
+SRC_URI[main.sha256sum] = "ca4c080c90735e56152ac52cd77ae57fe573d1debb1a58e03da9cc362440315c"
+
+PV = "1.14.5"
diff --git a/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
index 427cfb0dd2..1a572a3e4f 100644
--- a/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
+++ b/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -1,7 +1,7 @@
-From 973251ae0c69a35721f6115345d3f57b2847979f Mon Sep 17 00:00:00 2001
+From 483a3c3befc22f25f7b9ddc5a8d4437c9937b188 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:20:13 +0430
-Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl
+Subject: [PATCH] ld: replace glibc dynamic linker with musl
 
 Rework of patch by Khem Raj <raj.khem@gmail.com>
 for go 1.10.  Should be applied conditionally on
@@ -14,6 +14,7 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [Real fix should be portable across libcs]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
 ---
  src/cmd/link/internal/amd64/obj.go  | 2 +-
  src/cmd/link/internal/arm/obj.go    | 2 +-
@@ -25,6 +26,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/link/internal/x86/obj.go    | 2 +-
  8 files changed, 8 insertions(+), 8 deletions(-)
 
+diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/amd64/obj.go
+index 029a24d..c77bc58 100644
 --- a/src/cmd/link/internal/amd64/obj.go
 +++ b/src/cmd/link/internal/amd64/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -36,6 +39,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		Freebsddynld:   "/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/obj.go
+index 27246df..e37b97a 100644
 --- a/src/cmd/link/internal/arm/obj.go
 +++ b/src/cmd/link/internal/arm/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -47,6 +52,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
+index 13157be..ed54ceb 100644
 --- a/src/cmd/link/internal/arm64/obj.go
 +++ b/src/cmd/link/internal/arm64/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -58,6 +65,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
+diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
+index 231e1ff..631dd7a 100644
 --- a/src/cmd/link/internal/mips/obj.go
 +++ b/src/cmd/link/internal/mips/obj.go
 @@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -69,6 +78,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/mips64/obj.go
+index 6abbb76..4a0c295 100644
 --- a/src/cmd/link/internal/mips64/obj.go
 +++ b/src/cmd/link/internal/mips64/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -80,6 +91,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
  		Netbsddynld:    "XXX",
+diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/ppc64/obj.go
+index 49c7ec2..a503c7c 100644
 --- a/src/cmd/link/internal/ppc64/obj.go
 +++ b/src/cmd/link/internal/ppc64/obj.go
 @@ -63,7 +63,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -91,6 +104,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
+index 3454476..42cc346 100644
 --- a/src/cmd/link/internal/s390x/obj.go
 +++ b/src/cmd/link/internal/s390x/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -102,6 +117,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  
  		// not relevant for s390x
  		Freebsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/obj.go
+index f53ecc8..57716d2 100644
 --- a/src/cmd/link/internal/x86/obj.go
 +++ b/src/cmd/link/internal/x86/obj.go
 @@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
index bc90a1329e..19466cc4d9 100644
--- a/meta/recipes-devtools/go/go_1.14.bb
+++ b/meta/recipes-devtools/go/go_1.14.bb
@@ -12,3 +12,4 @@ python() {
     else:
         d.setVar('GOBUILDMODE', 'pie')
 }
+
-- 
2.17.1


--===============1137916279104676769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'go'
go was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)
Parsing of 778 .bb files complete (0 cached, 778 parsed). 1339 targets, 66 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1137916279104676769==--
