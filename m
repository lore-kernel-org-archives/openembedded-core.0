Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2062810ED64A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:09:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70396.1774613387447281019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EHyuRKQH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774613387; x=1806149387;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qUFoOXyTirGVCr/F2w6uLwX2IP3hLrXmlgEzFvPn6TE=;
  b=EHyuRKQHmkV8Hffsb7hgSq50hrgIDAaSpfm1QKUvD9TIo4v5XRiEmkCZ
   5nNT2rRK/UEtzw9tBYdrE0MZ7tKBBARxjWwNEDUjLoViF6NtDOKXgmwGR
   /9yg2ZYELN/iYSafvnEjq1z49dIv0BEmcGF7BOEXjcUBndcBlEpl+Xzti
   4yReq2RW6TBGSvRndV1/qq4sW5dLbmTKgYoCLl4i8zXYL+cdyA8Z3K3KA
   CgdqGkWLeOj/x4IpqId7pmy8F3AhH0oMx9hsD6kxOAhoEmb97CsxEmwBo
   GiQQnQNgMLx4mAJf2/PrAYX4wu1PcQ1LTRWTp1U3Cg86woIynkeA6pOtW
   A==;
X-CSE-ConnectionGUID: X75YvSnRQnqo5WBN/2V7Qg==
X-CSE-MsgGUID: 7N87eAFtTmeB2VMPnmB1gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="213660905"
X-IronPort-AV: E=Sophos;i="6.23,144,1770562800"; 
   d="scan'208";a="213660905"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:09:45 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 95FD27A75
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:09:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 436CAC00D46
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:09:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id BA788403B62;
	Fri, 27 Mar 2026 12:09:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.14.1 -> 2.15.0
Date: Fri, 27 Mar 2026 20:09:39 +0800
Message-ID: <20260327120939.1261-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234080

From: Wang Mingyu <wangmy@fujitsu.com>

disable-tests2.patch
refresshed for 2.15.0

0001-tests-do-not-strip-a-helper-library.patch
removed since it's not available in 2.15.0

0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
added to fix compile error when enable musl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t-musl-libc-and-fix-C-compilation-er.patch | 97 +++++++++++++++++++
 ...-tests-do-not-strip-a-helper-library.patch | 24 -----
 .../lttng/lttng-tools/disable-tests2.patch    | 22 +++--
 ...-tools_2.14.1.bb => lttng-tools_2.15.0.bb} | 11 ++-
 4 files changed, 117 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.14.1.bb => lttng-tools_2.15.0.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
new file mode 100644
index 0000000000..a3ac13c9fa
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
@@ -0,0 +1,97 @@
+From 18c8e9070bee05c4e205ea4885d62773bd5e3426 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Fri, 27 Mar 2026 11:37:11 +0000
+Subject: [PATCH] common: Autodetect musl libc and fix C++ compilation errors
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/172/changes/b50e5519cb98f02e52463a221e58ba80adb7c424]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ configure.ac           |  7 +++++++
+ src/common/poller.cpp  | 10 +++++++++-
+ src/common/timerfd.hpp | 12 +++++++++++-
+ 3 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5d5ff5a..375f8bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -181,6 +181,13 @@ AM_CONDITIONAL([HAVE_SHELLCHECK], [test "x$SHELLCHECK" != "x"])
+ AS_IF([test -f "$srcdir/bootstrap"], [in_git_repo=yes], [in_git_repo=no])
+ AM_CONDITIONAL([IN_GIT_REPO], [test "x$in_git_repo" = "xyes"])
+ 
++# Check for musl libc:
++case "${host_cpu}-${host_os}-${LIBC}" in
++  *-musl*)
++    AC_DEFINE([HAVE_MUSL_LIBC], [1], [Define to 1 if building against musl libc.])
++    ;;
++esac
++
+ # check for bison
+ AC_PROG_YACC
+ BISON=$YACC
+diff --git a/src/common/poller.cpp b/src/common/poller.cpp
+index 783d58f..500d3bb 100644
+--- a/src/common/poller.cpp
++++ b/src/common/poller.cpp
+@@ -7,6 +7,10 @@
+ #include <common/error.hpp>
+ #include <common/poller.hpp>
+ 
++#if defined(HAVE_MUSL_LIBC) && !defined(LTTNG_MUSL_EPOLL_CLOEXEC_REPLACEMENT)
++constexpr int LTTNG_MUSL_EPOLL_CLOEXEC_REPLACEMENT = EPOLL_CLOEXEC;
++#endif
++
+ namespace {
+ 
+ std::uint32_t to_epoll_events(lttng::poller::event_type events)
+@@ -58,7 +62,11 @@ lttng::poller::event_type from_epoll_events(std::uint32_t epoll_events)
+ 
+ lttng::poller::poller() :
+ 	_epoll_fd([]() {
++#if defined(HAVE_MUSL_LIBC)
++		const auto epoll_fd = ::epoll_create1(LTTNG_MUSL_EPOLL_CLOEXEC_REPLACEMENT);
++#else
+ 		const auto epoll_fd = ::epoll_create1(::EPOLL_CLOEXEC);
++#endif
+ 
+ 		if (epoll_fd < 0) {
+ 			LTTNG_THROW_POSIX("Failed to create epoll fd", errno);
+@@ -198,4 +206,4 @@ void lttng::poller::_epoll(int timeout) const
+ 
+ 		break;
+ 	}
+-}
+\ No newline at end of file
++}
+diff --git a/src/common/timerfd.hpp b/src/common/timerfd.hpp
+index 8ab2939..91d2029 100644
+--- a/src/common/timerfd.hpp
++++ b/src/common/timerfd.hpp
+@@ -14,12 +14,22 @@
+ #include <sys/timerfd.h>
+ #include <time.h>
+ 
++#if defined(HAVE_MUSL_LIBC) && !defined(LTTNG_MUSL_TFD_CLOEXEC_REPLACEMENT)
++constexpr int LTTNG_MUSL_TFD_CLOEXEC_REPLACEMENT = TFD_CLOEXEC;
++#endif
++
+ namespace lttng {
+ 
+ class timerfd : public stream_descriptor {
+ public:
+ 	/* Throws a posix_error exception on failure to create the underlying resource. */
+-	explicit timerfd(int flags = ::TFD_CLOEXEC);
++	explicit timerfd(int flags =
++#if defined(HAVE_MUSL_LIBC)
++		LTTNG_MUSL_TFD_CLOEXEC_REPLACEMENT
++#else
++		::TFD_CLOEXEC
++#endif
++	);
+ 	timerfd(const timerfd&) = delete;
+ 	timerfd& operator=(const timerfd&) = delete;
+ 	timerfd(timerfd&&) = delete;
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
deleted file mode 100644
index 0547f30c02..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a45157a50e14d4bd244a3dd05d79c5703c819550 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 16:52:07 +0100
-Subject: [PATCH] tests: do not strip a helper library
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/utils/testapp/userspace-probe-elf-binary/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-index 836f13e..e19a554 100644
---- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-+++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -14,7 +14,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
- libfoo.strip: libfoo.la
- 	$(OBJCOPY) --strip-all .libs/libfoo.so
- 
--all-local: libfoo.strip
-+all-local:
- 	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
- 		for script in $(EXTRA_DIST); do \
- 			cp -f $(srcdir)/$$script $(builddir); \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
index 5b9a07fcb8..f93d6cdc4f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests2.patch
@@ -5,24 +5,30 @@ now. Ideally tests.serial would have occasional output when running to show acti
 Upstream-Status: Inappropriate [workaround for slow tests]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: lttng-tools-2.14.0/tests/regression/Makefile.am
-===================================================================
---- lttng-tools-2.14.0.orig/tests/regression/Makefile.am
-+++ lttng-tools-2.14.0/tests/regression/Makefile.am
-@@ -26,7 +26,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+---
+ tests/regression/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
+index a7cd133..bd82e94 100644
+--- a/tests/regression/Makefile.am
++++ b/tests/regression/Makefile.am
+@@ -30,7 +30,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/tracefile-limits/test_tracefile_count \
  	tools/tracefile-limits/test_tracefile_size \
  	tools/exclusion/test_exclusion \
 -	tools/snapshots/test_kernel \
  	tools/snapshots/test_ust_fast \
+ 	tools/snapshots/test_ust_long \
  	tools/snapshots/test_ust_streaming \
- 	tools/snapshots/test_kernel_streaming \
-@@ -47,8 +46,6 @@ SERIAL_TESTS = tools/base-path/test_ust
+@@ -53,7 +52,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/rotation/test_schedule_api \
  	tools/metadata/test_kernel \
  	tools/working-directory/test_relayd_working_directory \
--	tools/clear/test_ust \
 -	tools/clear/test_kernel \
  	tools/clear/test_live_hang.py \
  	tools/tracker/test_event_tracker \
  	tools/trigger/start-stop/test_start_stop \
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
index 3a3f2cff2c..af71ab3ca5 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.0.bb
@@ -44,15 +44,15 @@ PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-           file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://disable-tests2.patch \
            file://libc++.patch \
+           file://0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch \
            "
 
-SRC_URI[sha256sum] = "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae6c32ba5c5b7c6d"
+SRC_URI[sha256sum] = "4d739116556da71d58275bc7f0a6c0a967c6774b7d90f02c2731a7875debf28a"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -76,6 +76,7 @@ FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 # Python module needs to keep _lttng.so
 INSANE_SKIP:${PN} = "libexec dev-so"
 INSANE_SKIP:${PN}-dbg = "libexec"
+INSANE_SKIP:${PN} = "already-stripped"
 
 PRIVATE_LIBS:${PN}-ptest = "libfoo.so"
 
@@ -95,7 +96,7 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.1.xsd \
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/session.xsd src/common/mi-lttng-4.2.xsd \
              tests/regression/tests.serial; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
@@ -140,8 +141,8 @@ do_install_ptest () {
         done
     done
 
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
-    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
-- 
2.43.0


