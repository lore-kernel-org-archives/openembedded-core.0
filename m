Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1348.1618510600151102655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id EDE6738C13AA
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.40 SUCCEEDED
Message-ID: <MADEUP.16761AD0D6267D04.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150505
Content-Type: multipart/mixed; boundary="===============2371359977747289584=="

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *file* to *5.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-file-upgrade-5.39-5.40.patch
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

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39af5806e0478b4721c86e2f2ed9691abbdb932c"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 20 Network 0 Missed 7 Current 641 (74% match, 98% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1530 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_fetch: Started
NOTE: recipe file-5.40-r0: task do_fetch: Succeeded
NOTE: Running task 1843 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_unpack)
NOTE: Running task 1844 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_unpack: Started
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_unpack: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2097 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_patch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_patch: Started
NOTE: recipe file-5.40-r0: task do_patch: Succeeded
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2098 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic unihash changed to 766a28ed0f3e5e1466487f68e8f8ad995b42e0a3ae57b78a08a6f22f7b3b4994
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2126 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_configure)
NOTE: recipe file-5.40-r0: task do_configure: Started
NOTE: recipe file-5.40-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_compile)
NOTE: recipe file-5.40-r0: task do_compile: Started
NOTE: recipe file-5.40-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_install)
NOTE: recipe file-5.40-r0: task do_install: Started
NOTE: recipe file-5.40-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package)
NOTE: Running task 2130 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot)
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.40-r0: task do_package: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.40-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata)
NOTE: recipe file-5.40-r0: task do_packagedata: Started
NOTE: recipe file-5.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2132 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_qa)
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2134 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_build)
NOTE: Tasks Summary: Attempted 2134 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============2371359977747289584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-file-upgrade-5.39-5.40.patch"

From 7f96267ca9305ec2dd280ae0f38f8b57f00c3111 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 04:47:40 +0000
Subject: [PATCH] file: upgrade 5.39 -> 5.40

---
 .../file/{file_5.39.bb => file_5.40.bb}       |  5 ++--
 ....c-correct-header-define-for-xz-lzma.patch | 27 -------------------
 2 files changed, 2 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/file/{file_5.39.bb => file_5.40.bb} (90%)
 delete mode 100644 meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch

diff --git a/meta/recipes-devtools/file/file_5.39.bb b/meta/recipes-devtools/file/file_5.40.bb
similarity index 90%
rename from meta/recipes-devtools/file/file_5.39.bb
rename to meta/recipes-devtools/file/file_5.40.bb
index abaa8149a3..ec79839bd2 100644
--- a/meta/recipes-devtools/file/file_5.39.bb
+++ b/meta/recipes-devtools/file/file_5.40.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS_class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git \
-           file://0001-src-compress.c-correct-header-define-for-xz-lzma.patch"
+SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "87731415de945660b00f02207d8e9d986ef9b82e"
+SRCREV = "f49fda6f52a9477d817dbd9c06afab02daf025f8"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch b/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
deleted file mode 100644
index f8ba2f6153..0000000000
--- a/meta/recipes-devtools/file/files/0001-src-compress.c-correct-header-define-for-xz-lzma.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ffb6ebdb42590cb9f7d3f5177b7b820a9edc4c81 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 18 Oct 2020 23:40:42 +0200
-Subject: [PATCH] src/compress.c: correct header define for xz/lzma
-
-Upstream-Status: Submitted [https://github.com/file/file/pull/98]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/compress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/compress.c b/src/compress.c
-index 67f21583..9670b72c 100644
---- a/src/compress.c
-+++ b/src/compress.c
-@@ -71,7 +71,7 @@ typedef void (*sig_t)(int);
- #include <bzlib.h>
- #endif
- 
--#if defined(HAVE_XZLIB_H) && defined(XZLIBSUPPORT)
-+#if defined(HAVE_LZMA_H) && defined(XZLIBSUPPORT)
- #define BUILTIN_XZLIB
- #include <lzma.h>
- #endif
--- 
-2.28.0
-
-- 
2.27.0


--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39af5806e0478b4721c86e2f2ed9691abbdb932c"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 20 Network 0 Missed 7 Current 641 (74% match, 98% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1530 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_fetch: Started
NOTE: recipe file-5.40-r0: task do_fetch: Succeeded
NOTE: Running task 1821 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_unpack)
NOTE: Running task 1822 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_unpack: Started
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_unpack: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2097 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_patch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.40-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2125 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic)
NOTE: recipe file-5.40-r0: task do_populate_lic: Started
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic unihash changed to 766a28ed0f3e5e1466487f68e8f8ad995b42e0a3ae57b78a08a6f22f7b3b4994
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2126 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_configure)
NOTE: recipe file-5.40-r0: task do_configure: Started
NOTE: recipe file-5.40-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_compile)
NOTE: recipe file-5.40-r0: task do_compile: Started
NOTE: recipe file-5.40-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_install)
NOTE: recipe file-5.40-r0: task do_install: Started
NOTE: recipe file-5.40-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package)
NOTE: Running task 2130 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot)
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.40-r0: task do_package: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.40-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata)
NOTE: recipe file-5.40-r0: task do_packagedata: Started
NOTE: recipe file-5.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2132 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_qa)
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2134 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_build)
NOTE: Tasks Summary: Attempted 2134 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-32 sysroot...done.
Removing 97 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39af5806e0478b4721c86e2f2ed9691abbdb932c"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 486 Local 478 Network 0 Missed 8 Current 193 (98% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 261 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 280 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 291 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 294 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 295 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 339 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 732 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_fetch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running setscene task 419 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running setscene task 424 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running setscene task 426 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_fetch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 982 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_unpack)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_patch: Started
NOTE: recipe file-5.40-r0: task do_patch: Succeeded
NOTE: Running task 1026 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 1027 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic)
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic unihash changed to 766a28ed0f3e5e1466487f68e8f8ad995b42e0a3ae57b78a08a6f22f7b3b4994
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2147 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_configure)
NOTE: recipe file-5.40-r0: task do_configure: Started
NOTE: recipe file-5.40-r0: task do_configure: Succeeded
NOTE: Running task 2148 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_compile)
NOTE: recipe file-5.40-r0: task do_compile: Started
NOTE: recipe file-5.40-r0: task do_compile: Succeeded
NOTE: Running task 2149 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_install)
NOTE: recipe file-5.40-r0: task do_install: Started
NOTE: recipe file-5.40-r0: task do_install: Succeeded
NOTE: Running task 2150 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package)
NOTE: Running task 2151 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot)
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.40-r0: task do_package: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.40-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata)
NOTE: recipe file-5.40-r0: task do_packagedata: Started
NOTE: recipe file-5.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm)
NOTE: Running task 2154 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_qa)
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2155 of 2155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_build)
NOTE: Tasks Summary: Attempted 2155 tasks of which 2140 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39af5806e0478b4721c86e2f2ed9691abbdb932c"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 20 Network 0 Missed 7 Current 641 (74% match, 98% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1530 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_fetch)
NOTE: recipe file-5.40-r0: task do_fetch: Started
NOTE: recipe file-5.40-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_unpack)
NOTE: Running task 1951 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_unpack: Started
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_patch)
NOTE: recipe file-5.40-r0: task do_patch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2099 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_populate_lic: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic unihash changed to 766a28ed0f3e5e1466487f68e8f8ad995b42e0a3ae57b78a08a6f22f7b3b4994
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2100 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.40-r0: task do_configure: Started
NOTE: recipe file-5.40-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_compile)
NOTE: recipe file-5.40-r0: task do_compile: Started
NOTE: recipe file-5.40-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_install)
NOTE: recipe file-5.40-r0: task do_install: Started
NOTE: recipe file-5.40-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package)
NOTE: Running task 2130 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot)
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.40-r0: task do_package: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.40-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata)
NOTE: recipe file-5.40-r0: task do_packagedata: Started
NOTE: recipe file-5.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2132 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_qa)
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2134 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_build)
NOTE: Tasks Summary: Attempted 2134 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39af5806e0478b4721c86e2f2ed9691abbdb932c"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 20 Network 0 Missed 7 Current 641 (74% match, 98% complete)
Removing 2 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 651 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1530 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 668 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_fetch: Started
NOTE: recipe file-5.40-r0: task do_fetch: Succeeded
NOTE: Running task 1917 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_unpack)
NOTE: Running task 1918 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_unpack: Started
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.40-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_patch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_patch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_patch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2098 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe file-5.40-r0: task do_populate_lic: Started
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_lic unihash changed to 766a28ed0f3e5e1466487f68e8f8ad995b42e0a3ae57b78a08a6f22f7b3b4994
NOTE: Setscene tasks completed
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2126 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_configure)
NOTE: recipe file-5.40-r0: task do_configure: Started
NOTE: recipe file-5.40-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_compile)
NOTE: recipe file-5.40-r0: task do_compile: Started
NOTE: recipe file-5.40-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_install)
NOTE: recipe file-5.40-r0: task do_install: Started
NOTE: recipe file-5.40-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package)
NOTE: Running task 2130 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot)
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.40-r0: task do_package: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.40-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata)
NOTE: recipe file-5.40-r0: task do_packagedata: Started
NOTE: recipe file-5.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2132 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm)
NOTE: Running task 2133 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_qa)
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Started
NOTE: recipe file-5.40-r0: task do_package_qa: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2134 of 2134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_build)
NOTE: Tasks Summary: Attempted 2134 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============2371359977747289584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/file/file-dbg: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-dbg: PKGSIZE changed from 576856 to 587064 (+2%)
packages/core2-32-poky-linux/file/file-dbg: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file-dev: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-dev: PKGSIZE changed from 5992 to 6027 (+1%)
packages/core2-32-poky-linux/file/file-dev: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file-doc: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-doc: PKGSIZE changed from 57206 to 57516 (+1%)
packages/core2-32-poky-linux/file/file-doc: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file-locale: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-locale: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file-src: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-src: PKGSIZE changed from 481150 to 487910 (+1%)
packages/core2-32-poky-linux/file/file-src: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file-staticdev: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file-staticdev: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file/file: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file/file: PKGSIZE changed from 6860141 to 7226409 (+5%)
packages/core2-32-poky-linux/file/file: PKGV changed from 5.39 [default] to 5.40 [default]
packages/core2-32-poky-linux/file: PV changed from "5.39" to "5.40"
packages/core2-32-poky-linux/file: SRC_URI changed from "git://github.com/file/file.git file://0001-src-compress.c-correct-header-define-for-xz-lzma.patch" to "git://github.com/file/file.git"
packages/core2-32-poky-linux/file: PKGV changed from 5.39 [default] to 5.40 [default]

--===============2371359977747289584==--
