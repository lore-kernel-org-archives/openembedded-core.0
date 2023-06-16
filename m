Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578EC2FC06
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.805.1686887482769896378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RbHRw3O7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c254427c-25462add-19a6-48b4-8b51-f9c6d272268a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EB/6H0y7tU95qJO4GdayDIO1kLoFRRraZetqdMCKtiw=;
	b=RbHRw3O7Ha7AKo6mwqX2UFinH4W9OoQOQIvOpwlGP4Z8F6xQaazquiiL2Vc5GzY+
	FSiRVAteqZVry5avy5Ahpg1tnHU2W5ysqklkOF4Cs2QPac8OqprpGcifIuGwxj5ULY7
	eCOvPpM7LdQcrP6nB4cI4QGY/E6XY2FOZeNK58NI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EB/6H0y7tU95qJO4GdayDIO1kLoFRRraZetqdMCKtiw=;
	b=LLsTRujNzsoA5idwOiq44h6dZqAASXXRzK5Dwn3vGXOlVHnlVn9qscBKMesyDMyU
	iFxkr+fypnMsPrC6mEnMSivEs13Skd6IHFwGEkOBIjyUiXr6j8QeZ2svhNNVzcQx46y
	o+VMEAupB2FYXiv8k1V8xX50EoTX3iHnUzkplZ+o=
Content-Type: multipart/mixed; boundary="===============2922170716694001409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39 FAILED
Message-ID: <01010188c254427c-25462add-19a6-48b4-8b51-f9c6d272268a-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182906

--===============2922170716694001409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.38.1-2.39.patch
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
From c495043a3537a9654048d946e4f7e5719aa43f96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 08:02:35 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.38.1 -> 2.39

---
 ...d_2.38.1.bb => util-linux-libuuid_2.39.bb} | 22 ++++++++
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++-
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 4 files changed, 25 insertions(+), 98 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.bb} (40%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
similarity index 40%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
index 5d759aed94..72db8f400f 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.licensing
+# +++ README.licensing
+# @@ -9,6 +9,8 @@
+#     * GPL-2.0            - GNU General Public License version 2
+#  
+#     * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
+# +
+# +   * BSD-2-Clause       - Simplified BSD License
+#  
+#     * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
+#  
+# 
+#
+
 # To allow util-linux to optionally build-depend on cryptsetup, libuuid is
 # split out of the main recipe, as it's needed by cryptsetup
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3868b1c41d..204ad020b9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -12,7 +12,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
                     file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-"
+                    "
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -35,8 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-check-for-sys-pidfd.h.patch \
-           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
-SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
+SRC_URI[sha256sum] = "32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
deleted file mode 100644
index 19f57f14bc..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 14:39:19 -0700
-Subject: [PATCH] check for sys/pidfd.h
-
-This header in newer glibc defines the signatures of functions
-pidfd_send_signal() and pidfd_open() and when these functions are
-defined by libc then we need to include the relevant header to get
-the definitions. Clang 15+ has started to error out when function
-signatures are missing.
-
-Fixes errors like
-misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 1 +
- include/pidfd-utils.h | 4 +++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a511e93de..fd7d9245f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
- 	sys/mkdev.h \
- 	sys/mount.h \
- 	sys/param.h \
-+	sys/pidfd.h \
- 	sys/prctl.h \
- 	sys/resource.h \
- 	sys/sendfile.h \
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index eddede976..d9e33cbc5 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -4,8 +4,10 @@
- #ifdef HAVE_SYS_SYSCALL_H
- # include <sys/syscall.h>
- # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
-+#  ifdef HAVE_SYS_PIDFD_H
-+#   include <sys/pidfd.h>
-+#  endif
- #  include <sys/types.h>
--
- #  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
deleted file mode 100644
index 00611fe578..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
-From: Mateusz Marciniec <mateuszmar2@gmail.com>
-Date: Fri, 19 Aug 2022 14:47:49 +0200
-Subject: [PATCH] configure.ac: Improve check for magic
-
-Check whether magic.h header exists before defining HAVE_MAGIC.
-
-Despite library availability there still can be missing header.
-Current test doesn't cover that possibility which will lead compilation
-to fail in case of separate sysroot.
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
-
-Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
-Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index daa8f0dca..968a0daf0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
- )
- AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
-   AC_CHECK_LIB([magic], [magic_open], [
--    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
--    MAGIC_LIBS="-lmagic"
-+    AC_CHECK_HEADER(magic.h, [
-+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
-+      MAGIC_LIBS="-lmagic"
-+    ])
-   ])
- ])
- AC_SUBST([MAGIC_LIBS])
--- 
-2.37.1
-
-- 
2.39.2


--===============2922170716694001409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7882df3f4f55101d7791eacdb3934e66b2767375"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 14 Mirrors 0 Missed 36 Current 154 (28% match, 82% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 12 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 172 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 173 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 178 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 179 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 180 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 184 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 259 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_fetch)
NOTE: Running task 415 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running noexec task 555 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_fetch)
NOTE: Running noexec task 582 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_fetch)
NOTE: Running task 583 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_fetch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 599 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Started
NOTE: Running task 600 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_unpack)
NOTE: Running task 601 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 602 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_fetch)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 614 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Succeeded
NOTE: Running task 615 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_unpack)
NOTE: Running task 616 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 200 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 617 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 618 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 202 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 622 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 623 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_patch: Succeeded
NOTE: Running task 624 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 625 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_patch: Started
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 626 tasks of which 607 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.38.1-r0/temp/log.do_fetch.3850896
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch) failed with exit code '1'

--===============2922170716694001409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.38.1-2.39.patch"

RnJvbSBjNDk1MDQzYTM1MzdhOTY1NDA0OGQ5NDZlNGY3ZTU3MTlhYTQzZjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDg6MDI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgMi4zOC4xIC0+IDIuMzkKCi0tLQogLi4uZF8yLjM4
LjEuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuYmJ9IHwgMjIgKysrKysrKysKIG1ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMgICB8ICA4ICsrLQogLi4uLzAw
MDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoICAgICAgICAgIHwgNTMgLS0tLS0tLS0tLS0t
LS0tLS0tLQogLi4uY29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoIHwg
NDAgLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgOTgg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRpbC1s
aW51eC1saWJ1dWlkXzIuMzguMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS5iYn0gKDQw
JSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jb25maWd1cmUu
YWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM4LjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LmJiCnNpbWlsYXJp
dHkgaW5kZXggNDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC1saWJ1dWlkXzIuMzguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS5iYgppbmRleCA1ZDc1OWFlZDk0Li43MmRi
OGY0MDBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgtbGlidXVpZF8yLjM4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gUkVBRE1FLmxpY2Vuc2luZworIyArKysgUkVBRE1FLmxpY2Vuc2luZworIyBAQCAt
OSw2ICs5LDggQEAKKyMgICAgICogR1BMLTIuMCAgICAgICAgICAgIC0gR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgdmVyc2lvbiAyCisjICAKKyMgICAgICogTEdQTC0yLjEtb3ItbGF0ZXIgIC0g
R05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIDIuMSBvciBhbnkgbGF0ZXIgdmVyc2lv
bgorIyArCisjICsgICAqIEJTRC0yLUNsYXVzZSAgICAgICAtIFNpbXBsaWZpZWQgQlNEIExpY2Vu
c2UKKyMgIAorIyAgICAgKiBCU0QtMy1DbGF1c2UgICAgICAgLSBCU0QgMy1DbGF1c2UgIk5ldyIg
b3IgIlJldmlzZWQiIExpY2Vuc2UKKyMgIAorIyAKKyMKKwogIyBUbyBhbGxvdyB1dGlsLWxpbnV4
IHRvIG9wdGlvbmFsbHkgYnVpbGQtZGVwZW5kIG9uIGNyeXB0c2V0dXAsIGxpYnV1aWQgaXMKICMg
c3BsaXQgb3V0IG9mIHRoZSBtYWluIHJlY2lwZSwgYXMgaXQncyBuZWVkZWQgYnkgY3J5cHRzZXR1
cAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwppbmRleCAz
ODY4YjFjNDFkLi4yMDRhZDAyMGI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgTElDRU5TRToke1BOfS1saWJmZGlzayA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlibW91bnQgPSAiTEdQTC0yLjEt
b3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYnNtYXJ0Y29scyA9ICJMR1BMLTIuMS1vci1sYXRl
ciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9MGZk
NWMwNTBjNjE4N2QyYmYwYTQ0OTJiN2Y0ZTMzZGEgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9MTJhZTc3NjhhNjVlYzhmMmU0NGQ5MzBkZjljYjQzZmEg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9jdW1lbnRh
dGlvbi9saWNlbnNlcy9DT1BZSU5HLkdQTC0yLjAtb3ItbGF0ZXI7bWQ1PWIyMzRlZTRkNjlmNWZj
ZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0RvY3VtZW50
YXRpb24vbGljZW5zZXMvQ09QWUlORy5MR1BMLTIuMS1vci1sYXRlcjttZDU9NGZiZDY1MzgwY2Rk
MjU1OTUxMDc5MDA4YjM2NDUxNmMgXApAQCAtMjMsNyArMjMsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0wZmQ1YzA1MGM2MTg3ZDJiZjBhNDQ5MmI3
ZjRlMzNkYQogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliYmxraWQvQ09QWUlORzttZDU9
NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNjMDQgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vbGliZmRpc2svQ09QWUlORzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNj
MDQgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGlic21hcnRjb2xzL0NPUFlJTkc7bWQ1
PTY5M2JjYmJlMTZkM2E0YTRiMzdiYzkwNmJjMDFjYzA0IFwKLSIKKyAgICAgICAgICAgICAgICAg
ICAgIgogCiBGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS91dGlsLWxpbnV4
OiIKIE1BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4n
KVswOjJdKX0iCkBAIC0zNSw4ICszNSw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9S
fS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAg
ICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vZGlzcGxheV90ZXN0
bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxl
bF90ZXN0cy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNoZWNrLWZvci1zeXMtcGlk
ZmQuaC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy1JbXByb3Zl
LWNoZWNrLWZvci1tYWdpYy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYwNDkyYTE5YjQ0ZTZjZjlhM2RkZmY2ODMyNWIzMzNiOGI1MmI2YzU5Y2UzZWJkNmEw
ZWNhYTRjNTExN2U4NGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJiMzBhMzM2Y2RhOTAzMTgy
ZWQ2MWZlYjNlOWI5MDhiNzYyYTVlNjZmZTE0ZTQzZWZiODhkMzcxNjIwNzVjYiIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNoZWNrLWZv
ci1zeXMtcGlkZmQuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMTlmNTdmMTRiYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw1MyArMCwwIEBACi1Gcm9tIDU0OGJjNTY4ZjNjNzM1ZTUzZmI1
YjBhNWFiNjQ3M2EzZjE0NTdiOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU3VuLCA3IEF1ZyAyMDIyIDE0OjM5OjE5
IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNoZWNrIGZvciBzeXMvcGlkZmQuaAotCi1UaGlzIGhl
YWRlciBpbiBuZXdlciBnbGliYyBkZWZpbmVzIHRoZSBzaWduYXR1cmVzIG9mIGZ1bmN0aW9ucwot
cGlkZmRfc2VuZF9zaWduYWwoKSBhbmQgcGlkZmRfb3BlbigpIGFuZCB3aGVuIHRoZXNlIGZ1bmN0
aW9ucyBhcmUKLWRlZmluZWQgYnkgbGliYyB0aGVuIHdlIG5lZWQgdG8gaW5jbHVkZSB0aGUgcmVs
ZXZhbnQgaGVhZGVyIHRvIGdldAotdGhlIGRlZmluaXRpb25zLiBDbGFuZyAxNSsgaGFzIHN0YXJ0
ZWQgdG8gZXJyb3Igb3V0IHdoZW4gZnVuY3Rpb24KLXNpZ25hdHVyZXMgYXJlIG1pc3NpbmcuCi0K
LUZpeGVzIGVycm9ycyBsaWtlCi1taXNjLXV0aWxzL2tpbGwuYzo0MDI6NjogZXJyb3I6IGNhbGwg
dG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAncGlkZmRfc2VuZF9zaWduYWwnOyBJU08gQzk5IGFuZCBs
YXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi0gICAgICAgIGlmIChwaWRmZF9zZW5kX3NpZ25h
bChwZmQsIGN0bC0+bnVtc2lnLCAmaW5mbywgMCkgPCAwKQotCi1VcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9wdWxsLzE3
NjldCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0g
Y29uZmlndXJlLmFjICAgICAgICAgIHwgMSArCi0gaW5jbHVkZS9waWRmZC11dGlscy5oIHwgNCAr
KystCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYTUxMWU5M2Rl
Li5mZDdkOTI0NWYgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5h
YwotQEAgLTM0Miw2ICszNDIsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsgXAotIAlzeXMvbWtkZXYu
aCBcCi0gCXN5cy9tb3VudC5oIFwKLSAJc3lzL3BhcmFtLmggXAotKwlzeXMvcGlkZmQuaCBcCi0g
CXN5cy9wcmN0bC5oIFwKLSAJc3lzL3Jlc291cmNlLmggXAotIAlzeXMvc2VuZGZpbGUuaCBcCi1k
aWZmIC0tZ2l0IGEvaW5jbHVkZS9waWRmZC11dGlscy5oIGIvaW5jbHVkZS9waWRmZC11dGlscy5o
Ci1pbmRleCBlZGRlZGU5NzYuLmQ5ZTMzY2JjNSAxMDA2NDQKLS0tLSBhL2luY2x1ZGUvcGlkZmQt
dXRpbHMuaAotKysrIGIvaW5jbHVkZS9waWRmZC11dGlscy5oCi1AQCAtNCw4ICs0LDEwIEBACi0g
I2lmZGVmIEhBVkVfU1lTX1NZU0NBTExfSAotICMgaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KLSAj
IGlmIGRlZmluZWQoU1lTX3BpZGZkX3NlbmRfc2lnbmFsKSAmJiBkZWZpbmVkKFNZU19waWRmZF9v
cGVuKQotKyMgIGlmZGVmIEhBVkVfU1lTX1BJREZEX0gKLSsjICAgaW5jbHVkZSA8c3lzL3BpZGZk
Lmg+Ci0rIyAgZW5kaWYKLSAjICBpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLS0KLSAjICBpZm5kZWYg
SEFWRV9QSURGRF9TRU5EX1NJR05BTAotIHN0YXRpYyBpbmxpbmUgaW50IHBpZGZkX3NlbmRfc2ln
bmFsKGludCBwaWRmZCwgaW50IHNpZywgc2lnaW5mb190ICppbmZvLAotIAkJCQkgICAgdW5zaWdu
ZWQgaW50IGZsYWdzKQotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2st
Zm9yLW1hZ2ljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDYxMWZlNTc4Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3VyZS5hYy1JbXBy
b3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQwICswLDAgQEAK
LUZyb20gMjYzMzgxZGRkNDZlZWEyMjkzYzcwYmM4MTEyNzNiNjZiYzUyMDg3YiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hdGV1c3ogTWFyY2luaWVjIDxtYXRldXN6bWFyMkBnbWFp
bC5jb20+Ci1EYXRlOiBGcmksIDE5IEF1ZyAyMDIyIDE0OjQ3OjQ5ICswMjAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGNvbmZpZ3VyZS5hYzogSW1wcm92ZSBjaGVjayBmb3IgbWFnaWMKLQotQ2hlY2sgd2hl
dGhlciBtYWdpYy5oIGhlYWRlciBleGlzdHMgYmVmb3JlIGRlZmluaW5nIEhBVkVfTUFHSUMuCi0K
LURlc3BpdGUgbGlicmFyeSBhdmFpbGFiaWxpdHkgdGhlcmUgc3RpbGwgY2FuIGJlIG1pc3Npbmcg
aGVhZGVyLgotQ3VycmVudCB0ZXN0IGRvZXNuJ3QgY292ZXIgdGhhdCBwb3NzaWJpbGl0eSB3aGlj
aCB3aWxsIGxlYWQgY29tcGlsYXRpb24KLXRvIGZhaWwgaW4gY2FzZSBvZiBzZXBhcmF0ZSBzeXNy
b290LgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1baHR0cHM6Ly9naXRodWIuY29tL3V0
aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMjYzMzgxZGRkNDZlZWEyMjkzYzcwYmM4MTEyNzNi
NjZiYzUyMDg3Yl0KLQotU2lnbmVkLW9mZi1ieTogTWF0ZXVzeiBNYXJjaW5pZWMgPG1hdGV1c3pt
YXIyQGdtYWlsLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFRvbWFzeiBEemllbmR6aWVsc2tpIDx0b21h
c3ouZHppZW5kemllbHNraUBnbWFpbC5jb20+Ci0tLS0KLSBjb25maWd1cmUuYWMgfCA2ICsrKyst
LQotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGRhYThmMGRjYS4u
OTY4YTBkYWYwIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1cmUuYWMK
LUBAIC0xNTcwLDggKzE1NzAsMTAgQEAgQUNfQVJHX1dJVEgoW2xpYm1hZ2ljXSwKLSApCi0gQVNf
SUYoW3Rlc3QgIngkd2l0aF9saWJtYWdpYyIgPSB4bm9dLCBbaGF2ZV9tYWdpYz1ub10sIFsKLSAg
IEFDX0NIRUNLX0xJQihbbWFnaWNdLCBbbWFnaWNfb3Blbl0sIFsKLS0gICAgQUNfREVGSU5FKFtI
QVZFX01BR0lDXSwgWzFdLCBbRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIGxpYm1hZ2ljIHBy
ZXNlbnQuXSkKLS0gICAgTUFHSUNfTElCUz0iLWxtYWdpYyIKLSsgICAgQUNfQ0hFQ0tfSEVBREVS
KG1hZ2ljLmgsIFsKLSsgICAgICBBQ19ERUZJTkUoW0hBVkVfTUFHSUNdLCBbMV0sIFtEZWZpbmUg
dG8gMSBpZiB5b3UgaGF2ZSB0aGUgbGlibWFnaWMgcHJlc2VudC5dKQotKyAgICAgIE1BR0lDX0xJ
QlM9Ii1sbWFnaWMiCi0rICAgIF0pCi0gICBdKQotIF0pCi0gQUNfU1VCU1QoW01BR0lDX0xJQlNd
KQotLS0gCi0yLjM3LjEKLQotLSAKMi4zOS4yCgo=

--===============2922170716694001409==--

