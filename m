Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D8AC2FC04
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.816.1686887482516053385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AbKUXP9L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c254416b-8c1bf31d-fd0e-483d-9b79-015ef030ff7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X47lsAHHUcluwuTE+LhegzGVX27u1EI7N2T2sRLC+rU=;
	b=AbKUXP9LJOXSbu0m90Q2Oiq68Vg5cePvEu9eWlpHlpheqVe/sj86H9Tt1mGF0qIP
	bTrYA60bdVM5XD74hgl0JOJDL59QhkCCNI8sEVZnluq+4ZjzhKK9DeHbz7B9N9DfznH
	CGtrh5i9JB85j6Utcq2ZqdoTaCmmoubljQE2y6TA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X47lsAHHUcluwuTE+LhegzGVX27u1EI7N2T2sRLC+rU=;
	b=jeHTVGphuCrBsO6XC2QLr3SIDQy9AvZGcCiTMrmMEKwSquHfgHMLvUjLwqOIJh0j
	4P3P9NNHSXZo418OZuQnLeT1VWwnQDo5m+cahf/M8LGEpnWPJwYoa1LiT5mU7DiioOJ
	QnjTcwhaNtqhq7tZiPQlIsRn7IitAmTa11RCSyg4=
Content-Type: multipart/mixed; boundary="===============0421432538345906959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.39 FAILED
Message-ID: <01010188c254416b-8c1bf31d-fd0e-483d-9b79-015ef030ff7d-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182901

--===============0421432538345906959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.39* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.38.1-2.39.patch
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
From 6e95cf5c28a8992f4649e8f7840963e0d79f4fe0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 08:04:42 +0000
Subject: [PATCH] util-linux: upgrade 2.38.1 -> 2.39

---
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++-
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 ...til-linux_2.38.1.bb => util-linux_2.39.bb} | 22 ++++++++
 4 files changed, 25 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
 rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.bb} (95%)

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
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.bb
similarity index 95%
rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.bb
index 9ea7a04e8a..e8f8a42dab 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.bb
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
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-- 
2.39.2


--===============0421432538345906959==
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
meta-yocto-bsp       = "tmp-auh-upgrades:f1000198171a86404a24d02a4eba13afd7beb8c9"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 480 Local 108 Mirrors 0 Missed 372 Current 260 (22% match, 49% complete)
Removing 92 stale sstate objects for arch qemux86...done.
Removing 46 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 96 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 288 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 310 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 335 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 446 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 453 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 558 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 604 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 612 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 624 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 628 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 740 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 707 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 708 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 709 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 728 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 197 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 265 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_patch)
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 340 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_patch: Started
NOTE: Running task 366 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 385 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 407 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 438 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 734 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_patch: Started
NOTE: Running task 478 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 500 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running setscene task 736 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: Running task 561 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_patch: Succeeded
NOTE: Running task 569 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running noexec task 578 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_configure)
NOTE: Running noexec task 579 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_compile)
NOTE: Running task 580 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 581 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 738 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: Running task 583 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-native-2.39-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 584 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe util-linux-native-2.39-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: Running setscene task 740 of 740 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 585 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 586 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_unpack)
NOTE: Running task 587 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_unpack)
NOTE: Running task 588 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 610 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 611 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: Running task 612 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_unpack)
NOTE: Running task 613 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_fetch)
NOTE: Running task 614 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 615 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 616 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_fetch)
NOTE: Running task 642 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_fetch)
NOTE: Running task 644 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 645 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 673 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 674 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 679 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_fetch)
NOTE: Running task 690 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 691 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 710 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_collect_spdx_deps)
NOTE: Running task 717 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 718 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 721 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 722 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 723 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: Running task 726 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 745 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_patch)
NOTE: Running task 746 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: Running task 772 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_fetch: Started
NOTE: Running task 778 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 781 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 782 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: Running task 785 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 791 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 792 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: Running task 803 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 804 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 805 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_fetch)
NOTE: Running task 807 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: Running task 808 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 809 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 810 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 811 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 812 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 813 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_fetch)
NOTE: Running task 821 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe util-linux-native-2.39-r0: task do_unpack: Started
NOTE: Running task 823 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.4-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 824 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: Running task 825 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 826 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 827 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libxml2-native-2.10.4-r0: task do_fetch: Started
NOTE: Running task 828 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 829 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: Running task 830 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_unpack)
NOTE: recipe util-linux-2.39-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 833 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: Running task 834 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 835 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 836 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe glibc-2.37-r1: task do_patch: Succeeded
NOTE: Running task 839 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 840 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: Running task 842 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe curl-8.1.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.39-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 845 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 846 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: Running task 849 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 851 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 852 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_unpack)
NOTE: recipe curl-8.1.2-r0: task do_patch: Succeeded
NOTE: Running task 853 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_fetch: Started
NOTE: Running task 855 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 856 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 859 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_unpack: Started
NOTE: Running task 860 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 862 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 863 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe perl-5.36.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: Running task 864 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 865 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 867 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 869 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 870 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: Running task 871 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_patch)
NOTE: Running task 872 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 875 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_unpack)
NOTE: Running task 876 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: Running task 879 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 880 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 883 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 886 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 889 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 890 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: Running task 891 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: Running task 892 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 894 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: Running task 896 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe libxml2-native-2.10.4-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe perl-5.36.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 898 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: Running task 899 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 900 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: Running task 904 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: Running task 907 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: Running task 908 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: Running task 909 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 910 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 911 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: Running task 912 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: Running task 914 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: Running task 917 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: Running task 919 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 923 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 924 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 934 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 935 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 936 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 937 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_patch)
NOTE: Running task 938 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: Running task 940 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 941 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: Running task 942 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: Running task 946 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 947 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: recipe elfutils-0.189-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 948 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 949 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: Running task 951 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 954 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: Running task 975 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: Running task 976 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 977 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 979 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: Running task 982 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_patch: Started
NOTE: Running task 983 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: Running task 993 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 994 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 995 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 996 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: Running task 1003 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: Running task 1009 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 1025 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: Running task 1029 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1030 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: Running task 1031 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1034 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: Running task 1035 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1039 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1044 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: Running task 1047 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: Running task 1048 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1054 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: Running task 1055 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1057 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1058 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: Running task 1080 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: Running task 1081 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1083 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: Running task 1085 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: Running task 1088 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: Running task 1089 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 1092 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 1093 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: Running task 1102 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 1104 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: Running task 1106 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: Running task 1110 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: Running task 1117 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: Running task 1119 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-native-2.39-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 1120 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1121 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: Running task 1124 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: Running task 1171 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_patch)
NOTE: Running task 1172 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1176 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_collect_spdx_deps: Started
NOTE: Running task 1180 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: Running task 1186 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe libxml2-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1193 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39-r0: task do_patch: Started
NOTE: Running task 1194 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe elfutils-0.189-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: Running task 1197 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1202 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe perl-5.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_patch)
NOTE: recipe libxml2-native-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1205 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 1206 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: Running task 1208 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: Running task 1209 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: Running task 1210 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1216 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.39-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 1217 of 2361 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1218 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: Running task 1219 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: Running task 1220 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: Running task 1221 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe perl-5.36.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: Running task 1223 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.10.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 1226 of 2361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_install: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Failed
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1230 tasks of which 998 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
Summary: There were 9 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.38.1-r0/temp/log.do_fetch.3910765
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.38.1-r0/temp/log.do_fetch.3911594
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'

--===============0421432538345906959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.38.1-2.39.patch"

RnJvbSA2ZTk1Y2Y1YzI4YTg5OTJmNDY0OWU4Zjc4NDA5NjNlMGQ3OWY0ZmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDg6MDQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiB1cGdyYWRlIDIuMzguMSAtPiAyLjM5CgotLS0KIG1ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMgICB8ICA4ICsrLQogLi4uLzAwMDEtY2hlY2stZm9y
LXN5cy1waWRmZC5oLnBhdGNoICAgICAgICAgIHwgNTMgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
Y29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoIHwgNDAgLS0tLS0tLS0t
LS0tLS0KIC4uLnRpbC1saW51eF8yLjM4LjEuYmIgPT4gdXRpbC1saW51eF8yLjM5LmJifSB8IDIy
ICsrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDk4IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3Vy
ZS5hYy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgve3V0aWwtbGludXhfMi4zOC4xLmJiID0+IHV0aWwtbGludXhfMi4zOS5i
Yn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwpp
bmRleCAzODY4YjFjNDFkLi4yMDRhZDAyMGI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgTElDRU5TRToke1BOfS1saWJm
ZGlzayA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlibW91bnQgPSAiTEdQ
TC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYnNtYXJ0Y29scyA9ICJMR1BMLTIuMS1v
ci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZztt
ZDU9MGZkNWMwNTBjNjE4N2QyYmYwYTQ0OTJiN2Y0ZTMzZGEgXAorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9MTJhZTc3NjhhNjVlYzhmMmU0NGQ5MzBkZjlj
YjQzZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2
OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9j
dW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkdQTC0yLjAtb3ItbGF0ZXI7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0Rv
Y3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5MR1BMLTIuMS1vci1sYXRlcjttZDU9NGZiZDY1
MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXApAQCAtMjMsNyArMjMsNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0wZmQ1YzA1MGM2MTg3ZDJiZjBh
NDQ5MmI3ZjRlMzNkYQogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliYmxraWQvQ09QWUlO
RzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNjMDQgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vbGliZmRpc2svQ09QWUlORzttZDU9NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2
YmMwMWNjMDQgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGlic21hcnRjb2xzL0NPUFlJ
Tkc7bWQ1PTY5M2JjYmJlMTZkM2E0YTRiMzdiYzkwNmJjMDFjYzA0IFwKLSIKKyAgICAgICAgICAg
ICAgICAgICAgIgogCiBGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS91dGls
LWxpbnV4OiIKIE1BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3Bs
aXQoJy4nKVswOjJdKX0iCkBAIC0zNSw4ICszNSw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdf
TUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGlu
CiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vZGlzcGxh
eV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9w
YXJhbGxlbF90ZXN0cy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNoZWNrLWZvci1z
eXMtcGlkZmQuaC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy1J
bXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjYwNDkyYTE5YjQ0ZTZjZjlhM2RkZmY2ODMyNWIzMzNiOGI1MmI2YzU5Y2Uz
ZWJkNmEwZWNhYTRjNTExN2U4NGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzJiMzBhMzM2Y2Rh
OTAzMTgyZWQ2MWZlYjNlOWI5MDhiNzYyYTVlNjZmZTE0ZTQzZWZiODhkMzcxNjIwNzVjYiIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNo
ZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaApkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMTlmNTdmMTRiYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1MyArMCwwIEBACi1Gcm9tIDU0OGJjNTY4ZjNjNzM1
ZTUzZmI1YjBhNWFiNjQ3M2EzZjE0NTdiOTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU3VuLCA3IEF1ZyAyMDIyIDE0
OjM5OjE5IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNoZWNrIGZvciBzeXMvcGlkZmQuaAotCi1U
aGlzIGhlYWRlciBpbiBuZXdlciBnbGliYyBkZWZpbmVzIHRoZSBzaWduYXR1cmVzIG9mIGZ1bmN0
aW9ucwotcGlkZmRfc2VuZF9zaWduYWwoKSBhbmQgcGlkZmRfb3BlbigpIGFuZCB3aGVuIHRoZXNl
IGZ1bmN0aW9ucyBhcmUKLWRlZmluZWQgYnkgbGliYyB0aGVuIHdlIG5lZWQgdG8gaW5jbHVkZSB0
aGUgcmVsZXZhbnQgaGVhZGVyIHRvIGdldAotdGhlIGRlZmluaXRpb25zLiBDbGFuZyAxNSsgaGFz
IHN0YXJ0ZWQgdG8gZXJyb3Igb3V0IHdoZW4gZnVuY3Rpb24KLXNpZ25hdHVyZXMgYXJlIG1pc3Np
bmcuCi0KLUZpeGVzIGVycm9ycyBsaWtlCi1taXNjLXV0aWxzL2tpbGwuYzo0MDI6NjogZXJyb3I6
IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAncGlkZmRfc2VuZF9zaWduYWwnOyBJU08gQzk5
IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMg
Wy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi0gICAgICAgIGlmIChwaWRmZF9zZW5k
X3NpZ25hbChwZmQsIGN0bC0+bnVtc2lnLCAmaW5mbywgMCkgPCAwKQotCi1VcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9w
dWxsLzE3NjldCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
LS0tCi0gY29uZmlndXJlLmFjICAgICAgICAgIHwgMSArCi0gaW5jbHVkZS9waWRmZC11dGlscy5o
IHwgNCArKystCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYTUx
MWU5M2RlLi5mZDdkOTI0NWYgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZp
Z3VyZS5hYwotQEAgLTM0Miw2ICszNDIsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsgXAotIAlzeXMv
bWtkZXYuaCBcCi0gCXN5cy9tb3VudC5oIFwKLSAJc3lzL3BhcmFtLmggXAotKwlzeXMvcGlkZmQu
aCBcCi0gCXN5cy9wcmN0bC5oIFwKLSAJc3lzL3Jlc291cmNlLmggXAotIAlzeXMvc2VuZGZpbGUu
aCBcCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9waWRmZC11dGlscy5oIGIvaW5jbHVkZS9waWRmZC11
dGlscy5oCi1pbmRleCBlZGRlZGU5NzYuLmQ5ZTMzY2JjNSAxMDA2NDQKLS0tLSBhL2luY2x1ZGUv
cGlkZmQtdXRpbHMuaAotKysrIGIvaW5jbHVkZS9waWRmZC11dGlscy5oCi1AQCAtNCw4ICs0LDEw
IEBACi0gI2lmZGVmIEhBVkVfU1lTX1NZU0NBTExfSAotICMgaW5jbHVkZSA8c3lzL3N5c2NhbGwu
aD4KLSAjIGlmIGRlZmluZWQoU1lTX3BpZGZkX3NlbmRfc2lnbmFsKSAmJiBkZWZpbmVkKFNZU19w
aWRmZF9vcGVuKQotKyMgIGlmZGVmIEhBVkVfU1lTX1BJREZEX0gKLSsjICAgaW5jbHVkZSA8c3lz
L3BpZGZkLmg+Ci0rIyAgZW5kaWYKLSAjICBpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLS0KLSAjICBp
Zm5kZWYgSEFWRV9QSURGRF9TRU5EX1NJR05BTAotIHN0YXRpYyBpbmxpbmUgaW50IHBpZGZkX3Nl
bmRfc2lnbmFsKGludCBwaWRmZCwgaW50IHNpZywgc2lnaW5mb190ICppbmZvLAotIAkJCQkgICAg
dW5zaWduZWQgaW50IGZsYWdzKQotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUt
Y2hlY2stZm9yLW1hZ2ljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDYxMWZlNTc4Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3VyZS5h
Yy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQwICsw
LDAgQEAKLUZyb20gMjYzMzgxZGRkNDZlZWEyMjkzYzcwYmM4MTEyNzNiNjZiYzUyMDg3YiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hdGV1c3ogTWFyY2luaWVjIDxtYXRldXN6bWFy
MkBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDE5IEF1ZyAyMDIyIDE0OjQ3OjQ5ICswMjAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogSW1wcm92ZSBjaGVjayBmb3IgbWFnaWMKLQotQ2hl
Y2sgd2hldGhlciBtYWdpYy5oIGhlYWRlciBleGlzdHMgYmVmb3JlIGRlZmluaW5nIEhBVkVfTUFH
SUMuCi0KLURlc3BpdGUgbGlicmFyeSBhdmFpbGFiaWxpdHkgdGhlcmUgc3RpbGwgY2FuIGJlIG1p
c3NpbmcgaGVhZGVyLgotQ3VycmVudCB0ZXN0IGRvZXNuJ3QgY292ZXIgdGhhdCBwb3NzaWJpbGl0
eSB3aGljaCB3aWxsIGxlYWQgY29tcGlsYXRpb24KLXRvIGZhaWwgaW4gY2FzZSBvZiBzZXBhcmF0
ZSBzeXNyb290LgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1baHR0cHM6Ly9naXRodWIu
Y29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMjYzMzgxZGRkNDZlZWEyMjkzYzcwYmM4
MTEyNzNiNjZiYzUyMDg3Yl0KLQotU2lnbmVkLW9mZi1ieTogTWF0ZXVzeiBNYXJjaW5pZWMgPG1h
dGV1c3ptYXIyQGdtYWlsLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFRvbWFzeiBEemllbmR6aWVsc2tp
IDx0b21hc3ouZHppZW5kemllbHNraUBnbWFpbC5jb20+Ci0tLS0KLSBjb25maWd1cmUuYWMgfCA2
ICsrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGRhYThm
MGRjYS4uOTY4YTBkYWYwIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1
cmUuYWMKLUBAIC0xNTcwLDggKzE1NzAsMTAgQEAgQUNfQVJHX1dJVEgoW2xpYm1hZ2ljXSwKLSAp
Ci0gQVNfSUYoW3Rlc3QgIngkd2l0aF9saWJtYWdpYyIgPSB4bm9dLCBbaGF2ZV9tYWdpYz1ub10s
IFsKLSAgIEFDX0NIRUNLX0xJQihbbWFnaWNdLCBbbWFnaWNfb3Blbl0sIFsKLS0gICAgQUNfREVG
SU5FKFtIQVZFX01BR0lDXSwgWzFdLCBbRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIGxpYm1h
Z2ljIHByZXNlbnQuXSkKLS0gICAgTUFHSUNfTElCUz0iLWxtYWdpYyIKLSsgICAgQUNfQ0hFQ0tf
SEVBREVSKG1hZ2ljLmgsIFsKLSsgICAgICBBQ19ERUZJTkUoW0hBVkVfTUFHSUNdLCBbMV0sIFtE
ZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgbGlibWFnaWMgcHJlc2VudC5dKQotKyAgICAgIE1B
R0lDX0xJQlM9Ii1sbWFnaWMiCi0rICAgIF0pCi0gICBdKQotIF0pCi0gQUNfU1VCU1QoW01BR0lD
X0xJQlNdKQotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4XzIuMzguMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eF8yLjM5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM4LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM5LmJiCmluZGV4IDll
YTdhMDRlOGEuLmU4ZjhhNDJkYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eF8yLjM4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4XzIuMzkuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIFJFQURNRS5saWNlbnNpbmcKKyMgKysrIFJFQURNRS5saWNlbnNpbmcKKyMgQEAgLTks
NiArOSw4IEBACisjICAgICAqIEdQTC0yLjAgICAgICAgICAgICAtIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIHZlcnNpb24gMgorIyAgCisjICAgICAqIExHUEwtMi4xLW9yLWxhdGVyICAtIEdO
VSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAyLjEgb3IgYW55IGxhdGVyIHZlcnNpb24K
KyMgKworIyArICAgKiBCU0QtMi1DbGF1c2UgICAgICAgLSBTaW1wbGlmaWVkIEJTRCBMaWNlbnNl
CisjICAKKyMgICAgICogQlNELTMtQ2xhdXNlICAgICAgIC0gQlNEIDMtQ2xhdXNlICJOZXciIG9y
ICJSZXZpc2VkIiBMaWNlbnNlCisjICAKKyMgCisjCisKIHJlcXVpcmUgdXRpbC1saW51eC5pbmMK
IAogI2d0ay1kb2MgaXMgbm90IGVuYWJsZWQgYXMgaXQgcmVxdWlyZXMgeG1sdG8gd2hpY2ggcmVx
dWlyZXMgdXRpbC1saW51eAotLSAKMi4zOS4yCgo=

--===============0421432538345906959==--

