Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D58C27C41
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10497.1688227322901975789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PCoTXFH8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101891230987c-11fec469-0e2b-4ba0-9369-9d21b9527663-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kLouW9kH6sUo6Uz0pYMfEiD5vn22Str8iUy/56UYmyQ=;
	b=PCoTXFH8df/5OWqhDUApC/b9dQViuw+VlRFzkJGuBk9oW88VLNfjFvmAD1H2kocd
	epQKqlPnkHXXaBv9otah3O/Bl2vDORxfQaJPfvK4Jyp7N4z06ADf+LLl9ssJTclqxMU
	X/Iau6fjj0RU4TOJ3yyt+DDdH83DicpzgkMYSMx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kLouW9kH6sUo6Uz0pYMfEiD5vn22Str8iUy/56UYmyQ=;
	b=Fxpo1PiPoCJGvuFQj1WTF1mSm6DwWPhtX+pPIdQ14mAd4vp2pl4fFRU5KyPGkHGy
	gfWyi/RsW2/Asvz0JMB/CEQF2qH9V86NGYlS7QnFGbSryjIHPKntNhxVNyTDbmG83wo
	TClv1cdc2X3lMbEkyCcATUEGjIcHj8SeOR9uz+ak=
Content-Type: multipart/mixed; boundary="===============5396315785351379324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.1 FAILED
Message-ID: <010101891230987c-11fec469-0e2b-4ba0-9369-9d21b9527663-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183718

--===============5396315785351379324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.38.1-2.39.1.patch
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
From bd908d09e241ce3a08c037fd78bcd629b439799c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 08:28:40 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.38.1 -> 2.39.1

---
 ...2.38.1.bb => util-linux-libuuid_2.39.1.bb} | 22 ++++++++
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++-
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 4 files changed, 25 insertions(+), 98 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.1.bb} (40%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
similarity index 40%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
index 5d759aed94..72db8f400f 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
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
index 3868b1c41d..f1a89e7aa2 100644
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
+SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
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


--===============5396315785351379324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1784ce757e2c08f1e46f897e7801d8eeed68b91a"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 15 Mirrors 0 Missed 36 Current 153 (29% match, 82% complete)
Removing 12 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 172 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 177 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 178 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 179 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 259 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_fetch)
NOTE: Running task 415 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running noexec task 555 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_fetch)
NOTE: Running noexec task 582 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_fetch)
NOTE: Running task 583 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_fetch: Started
NOTE: Running task 599 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_fetch: Succeeded
NOTE: Running task 600 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_unpack)
NOTE: Running task 601 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 602 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_fetch)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 614 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_unpack: Started
NOTE: Running task 615 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_unpack)
NOTE: Running task 616 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 617 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 200 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 618 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 202 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 622 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 623 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Succeeded
NOTE: Running task 624 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 625 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_patch: Succeeded
NOTE: Running task 627 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_deploy_source_date_epoch)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 627 tasks of which 607 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.38.1-r0/temp/log.do_fetch.1204522
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch) failed with exit code '1'

--===============5396315785351379324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.38.1-2.39.1.patch"

RnJvbSBiZDkwOGQwOWUyNDFjZTNhMDhjMDM3ZmQ3OGJjZDYyOWI0Mzk3OTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAwODoyODo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjM4LjEgLT4gMi4zOS4xCgotLS0KIC4uLjIuMzgu
MS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4xLmJifSB8IDIyICsrKysrKysrCiBtZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgfCAgOCArKy0KIC4uLi8w
MDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaCAgICAgICAgICB8IDUzIC0tLS0tLS0tLS0t
LS0tLS0tLS0KIC4uLmNvbmZpZ3VyZS5hYy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaCB8
IDQwIC0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDk4
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgve3V0aWwt
bGludXgtbGlidXVpZF8yLjM4LjEuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMS5iYn0g
KDQwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2gKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jb25maWd1
cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM4LjEuYmIgYi9tZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA0MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LjEuYmIKaW5kZXggNWQ3NTlhZWQ5
NC4uNzJkYjhmNDAwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMS5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJ
WE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2Rl
dnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUg
TElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMg
dGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxl
OiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBj
aGFuZ2VzOgorIworIyAtLS0gUkVBRE1FLmxpY2Vuc2luZworIyArKysgUkVBRE1FLmxpY2Vuc2lu
ZworIyBAQCAtOSw2ICs5LDggQEAKKyMgICAgICogR1BMLTIuMCAgICAgICAgICAgIC0gR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyCisjICAKKyMgICAgICogTEdQTC0yLjEtb3It
bGF0ZXIgIC0gR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIDIuMSBvciBhbnkgbGF0
ZXIgdmVyc2lvbgorIyArCisjICsgICAqIEJTRC0yLUNsYXVzZSAgICAgICAtIFNpbXBsaWZpZWQg
QlNEIExpY2Vuc2UKKyMgIAorIyAgICAgKiBCU0QtMy1DbGF1c2UgICAgICAgLSBCU0QgMy1DbGF1
c2UgIk5ldyIgb3IgIlJldmlzZWQiIExpY2Vuc2UKKyMgIAorIyAKKyMKKwogIyBUbyBhbGxvdyB1
dGlsLWxpbnV4IHRvIG9wdGlvbmFsbHkgYnVpbGQtZGVwZW5kIG9uIGNyeXB0c2V0dXAsIGxpYnV1
aWQgaXMKICMgc3BsaXQgb3V0IG9mIHRoZSBtYWluIHJlY2lwZSwgYXMgaXQncyBuZWVkZWQgYnkg
Y3J5cHRzZXR1cAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4Lmlu
YwppbmRleCAzODY4YjFjNDFkLi5mMWE4OWU3YWEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgTElDRU5TRToke1BOfS1s
aWJmZGlzayA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlibW91bnQgPSAi
TEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYnNtYXJ0Y29scyA9ICJMR1BMLTIu
MS1vci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2lu
ZzttZDU9MGZkNWMwNTBjNjE4N2QyYmYwYTQ0OTJiN2Y0ZTMzZGEgXAorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9MTJhZTc3NjhhNjVlYzhmMmU0NGQ5MzBk
ZjljYjQzZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
RG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkdQTC0yLjAtb3ItbGF0ZXI7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0RvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5MR1BMLTIuMS1vci1sYXRlcjttZDU9NGZi
ZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXApAQCAtMjMsNyArMjMsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0wZmQ1YzA1MGM2MTg3ZDJi
ZjBhNDQ5MmI3ZjRlMzNkYQogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliYmxraWQvQ09Q
WUlORzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNjMDQgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vbGliZmRpc2svQ09QWUlORzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2Jj
OTA2YmMwMWNjMDQgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGlic21hcnRjb2xzL0NP
UFlJTkc7bWQ1PTY5M2JjYmJlMTZkM2E0YTRiMzdiYzkwNmJjMDFjYzA0IFwKLSIKKyAgICAgICAg
ICAgICAgICAgICAgIgogCiBGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS91
dGlsLWxpbnV4OiIKIE1BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJyku
c3BsaXQoJy4nKVswOjJdKX0iCkBAIC0zNSw4ICszNSw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxP
UkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwt
bGluCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vZGlz
cGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNoZWNrLWZv
ci1zeXMtcGlkZmQuaC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5h
Yy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjYwNDkyYTE5YjQ0ZTZjZjlhM2RkZmY2ODMyNWIzMzNiOGI1MmI2YzU5
Y2UzZWJkNmEwZWNhYTRjNTExN2U4NGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODkwYWU4ZmY4
MTAyNDdiZDE5ZTI3NGRmNzZlODM3MWQyMDJjZGEwMWFkMjc3NjgxYjBlYTg4ZWVhYTAwMjg2YiIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMTlmNTdmMTRiYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZk
LmgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1MyArMCwwIEBACi1Gcm9tIDU0OGJjNTY4ZjNj
NzM1ZTUzZmI1YjBhNWFiNjQ3M2EzZjE0NTdiOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU3VuLCA3IEF1ZyAyMDIy
IDE0OjM5OjE5IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNoZWNrIGZvciBzeXMvcGlkZmQuaAot
Ci1UaGlzIGhlYWRlciBpbiBuZXdlciBnbGliYyBkZWZpbmVzIHRoZSBzaWduYXR1cmVzIG9mIGZ1
bmN0aW9ucwotcGlkZmRfc2VuZF9zaWduYWwoKSBhbmQgcGlkZmRfb3BlbigpIGFuZCB3aGVuIHRo
ZXNlIGZ1bmN0aW9ucyBhcmUKLWRlZmluZWQgYnkgbGliYyB0aGVuIHdlIG5lZWQgdG8gaW5jbHVk
ZSB0aGUgcmVsZXZhbnQgaGVhZGVyIHRvIGdldAotdGhlIGRlZmluaXRpb25zLiBDbGFuZyAxNSsg
aGFzIHN0YXJ0ZWQgdG8gZXJyb3Igb3V0IHdoZW4gZnVuY3Rpb24KLXNpZ25hdHVyZXMgYXJlIG1p
c3NpbmcuCi0KLUZpeGVzIGVycm9ycyBsaWtlCi1taXNjLXV0aWxzL2tpbGwuYzo0MDI6NjogZXJy
b3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAncGlkZmRfc2VuZF9zaWduYWwnOyBJU08g
Qzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlv
bnMgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi0gICAgICAgIGlmIChwaWRmZF9z
ZW5kX3NpZ25hbChwZmQsIGN0bC0+bnVtc2lnLCAmaW5mbywgMCkgPCAwKQotCi1VcHN0cmVhbS1T
dGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51
eC9wdWxsLzE3NjldCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgotLS0tCi0gY29uZmlndXJlLmFjICAgICAgICAgIHwgMSArCi0gaW5jbHVkZS9waWRmZC11dGls
cy5oIHwgNCArKystCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXgg
YTUxMWU5M2RlLi5mZDdkOTI0NWYgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2Nv
bmZpZ3VyZS5hYwotQEAgLTM0Miw2ICszNDIsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsgXAotIAlz
eXMvbWtkZXYuaCBcCi0gCXN5cy9tb3VudC5oIFwKLSAJc3lzL3BhcmFtLmggXAotKwlzeXMvcGlk
ZmQuaCBcCi0gCXN5cy9wcmN0bC5oIFwKLSAJc3lzL3Jlc291cmNlLmggXAotIAlzeXMvc2VuZGZp
bGUuaCBcCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9waWRmZC11dGlscy5oIGIvaW5jbHVkZS9waWRm
ZC11dGlscy5oCi1pbmRleCBlZGRlZGU5NzYuLmQ5ZTMzY2JjNSAxMDA2NDQKLS0tLSBhL2luY2x1
ZGUvcGlkZmQtdXRpbHMuaAotKysrIGIvaW5jbHVkZS9waWRmZC11dGlscy5oCi1AQCAtNCw4ICs0
LDEwIEBACi0gI2lmZGVmIEhBVkVfU1lTX1NZU0NBTExfSAotICMgaW5jbHVkZSA8c3lzL3N5c2Nh
bGwuaD4KLSAjIGlmIGRlZmluZWQoU1lTX3BpZGZkX3NlbmRfc2lnbmFsKSAmJiBkZWZpbmVkKFNZ
U19waWRmZF9vcGVuKQotKyMgIGlmZGVmIEhBVkVfU1lTX1BJREZEX0gKLSsjICAgaW5jbHVkZSA8
c3lzL3BpZGZkLmg+Ci0rIyAgZW5kaWYKLSAjICBpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLS0KLSAj
ICBpZm5kZWYgSEFWRV9QSURGRF9TRU5EX1NJR05BTAotIHN0YXRpYyBpbmxpbmUgaW50IHBpZGZk
X3NlbmRfc2lnbmFsKGludCBwaWRmZCwgaW50IHNpZywgc2lnaW5mb190ICppbmZvLAotIAkJCQkg
ICAgdW5zaWduZWQgaW50IGZsYWdzKQotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJv
dmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDYxMWZlNTc4Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3Vy
ZS5hYy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQw
ICswLDAgQEAKLUZyb20gMjYzMzgxZGRkNDZlZWEyMjkzYzcwYmM4MTEyNzNiNjZiYzUyMDg3YiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hdGV1c3ogTWFyY2luaWVjIDxtYXRldXN6
bWFyMkBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDE5IEF1ZyAyMDIyIDE0OjQ3OjQ5ICswMjAwCi1T
dWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogSW1wcm92ZSBjaGVjayBmb3IgbWFnaWMKLQot
Q2hlY2sgd2hldGhlciBtYWdpYy5oIGhlYWRlciBleGlzdHMgYmVmb3JlIGRlZmluaW5nIEhBVkVf
TUFHSUMuCi0KLURlc3BpdGUgbGlicmFyeSBhdmFpbGFiaWxpdHkgdGhlcmUgc3RpbGwgY2FuIGJl
IG1pc3NpbmcgaGVhZGVyLgotQ3VycmVudCB0ZXN0IGRvZXNuJ3QgY292ZXIgdGhhdCBwb3NzaWJp
bGl0eSB3aGljaCB3aWxsIGxlYWQgY29tcGlsYXRpb24KLXRvIGZhaWwgaW4gY2FzZSBvZiBzZXBh
cmF0ZSBzeXNyb290LgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1baHR0cHM6Ly9naXRo
dWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMjYzMzgxZGRkNDZlZWEyMjkzYzcw
YmM4MTEyNzNiNjZiYzUyMDg3Yl0KLQotU2lnbmVkLW9mZi1ieTogTWF0ZXVzeiBNYXJjaW5pZWMg
PG1hdGV1c3ptYXIyQGdtYWlsLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFRvbWFzeiBEemllbmR6aWVs
c2tpIDx0b21hc3ouZHppZW5kemllbHNraUBnbWFpbC5jb20+Ci0tLS0KLSBjb25maWd1cmUuYWMg
fCA2ICsrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGRh
YThmMGRjYS4uOTY4YTBkYWYwIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25m
aWd1cmUuYWMKLUBAIC0xNTcwLDggKzE1NzAsMTAgQEAgQUNfQVJHX1dJVEgoW2xpYm1hZ2ljXSwK
LSApCi0gQVNfSUYoW3Rlc3QgIngkd2l0aF9saWJtYWdpYyIgPSB4bm9dLCBbaGF2ZV9tYWdpYz1u
b10sIFsKLSAgIEFDX0NIRUNLX0xJQihbbWFnaWNdLCBbbWFnaWNfb3Blbl0sIFsKLS0gICAgQUNf
REVGSU5FKFtIQVZFX01BR0lDXSwgWzFdLCBbRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIGxp
Ym1hZ2ljIHByZXNlbnQuXSkKLS0gICAgTUFHSUNfTElCUz0iLWxtYWdpYyIKLSsgICAgQUNfQ0hF
Q0tfSEVBREVSKG1hZ2ljLmgsIFsKLSsgICAgICBBQ19ERUZJTkUoW0hBVkVfTUFHSUNdLCBbMV0s
IFtEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgbGlibWFnaWMgcHJlc2VudC5dKQotKyAgICAg
IE1BR0lDX0xJQlM9Ii1sbWFnaWMiCi0rICAgIF0pCi0gICBdKQotIF0pCi0gQUNfU1VCU1QoW01B
R0lDX0xJQlNdKQotLS0gCi0yLjM3LjEKLQotLSAKMi4zOS4yCgo=

--===============5396315785351379324==--

