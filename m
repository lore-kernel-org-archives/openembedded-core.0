Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C91C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:10:26 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8519.1751620222749632602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rAfjFoPE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751620224; x=1783156224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uM0lf7a7G+5CfxYMN+Ec4xgheG6wpsJTiIJPQctARbQ=;
  b=rAfjFoPEKWra+9WAc7GAsEI+dwxkmwMrxYJdD21xpaBqYi/aRMRwoXK5
   f//pNaDUGaBuLpmO7QhlWO6FQj7mPajMklLfRzrEuQFd2DWwpq2OIz90o
   DGHkt0kNQpiZWLaY2QJCGBMOfM1i4vw7AjGr7j3mZgVuGWGjD4QC4QApb
   A5tTh9rZwYp8g9atTSt9nRWS2gs2AQGKAZ8wobPkEWaPQEQPynqUoxuFF
   zYG6qGB5JlT1AT7jsvmmOk2+nkvQHZc3YeDLjqJXA+743CLspVCcEcK2R
   gXvowsx30QtN9vJn0pVOI42sSsY+FcEou2CCHYQ641QRvJjho4svDpS4/
   A==;
X-CSE-ConnectionGUID: KOgcSMafTL+ToON3opyQQw==
X-CSE-MsgGUID: +NPJaXqPQm2HWGerWk/vdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="192654230"
X-IronPort-AV: E=Sophos;i="6.16,286,1744038000"; 
   d="scan'208";a="192654230"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 18:10:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3803F1002BA9
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 09:10:21 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 7703618000E8
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 09:10:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B41CE5F1113
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 18:10:19 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 20C031A006C;
	Fri,  4 Jul 2025 17:10:19 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/3] lttng-tools: upgrade 2.13.15 -> 2.14.0
Date: Fri,  4 Jul 2025 17:10:09 +0800
Message-ID: <20250704091015.707-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250704091015.707-1-wangmy@fujitsu.com>
References: <20250704091015.707-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219908

From: Wang Mingyu <wangmy@fujitsu.com>

0001-compat-Define-off64_t-as-off_t-on-linux.patch
0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
removed since they're not available in 2.14.0

0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
removed since they're included in 2.14.0

disable-tests.patch
refreshed for 2.14.0

0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
added to fix do_package error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...troy-flush-fix-session-daemon-abort-.patch |   53 -
 ...pat-Define-off64_t-as-off_t-on-linux.patch |   86 --
 ...fails-to-compile-with-libxml2-2.14.0.patch |   55 -
 ...onstructor-change-rpath-to-libdir-li.patch |   41 +
 ...skip_kernel_test-to-check-root-user-.patch | 1243 -----------------
 .../lttng/lttng-tools/disable-tests.patch     |   11 +-
 ...tools_2.13.15.bb => lttng-tools_2.14.0.bb} |   13 +-
 7 files changed, 51 insertions(+), 1451 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.15.bb => lttng-tools_2.14.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
deleted file mode 100644
index e5c9677073..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ea47622987d0947af3e8f75d16d52e27ebd60166 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Mon, 25 Mar 2024 18:20:14 +0800
-Subject: [PATCH] Fix: rotation-destroy-flush: fix session daemon abort if no
- kernel module present
-
-Testing rotation-destroy-flush when no lttng kernel modules present, it would
-be failed with error message:
-
-  Error: Unable to load required module lttng-ring-buffer-client-discard
-  not ok 1 - Start session daemon
-  Failed test 'Start session daemon'
-  not ok 2 - Create session rotation_destroy_flush in -o /tmp/tmp.test_rot ...
-  ...
-
-This because test script that sets the LTTNG_ABORT_ON_ERROR environment
-variable. It's this environment variable that causes the sessiond to handle the
-kernel module loading failure as an abort rather than a warning.
-
-Using "check_skip_kernel_test" to detect whether the kernel module fails to
-load is expected or not. If the failure is expected, the script won't set that
-environment variable any more.
-
-Fixes: 3a174400
-("tests:add check_skip_kernel_test to check root user and lttng kernel modules")
-
-Submitted [https://review.lttng.org/c/lttng-tools/+/12155]
-Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/78f5b22de60c114c5c83410015a08bdd212edc0b]
-Change-Id: I371e9ba717613e2940186f710cf3cccd35baed6c
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- .../ust/rotation-destroy-flush/test_rotation_destroy_flush  | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
-index 8ef4f0d..e506b53 100755
---- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
-+++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
-@@ -23,11 +23,11 @@ SIZE_LIMIT=$PAGE_SIZE
- NR_ITER=10
- NUM_TESTS=$((15*$NR_ITER))
- 
--# Ensure the daemons invoke abort on error.
--export LTTNG_ABORT_ON_ERROR=1
--
- source $TESTDIR/utils/utils.sh
- 
-+# Ensure the daemons invoke abort on error.
-+check_skip_kernel_test || export LTTNG_ABORT_ON_ERROR=1
-+
- # MUST set TESTDIR before calling those functions
- function run_app()
- {
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
deleted file mode 100644
index e68feb2753..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From e5b2615aaad44a1c0d52da1469b28f99cfb12b5f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Tue, 17 Jan 2023 16:57:35 -0500
-Subject: [PATCH] compat: off64_t is not defined by musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This helps compile with latest musl, where off64_t is not defined unless
-_LARGEFILE64_SOURCE is defined. On glibc, _LARGEFILE64_SOURCE is defined
-if _GNU_SOURCE is defined, so the problem is only seen with musl.
-
-Since the project uses AC_SYS_LARGEFILE, which from the autoconf doc:
-"arrange for 64-bit file offsets, known as large-file support."
-
-As such, it is safe to assume off_t is 64-bit wide. This is checked by a
-static_assert to catch any platform where autoconf would let a 32-bit
-off_t slip.
-
-Submitted [https://review.lttng.org/c/lttng-tools/+/9268]
-Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/57fd993799a2b081c826f6fc8def32d28d526bfb]
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
----
- src/common/compat/compat-fcntl.c |  5 ++++-
- src/common/compat/fcntl.h        | 10 +++-------
- 2 files changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
-index 5c0bdc9..18bab0a 100644
---- a/src/common/compat/compat-fcntl.c
-+++ b/src/common/compat/compat-fcntl.c
-@@ -8,14 +8,17 @@
- #define _LGPL_SOURCE
- #include <common/compat/fcntl.h>
- #include <common/macros.h>
-+#include <common/bug.h>
-+#include <stdint.h>
- #include <unistd.h>
- 
- #ifdef __linux__
- 
- LTTNG_HIDDEN
--int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
-+int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
- 		unsigned int flags)
- {
-+	LTTNG_BUILD_BUG_ON(sizeof(off_t) != sizeof(int64_t));
- #ifdef HAVE_SYNC_FILE_RANGE
- 	return sync_file_range(fd, offset, nbytes, flags);
- #else
-diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
-index 5e566e5..93b22b7 100644
---- a/src/common/compat/fcntl.h
-+++ b/src/common/compat/fcntl.h
-@@ -13,16 +13,12 @@
- 
- #include <common/compat/errno.h>
- 
--#if (defined(__CYGWIN__))
--typedef long long off64_t;
--#endif
--
- #if (defined(__FreeBSD__) || defined(__sun__))
- typedef off64_t loff_t;
- #endif
- 
- #ifdef __linux__
--extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
-+extern int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
- 		unsigned int flags);
- #define lttng_sync_file_range(fd, offset, nbytes, flags) \
- 	compat_sync_file_range(fd, offset, nbytes, flags)
-@@ -37,8 +33,8 @@ extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
- #define SYNC_FILE_RANGE_WAIT_BEFORE   0
- #define SYNC_FILE_RANGE_WRITE         0
- 
--static inline int lttng_sync_file_range(int fd, off64_t offset,
--		off64_t nbytes, unsigned int flags)
-+static inline int lttng_sync_file_range(int fd, off_t offset,
-+		off_t nbytes, unsigned int flags)
- {
- 	return -ENOSYS;
- }
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
deleted file mode 100644
index 7c2b893731..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0b19e10a8a52fab0bfadbac5ce70f1b2d185a1d1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 May 2025 13:09:25 +0800
-Subject: [PATCH] fix lttng-tools fails to compile with libxml2 2.14.0+
-
-Description:
-| In file included from /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
-|                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
-| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
-|   173 |     } input XML_DEPRECATED_MEMBER;
-|       |       ^~~~~
-| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
-|   432 |         ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
-|       |               ^~~~~~~
-| At top level:
-| cc1: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics
-
-
-According to [1][2], the UTF-8 handler is
-```
-static xmlCharEncError
-UTF8ToUTF8(void *vctxt ATTRIBUTE_UNUSED,
-           unsigned char* out, int *outlen,
-           const unsigned char* in, int *inlen,
-           int flush ATTRIBUTE_UNUSED)
-```
-
-Update input.func with setting ATTRIBUTE_UNUSED params with NULL and 0
-
-[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/38f475072aefe032fff1dc058df3e56c1e7062fa
-[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/69b83bb68e2a8ed0013f80c51b9a358714b00c9a#478024cc18a2cc8dbaed34076e9775f6827f413d_2188_2201
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/170]
-Signed-off-by: Marko, Peter <Peter.Marko@siemens.com>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/common/config/session-config.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/config/session-config.c b/src/common/config/session-config.c
-index bb4e9fe..4042d34 100644
---- a/src/common/config/session-config.c
-+++ b/src/common/config/session-config.c
-@@ -429,7 +429,7 @@ static xmlChar *encode_string(const char *in_str)
- 		goto end;
- 	}
- 
--	ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
-+	ret = handler->input.func(NULL, out_str, &out_len, (const xmlChar *) in_str, &in_len, 0);
- 	if (ret < 0) {
- 		xmlFree(out_str);
- 		out_str = NULL;
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
new file mode 100644
index 0000000000..908078d2c4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
@@ -0,0 +1,41 @@
+From 0e10c994dd0c802536b633dd6004af58e4358109 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 3 Jul 2025 10:43:01 +0000
+Subject: [PATCH] gen-ust-events-constructor: change rpath to $libdir like
+ others do
+
+|userland@pumpkin3:/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/sources/lttng-tools-2.14.0/tests/utils/testapp$ grep -nr "rpath" */Makefile.am
+| gen-ust-events-constructor/Makefile.am:29:                         -rpath $(abs_builddir)
+| userspace-probe-elf-binary/Makefile.am:8:libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath $(libdir)
+| userspace-probe-sdt-binary/Makefile.am:25:libfoo_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
+| userspace-probe-sdt-binary/Makefile.am:31:libbar_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
+| userspace-probe-sdt-binary/Makefile.am:37:libzzz_la_LDFLAGS = -module -shared -avoid-version -rpath $(libdir)
+
+fix the issue that:
+| ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-c-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
+| ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-c-constructor-so contains bad RPATH /tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build/tests/utils/testapp/gen-ust-events-constructor [rpaths]
+| ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
+| ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-constructor-so contains bad RPATH /tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build/tests/utils/testapp/gen-ust-events-constructor [rpaths]
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/171]
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ tests/utils/testapp/gen-ust-events-constructor/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
+index 6c09cf5..3eb26fb 100644
+--- a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
++++ b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
+@@ -26,7 +26,7 @@ else
+ # Force the shared flag on the noinst libraries since they are
+ # only built static by default
+ FORCE_SHARED_LIB_OPTIONS = -module -shared -avoid-version \
+-			   -rpath $(abs_builddir)
++			   -rpath $(libdir)
+ 
+ noinst_LTLIBRARIES += libtp-so-provider.la libtp-so-define.la \
+ 	libtp-so_c-provider.la libtp-so_c-define.la
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
deleted file mode 100644
index cb2c763b51..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
+++ /dev/null
@@ -1,1243 +0,0 @@
-From 76976da4e01ce90923f61ba734e066faefb76beb Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Mon, 12 Feb 2024 09:23:54 -0500
-Subject: [PATCH] tests: add check_skip_kernel_test to check root user and
- lttng kernel modules
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The current tests will run both userspace and kernel testing. Some of
-use cases only use lttng for one kind of tracing on an embedded
-device (e.g. userspace), so in this scenario, the kernel modules might
-not install to target rootfs, the test cases would be fail and exit.
-
-Add LTTNG_TOOLS_DISABLE_KERNEL_TESTS to skip the lttng kernel features
-test, this flag can be set via "make":
-
-  make check LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1
-
-When this flag was set, all kernel related testcases would be marked as
-SKIP in result.
-
-Since the the LTTNG_TOOLS_DISABLE_KERNEL_TESTS was checked in function
-check_skip_kernel_test, lots of testcases also need to check root
-permission, so merging the root permission checking into
-check_skip_kernel_test.
-
-Upstream-Status: Backport from
-[https://git.lttng.org/?p=lttng-tools.git;a=commit;h=3a1744008331a0604479d3d7461f77056fad3a64]
-
-Change-Id: I49a1f642a9869c21a69e0186c296fd917bd7b525
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
----
- tests/destructive/metadata-regeneration       |  8 +----
- tests/perf/test_perf_raw.in                   |  8 +----
- tests/regression/kernel/test_all_events       |  8 +----
- tests/regression/kernel/test_callstack        |  8 +----
- tests/regression/kernel/test_channel          |  8 +----
- tests/regression/kernel/test_clock_override   |  8 +----
- tests/regression/kernel/test_event_basic      |  8 +----
- tests/regression/kernel/test_kernel_function  |  8 +----
- tests/regression/kernel/test_lttng_logger     |  8 +----
- tests/regression/kernel/test_ns_contexts      |  8 +----
- .../regression/kernel/test_ns_contexts_change |  9 +----
- .../kernel/test_rotation_destroy_flush        |  8 +----
- .../regression/kernel/test_select_poll_epoll  |  8 +----
- tests/regression/kernel/test_syscall          |  8 +----
- tests/regression/kernel/test_userspace_probe  |  8 +----
- tests/regression/tools/clear/test_kernel      |  8 +----
- .../tools/filtering/test_invalid_filter       |  8 +----
- .../tools/filtering/test_unsupported_op       |  8 +----
- .../tools/filtering/test_valid_filter         |  8 +----
- tests/regression/tools/health/test_health.sh  | 10 ++----
- tests/regression/tools/health/test_thread_ok  |  9 +----
- tests/regression/tools/live/test_kernel       | 10 +++---
- tests/regression/tools/live/test_lttng_kernel |  8 +----
- tests/regression/tools/metadata/test_kernel   |  8 +----
- .../test_notification_kernel_buffer_usage     | 36 +++++++++----------
- .../test_notification_kernel_capture          | 23 ++++++------
- .../test_notification_kernel_error            | 23 ++++++------
- .../test_notification_kernel_instrumentation  | 23 ++++++------
- .../test_notification_kernel_syscall          | 19 +++++-----
- .../test_notification_kernel_userspace_probe  | 20 +++++------
- .../notification/test_notification_multi_app  | 14 +++-----
- ...test_notification_notifier_discarded_count |  9 +++--
- .../tools/regen-metadata/test_kernel          |  8 +----
- .../tools/regen-statedump/test_kernel         |  8 +----
- tests/regression/tools/rotation/test_kernel   |  8 +----
- tests/regression/tools/snapshots/test_kernel  |  8 +----
- .../tools/snapshots/test_kernel_streaming     |  8 +----
- .../streaming/test_high_throughput_limits     |  8 +----
- tests/regression/tools/streaming/test_kernel  |  8 +----
- .../tools/tracker/test_event_tracker          |  8 +----
- .../tools/trigger/test_add_trigger_cli        | 12 ++-----
- .../tools/trigger/test_list_triggers_cli      | 26 +++++---------
- .../tools/wildcard/test_event_wildcard        |  8 +----
- .../test_relayd_working_directory             |  4 +--
- .../ust/namespaces/test_ns_contexts_change    |  7 +---
- tests/regression/ust/test_event_perf          |  8 +----
- tests/utils/utils.sh                          | 35 ++++++++++++++++++
- 47 files changed, 166 insertions(+), 363 deletions(-)
-
-diff --git a/tests/destructive/metadata-regeneration b/tests/destructive/metadata-regeneration
-index b81e7af..36b130d 100755
---- a/tests/destructive/metadata-regeneration
-+++ b/tests/destructive/metadata-regeneration
-@@ -185,19 +185,13 @@ function test_ust_streaming ()
- 	rm -f ${file_sync_before_last}
- }
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
- if ! destructive_tests_enabled ; then
- 	echo 'You need to set the LTTNG_ENABLE_DESTRUCTIVE_TESTS to "will-break-my-system" as argument to run this test'
- 	echo 'Moreover, please make sure that ntp is not running while executing this test'
- 	exit 0
- fi
- 
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	start_lttng_relayd "-o $TRACE_PATH"
- 	start_lttng_sessiond
-diff --git a/tests/perf/test_perf_raw.in b/tests/perf/test_perf_raw.in
-index f293ccd..d35529a 100644
---- a/tests/perf/test_perf_raw.in
-+++ b/tests/perf/test_perf_raw.in
-@@ -137,12 +137,6 @@ function test_kernel_raw()
- 	rm -rf $TRACE_PATH
- }
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
- 
-@@ -154,7 +148,7 @@ have_libpfm
- 
- test_ust_raw
- 
--skip $isroot "Root access is needed for kernel testing, skipping." 9 ||
-+check_skip_kernel_test 9 ||
- {
- 	modprobe lttng-test
- 	test_kernel_raw
-diff --git a/tests/regression/kernel/test_all_events b/tests/regression/kernel/test_all_events
-index 2e20888..044f9b6 100755
---- a/tests/regression/kernel/test_all_events
-+++ b/tests/regression/kernel/test_all_events
-@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_callstack b/tests/regression/kernel/test_callstack
-index a4477fd..d8d6b5e 100755
---- a/tests/regression/kernel/test_callstack
-+++ b/tests/regression/kernel/test_callstack
-@@ -134,13 +134,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_channel b/tests/regression/kernel/test_channel
-index 9cc74c4..4c377bd 100755
---- a/tests/regression/kernel/test_channel
-+++ b/tests/regression/kernel/test_channel
-@@ -47,13 +47,7 @@ function test_channel_buffer_too_large()
- plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	start_lttng_sessiond
- 
-diff --git a/tests/regression/kernel/test_clock_override b/tests/regression/kernel/test_clock_override
-index 7289289..48a3f92 100755
---- a/tests/regression/kernel/test_clock_override
-+++ b/tests/regression/kernel/test_clock_override
-@@ -172,13 +172,7 @@ TESTS=(
- TEST_COUNT=${#TESTS[@]}
- i=0
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	trap signal_cleanup SIGTERM SIGINT
-diff --git a/tests/regression/kernel/test_event_basic b/tests/regression/kernel/test_event_basic
-index ac9ec05..387e2f7 100755
---- a/tests/regression/kernel/test_event_basic
-+++ b/tests/regression/kernel/test_event_basic
-@@ -73,13 +73,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_kernel_function b/tests/regression/kernel/test_kernel_function
-index b1d5491..ea16cde 100755
---- a/tests/regression/kernel/test_kernel_function
-+++ b/tests/regression/kernel/test_kernel_function
-@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	start_lttng_sessiond_notap
- 	validate_lttng_modules_present
-diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regression/kernel/test_lttng_logger
-index b8f7ded..00eaae8 100755
---- a/tests/regression/kernel/test_lttng_logger
-+++ b/tests/regression/kernel/test_lttng_logger
-@@ -110,13 +110,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression/kernel/test_ns_contexts
-index 7d447bc..1c71ea5 100755
---- a/tests/regression/kernel/test_ns_contexts
-+++ b/tests/regression/kernel/test_ns_contexts
-@@ -108,13 +108,7 @@ plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
- 
- 
--isroot=0
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
--
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
- 
- system_has_ns=0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/regression/kernel/test_ns_contexts_change
-index 42a6127..3f5e4ee 100755
---- a/tests/regression/kernel/test_ns_contexts_change
-+++ b/tests/regression/kernel/test_ns_contexts_change
-@@ -162,14 +162,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--
--isroot=0
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
--
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
- 
- system_has_ns=0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests/regression/kernel/test_rotation_destroy_flush
-index cb773d7..0af514b 100755
---- a/tests/regression/kernel/test_rotation_destroy_flush
-+++ b/tests/regression/kernel/test_rotation_destroy_flush
-@@ -120,13 +120,7 @@ TESTS=(
- TEST_COUNT=${#TESTS[@]}
- i=0
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	trap signal_cleanup SIGTERM SIGINT
-diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regression/kernel/test_select_poll_epoll
-index d8245a0..20f0ef0 100755
---- a/tests/regression/kernel/test_select_poll_epoll
-+++ b/tests/regression/kernel/test_select_poll_epoll
-@@ -374,13 +374,7 @@ if test $? != 0; then
- 	exit 0
- fi
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 
-diff --git a/tests/regression/kernel/test_syscall b/tests/regression/kernel/test_syscall
-index 401a18a..219d947 100755
---- a/tests/regression/kernel/test_syscall
-+++ b/tests/regression/kernel/test_syscall
-@@ -664,13 +664,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regression/kernel/test_userspace_probe
-index 1091ee6..5d984d6 100755
---- a/tests/regression/kernel/test_userspace_probe
-+++ b/tests/regression/kernel/test_userspace_probe
-@@ -815,13 +815,7 @@ fi
- plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression/tools/clear/test_kernel
-index 06fb1c3..48250a7 100755
---- a/tests/regression/tools/clear/test_kernel
-+++ b/tests/regression/tools/clear/test_kernel
-@@ -536,12 +536,6 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
- streaming_tests=(test_kernel_streaming
- 	test_kernel_streaming_rotate_clear
- 	test_kernel_streaming_clear_rotate
-@@ -563,7 +557,7 @@ snapshot_tests=(test_kernel_streaming_snapshot
- 	test_kernel_local_snapshot
- )
- 
--skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping kernel streaming tests." ||
- {
- 	trap signal_cleanup SIGTERM SIGINT
- 
-diff --git a/tests/regression/tools/filtering/test_invalid_filter b/tests/regression/tools/filtering/test_invalid_filter
-index 7d9e524..8435e55 100755
---- a/tests/regression/tools/filtering/test_invalid_filter
-+++ b/tests/regression/tools/filtering/test_invalid_filter
-@@ -168,13 +168,7 @@ done
- 
- test_bytecode_limit -u
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel invalid filter tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel invalid filter tests." ||
- {
- 	diag "Test kernel filters"
- 	i=0
-diff --git a/tests/regression/tools/filtering/test_unsupported_op b/tests/regression/tools/filtering/test_unsupported_op
-index 299247a..91eb86d 100755
---- a/tests/regression/tools/filtering/test_unsupported_op
-+++ b/tests/regression/tools/filtering/test_unsupported_op
-@@ -103,13 +103,7 @@ while [ "$i" -lt "$OP_COUNT" ]; do
- 	let "i++"
- done
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel unsupported filter operations tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test $NUM_KERNEL_TESTS "Skipping kernel unsupported filter operations tests." ||
- {
- 	diag "Test kernel unsupported filter operations"
- 
-diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/regression/tools/filtering/test_valid_filter
-index e76ffa2..1ba7c79 100755
---- a/tests/regression/tools/filtering/test_valid_filter
-+++ b/tests/regression/tools/filtering/test_valid_filter
-@@ -1452,13 +1452,7 @@ KERNEL_FILTERS=(
- 
- IFS=$OLDIFS
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel valid filter tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel valid filter tests." ||
- {
- 	diag "Test kernel valid filters"
- 
-diff --git a/tests/regression/tools/health/test_health.sh b/tests/regression/tools/health/test_health.sh
-index b3d6419..68716e6 100644
---- a/tests/regression/tools/health/test_health.sh
-+++ b/tests/regression/tools/health/test_health.sh
-@@ -82,7 +82,7 @@ function test_health
- 		diag "With UST consumer daemons"
- 		enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
- 
--		skip $isroot "Root access is needed. Skipping kernel consumer health check test." "1" ||
-+		check_skip_kernel_test "1" "Skipping kernel consumer health check test." ||
- 		{
- 			diag "With kernel consumer daemon"
- 			lttng_enable_kernel_event $SESSION_NAME $KERNEL_EVENT_NAME $CHANNEL_NAME
-@@ -113,7 +113,7 @@ function test_health
- 
- 
- 	if [ ${test_needs_root} -eq 1 ]; then
--		skip ${isroot} "Root access needed for test \"${test_thread_name}\"." "1" ||
-+		check_skip_kernel_test "1" "Skipping \"${test_thread_name}\"." ||
- 		{
- 			report_errors "${test_thread_error_string}" "${test_relayd}"
- 		}
-@@ -276,12 +276,6 @@ STDERR_PATH=$(mktemp --tmpdir tmp.test_health_stderr_path.XXXXXX)
- TRACE_PATH=$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
- HEALTH_PATH=$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
- THREAD_COUNT=${#THREAD[@]}
- i=0
- while [ "$i" -lt "$THREAD_COUNT" ]; do
-diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regression/tools/health/test_thread_ok
-index e84adb6..e5e2354 100755
---- a/tests/regression/tools/health/test_thread_ok
-+++ b/tests/regression/tools/health/test_thread_ok
-@@ -67,7 +67,7 @@ function test_thread_ok
- 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
- 	report_errors
- 
--	skip $isroot "Root access is needed. Skipping kernel consumer health check test." "5" ||
-+	check_skip_kernel_test "5" "Skipping kernel consumer health check test." ||
- 	{
- 		diag "With kernel consumer daemon"
- 		create_lttng_session_no_output $SESSION_NAME
-@@ -115,13 +115,6 @@ STDERR_PATH=$(mktemp --tmpdir tmp.test_thread_ok_stderr_path.XXXXXX)
- TRACE_PATH=$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
- HEALTH_PATH=$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
- 
--# The manage kernel thread is only spawned if we are root
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
- test_thread_ok
- 
- rm -rf ${HEALTH_PATH}
-diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/tools/live/test_kernel
-index b622b52..fdaa09f 100755
---- a/tests/regression/tools/live/test_kernel
-+++ b/tests/regression/tools/live/test_kernel
-@@ -39,13 +39,11 @@ function clean_live_tracing()
- 	rm -rf $TRACE_PATH
- }
- 
--# Need root access for kernel tracing.
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	plan_skip_all "Root access is needed. Skipping all tests."
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
- 	exit 0
--fi
-+}
- 
- modprobe lttng-test
- 
-diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regression/tools/live/test_lttng_kernel
-index a23d937..1b93364 100755
---- a/tests/regression/tools/live/test_lttng_kernel
-+++ b/tests/regression/tools/live/test_lttng_kernel
-@@ -45,13 +45,7 @@ function clean_live_tracing()
- }
- 
- # Need root access for kernel tracing.
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	modprobe lttng-test
- 
-diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regression/tools/metadata/test_kernel
-index 57cace6..26e95d9 100755
---- a/tests/regression/tools/metadata/test_kernel
-+++ b/tests/regression/tools/metadata/test_kernel
-@@ -91,13 +91,7 @@ plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
- 
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel metadata tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping kernel metadata tests." ||
- {
- 	validate_lttng_modules_present
- 	modprobe lttng-test
-diff --git a/tests/regression/tools/notification/test_notification_kernel_buffer_usage b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
-index 76e69a7..8fdaabb 100755
---- a/tests/regression/tools/notification/test_notification_kernel_buffer_usage
-+++ b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
-@@ -60,29 +60,27 @@ function test_buffer_usage_notification
- 	wait $APP_PID 2> /dev/null
- }
- 
--if [ "$(id -u)" == "0" ]; then
--
--	validate_lttng_modules_present
--
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	rm -rf "$TEST_TMPDIR"
-+	exit 0
-+}
- 
--	modprobe lttng-test
-+validate_lttng_modules_present
- 
--	# Used on sessiond launch.
--	LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
--		CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
--		LD_PRELOAD=${TESTPOINT}"
--	start_lttng_sessiond_notap
-+modprobe lttng-test
- 
--	test_buffer_usage_notification
-+# Used on sessiond launch.
-+LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
-+	CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
-+	LD_PRELOAD=${TESTPOINT}"
-+start_lttng_sessiond_notap
- 
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_buffer_usage_notification
- 
--	rm -rf "${consumerd_pipe[@]}" 2> /dev/null
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
- 
-+rm -rf "${consumerd_pipe[@]}" 2> /dev/null
- rm -rf "$TEST_TMPDIR"
-diff --git a/tests/regression/tools/notification/test_notification_kernel_capture b/tests/regression/tools/notification/test_notification_kernel_capture
-index 88f123d..0f8a2bc 100755
---- a/tests/regression/tools/notification/test_notification_kernel_capture
-+++ b/tests/regression/tools/notification/test_notification_kernel_capture
-@@ -31,22 +31,21 @@ function test_basic_error_path
- }
- 
- 
--if [ "$(id -u)" == "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
- 
--	modprobe lttng-test
-+validate_lttng_modules_present
- 
--	start_lttng_sessiond_notap
-+modprobe lttng-test
- 
--	test_basic_error_path
-+start_lttng_sessiond_notap
- 
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_basic_error_path
- 
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
- 
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kernel_error b/tests/regression/tools/notification/test_notification_kernel_error
-index 80fe6e5..b757ec2 100755
---- a/tests/regression/tools/notification/test_notification_kernel_error
-+++ b/tests/regression/tools/notification/test_notification_kernel_error
-@@ -30,23 +30,22 @@ function test_basic_error_path
- 	wait $APP_PID 2> /dev/null
- }
- 
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
- 
--if [ "$(id -u)" == "0" ]; then
--	validate_lttng_modules_present
-+validate_lttng_modules_present
- 
--	modprobe lttng-test
-+modprobe lttng-test
- 
--	start_lttng_sessiond_notap
-+start_lttng_sessiond_notap
- 
--	test_basic_error_path
-+test_basic_error_path
- 
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
- 
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
- 
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kernel_instrumentation b/tests/regression/tools/notification/test_notification_kernel_instrumentation
-index 90545a5..705f770 100755
---- a/tests/regression/tools/notification/test_notification_kernel_instrumentation
-+++ b/tests/regression/tools/notification/test_notification_kernel_instrumentation
-@@ -28,22 +28,21 @@ function test_kernel_instrumentation_notification
- 	wait $APP_PID 2> /dev/null
- }
- 
--if [ "$(id -u)" == "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
- 
--	modprobe lttng-test
-+validate_lttng_modules_present
- 
--	start_lttng_sessiond_notap
-+modprobe lttng-test
- 
--	test_kernel_instrumentation_notification
-+start_lttng_sessiond_notap
- 
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_kernel_instrumentation_notification
- 
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
- 
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kernel_syscall b/tests/regression/tools/notification/test_notification_kernel_syscall
-index d273cb5..7fa2353 100755
---- a/tests/regression/tools/notification/test_notification_kernel_syscall
-+++ b/tests/regression/tools/notification/test_notification_kernel_syscall
-@@ -31,19 +31,18 @@ function test_kernel_syscall_notification
- 	wait $APP_PID 2> /dev/null
- }
- 
--if [ "$(id -u)" == "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
- 
--	start_lttng_sessiond_notap
-+validate_lttng_modules_present
- 
--	test_kernel_syscall_notification
-+start_lttng_sessiond_notap
- 
--	stop_lttng_sessiond_notap
-+test_kernel_syscall_notification
- 
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
- 
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kernel_userspace_probe b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
-index 8ef8d70..abddd9b 100755
---- a/tests/regression/tools/notification/test_notification_kernel_userspace_probe
-+++ b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
-@@ -29,18 +29,18 @@ function test_kernel_userspace_probe_notification
- 	wait $APP_PID 2> /dev/null
- }
- 
--if [ "$(id -u)" == "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-+
-+validate_lttng_modules_present
- 
--	start_lttng_sessiond_notap
-+start_lttng_sessiond_notap
- 
--	test_kernel_userspace_probe_notification
-+test_kernel_userspace_probe_notification
- 
--	stop_lttng_sessiond_notap
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
- 
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
-index d8b6392..61891b5 100755
---- a/tests/regression/tools/notification/test_notification_multi_app
-+++ b/tests/regression/tools/notification/test_notification_multi_app
-@@ -411,22 +411,18 @@ function test_on_register_evaluation ()
- 	rm -rf "$output_dir"
- }
- 
--
- TESTS=(
- 	test_multi_app_ust
- 	test_on_register_evaluation_ust
- )
- 
--if [ "$(id -u)" == "0" ]; then
-+check_skip_kernel_test "$NUM_TEST_KERNEL" "Skipping kernel multi-app notification tests." || {
- 	validate_lttng_modules_present
- 	TESTS+=(
--	test_multi_app_kernel
--	test_on_register_evaluation_kernel
--)
--else
--        skip 0 "Root access is needed. Skipping all kernel multi-app notification tests." $NUM_TEST_KERNEL
--fi
--
-+		test_multi_app_kernel
-+		test_on_register_evaluation_kernel
-+	)
-+}
- 
- for fct_test in ${TESTS[@]};
- do
-diff --git a/tests/regression/tools/notification/test_notification_notifier_discarded_count b/tests/regression/tools/notification/test_notification_notifier_discarded_count
-index 9850b49..778d37d 100755
---- a/tests/regression/tools/notification/test_notification_notifier_discarded_count
-+++ b/tests/regression/tools/notification/test_notification_notifier_discarded_count
-@@ -376,7 +376,8 @@ function test_ust_notifier_discarded_regardless_trigger_owner
- test_ust_notifier_discarded_count
- test_ust_notifier_discarded_count_max_bucket
- 
--if [ "$(id -u)" == "0" ]; then
-+check_skip_kernel_test "$KERNEL_NUM_TESTS" "Skipping kernel notification tests." ||
-+{
- 
- 	validate_lttng_modules_present
- 
-@@ -398,9 +399,7 @@ if [ "$(id -u)" == "0" ]; then
- 	modprobe --remove lttng-test
- 
- 	rm -rf "${sessiond_pipe[@]}" 2> /dev/null
--else
--	# Kernel tests are skipped.
--	skip 0 "Root access is needed. Skipping all kernel notification tests." $KERNEL_NUM_TESTS
--fi
-+
-+}
- 
- rm -rf "$TEST_TMPDIR"
-diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/regression/tools/regen-metadata/test_kernel
-index 49eea32..555a4e2 100755
---- a/tests/regression/tools/regen-metadata/test_kernel
-+++ b/tests/regression/tools/regen-metadata/test_kernel
-@@ -99,13 +99,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 
-diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/regression/tools/regen-statedump/test_kernel
-index 8a26135..bbbac39 100755
---- a/tests/regression/tools/regen-statedump/test_kernel
-+++ b/tests/regression/tools/regen-statedump/test_kernel
-@@ -39,13 +39,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regression/tools/rotation/test_kernel
-index f5f1f55..efe3fd3 100755
---- a/tests/regression/tools/rotation/test_kernel
-+++ b/tests/regression/tools/rotation/test_kernel
-@@ -82,13 +82,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 
-diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regression/tools/snapshots/test_kernel
-index abb2435..d918768 100755
---- a/tests/regression/tools/snapshots/test_kernel
-+++ b/tests/regression/tools/snapshots/test_kernel
-@@ -217,13 +217,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel snapshot tests" $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 
- 	validate_lttng_modules_present
-diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/tests/regression/tools/snapshots/test_kernel_streaming
-index 0c92dc7..dd965af 100755
---- a/tests/regression/tools/snapshots/test_kernel_streaming
-+++ b/tests/regression/tools/snapshots/test_kernel_streaming
-@@ -145,13 +145,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming tests" $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 
-diff --git a/tests/regression/tools/streaming/test_high_throughput_limits b/tests/regression/tools/streaming/test_high_throughput_limits
-index 2b9e3ad..c55d510 100755
---- a/tests/regression/tools/streaming/test_high_throughput_limits
-+++ b/tests/regression/tools/streaming/test_high_throughput_limits
-@@ -170,13 +170,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed to set bandwith limits. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 
- 	# Catch sigint and try to cleanup limits
-diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regression/tools/streaming/test_kernel
-index 3333422..113eea7 100755
---- a/tests/regression/tools/streaming/test_kernel
-+++ b/tests/regression/tools/streaming/test_kernel
-@@ -47,13 +47,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 
-diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
-index cc0f698..de0c79d 100755
---- a/tests/regression/tools/tracker/test_event_tracker
-+++ b/tests/regression/tools/tracker/test_event_tracker
-@@ -466,13 +466,7 @@ test_event_track_untrack ust 0 "${EVENT_NAME}" "--pid --all"	# backward compat
- test_event_tracker ust 1 "${EVENT_NAME}" "--pid --all"	# backward compat
- test_event_pid_tracker ust 1 "${EVENT_NAME}"
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel tracker tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel tracker tests." ||
- {
- 	diag "Test kernel tracker"
- 
-diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests/regression/tools/trigger/test_add_trigger_cli
-index 98ecf62..d1763aa 100755
---- a/tests/regression/tools/trigger/test_add_trigger_cli
-+++ b/tests/regression/tools/trigger/test_add_trigger_cli
-@@ -34,12 +34,6 @@ tmp_stdout=$(mktemp --tmpdir -t test_parse_cli_trigger_stdout.XXXXXX)
- tmp_stderr=$(mktemp --tmpdir -t test_parse_cli_trigger_stderr.XXXXXX)
- uprobe_elf_binary="${TESTDIR}/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary"
- 
--if [ "$(id -u)" == "0" ]; then
--	ist_root=1
--else
--	ist_root=0
--fi
--
- function test_success ()
- {
- 	local test_name="$1"
-@@ -223,7 +217,7 @@ test_success "--exclude-name two" "trigger5" \
- 	--condition event-rule-matches --type=user --name='jean-*' --exclude-name jean-chretien -x jean-charest \
- 	--action notify
- 
--skip $ist_root "non-root user: skipping kprobe tests" 18 || {
-+check_skip_kernel_test 18 "Skipping kprobe tests." || {
- 	i=0
- 
- 	for type in kprobe kernel:kprobe; do
-@@ -262,7 +256,7 @@ skip $ist_root "non-root user: skipping kprobe tests" 18 || {
- 	done
- }
- 
--skip $ist_root "non-root user: skipping uprobe tests" 6 || {
-+check_skip_kernel_test 6 "Skipping uprobe tests." || {
- 	test_success "--condition event-rule-matches uprobe" "uprobe-trigger-0" \
- 		--name="uprobe-trigger-0" \
- 		--condition event-rule-matches --type=kernel:uprobe --location=${uprobe_elf_binary}:test_function --event-name=ma-probe \
-@@ -274,7 +268,7 @@ skip $ist_root "non-root user: skipping uprobe tests" 6 || {
- 		--action notify
- }
- 
--skip $ist_root "non-root user: skipping syscall tests" 30 || {
-+check_skip_kernel_test 30 "Skipping syscall tests." || {
- 	test_success "--condition event-rule-matches one syscall" "syscall-trigger-0" \
- 		--name="syscall-trigger-0" \
- 		--condition event-rule-matches --type=syscall --name=open \
-diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tests/regression/tools/trigger/test_list_triggers_cli
-index 2574e15..652a08c 100755
---- a/tests/regression/tools/trigger/test_list_triggers_cli
-+++ b/tests/regression/tools/trigger/test_list_triggers_cli
-@@ -36,22 +36,12 @@ uprobe_sdt_binary=$(realpath "${TESTDIR}/utils/testapp/userspace-probe-sdt-binar
- register_some_triggers_bin=$(realpath "${CURDIR}/utils/register-some-triggers")
- 
- uid=$(id --user)
--gid=$(id --group)
- 
--if [ "$uid" == "0" ]; then
--	ist_root=1
--	ls "$uprobe_sdt_binary" >/dev/null 2>&1
--	if test $? == 0; then
--		hast_sdt_binary=1
--	else
--		hast_sdt_binary=0
--	fi
--else
--	ist_root=0
--	hast_sdt_binary=0
-+sdt_binary_present=0
-+if [ -f "$uprobe_sdt_binary" ]; then
-+	sdt_binary_present=1
- fi
- 
--
- test_top_level_options ()
- {
- 	diag "Listing top level options"
-@@ -2695,10 +2685,12 @@ start_lttng_sessiond_notap
- 
- test_top_level_options
- test_event_rule_matches_tracepoint
--skip $ist_root "non-root user: skipping kprobe tests" 13 || test_event_rule_matches_probe
--skip $ist_root "non-root user: skipping uprobe tests" 9 || test_event_rule_matches_userspace_probe_elf
--skip $(($ist_root && $hast_sdt_binary)) "skipping userspace probe SDT tests" 9 || test_event_rule_matches_userspace_probe_sdt
--skip $ist_root "non-root user: skipping syscall tests" 17 || test_event_rule_matches_syscall
-+check_skip_kernel_test 48 "Skipping kprobe, uprobe, SDT and syscall tests." || {
-+	test_event_rule_matches_probe
-+	test_event_rule_matches_userspace_probe_elf
-+	skip $sdt_binary_present "No SDT binary. Skipping userspace probe SDT tests" 9 || test_event_rule_matches_userspace_probe_sdt
-+	test_event_rule_matches_syscall
-+}
- test_session_consumed_size_condition
- test_buffer_usage_conditions
- test_session_rotation_conditions
-diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests/regression/tools/wildcard/test_event_wildcard
-index f69baff..14d9bb8 100755
---- a/tests/regression/tools/wildcard/test_event_wildcard
-+++ b/tests/regression/tools/wildcard/test_event_wildcard
-@@ -124,13 +124,7 @@ test_event_wildcard ust 1 'tp*tptest'
- test_event_wildcard ust 1 'tp**tptest'
- test_event_wildcard ust 1 'tp*test'
- 
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--else
--	isroot=0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel wildcard tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel wildcard tests." ||
- {
- 	diag "Test kernel wildcards"
- 
-diff --git a/tests/regression/tools/working-directory/test_relayd_working_directory b/tests/regression/tools/working-directory/test_relayd_working_directory
-index c7e784c..6bd1e50 100755
---- a/tests/regression/tools/working-directory/test_relayd_working_directory
-+++ b/tests/regression/tools/working-directory/test_relayd_working_directory
-@@ -145,9 +145,9 @@ function test_relayd_debug_permission()
- 	diag "Test lttng-relayd change working directory on non writable directory"
- 
- 	if [ "$(id -u)" == "0" ]; then
--	    is_user=0
-+		is_user=0
- 	else
--	    is_user=1
-+		is_user=1
- 	fi
- 
- 	skip $is_user "Skipping permission debug output test; operation can't fail as root" 6 ||
-diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
-index 8a4b62c..622241f 100755
---- a/tests/regression/ust/namespaces/test_ns_contexts_change
-+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
-@@ -101,12 +101,7 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--isroot=0
--if [ "$(id -u)" == "0" ]; then
--	isroot=1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
- 
- system_has_ns=0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/ust/test_event_perf b/tests/regression/ust/test_event_perf
-index 33aab29..178959a 100755
---- a/tests/regression/ust/test_event_perf
-+++ b/tests/regression/ust/test_event_perf
-@@ -119,17 +119,11 @@ plan_tests $NUM_TESTS
- 
- print_test_banner "$TEST_DESC"
- 
--if [ "$(id -u)" == "0" ]; then
--        isroot=1
--else
--        isroot=0
--fi
--
- start_lttng_sessiond
- 
- test_parsing_raw
- 
--skip $isroot "Root access is needed. Skipping UST perf tests." 8 ||
-+check_skip_kernel_test 8 "Skipping UST perf tests." ||
- {
- 	test_event_basic
- }
-diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index 35633fa..b6783ef 100644
---- a/tests/utils/utils.sh
-+++ b/tests/utils/utils.sh
-@@ -329,6 +329,41 @@ function conf_proc_count()
- 	echo
- }
- 
-+# Usage:
-+# check_skip_kernel_test [NB_TESTS] [SKIP_MESSAGE]
-+# Return 0 if LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set or the current user is not a root user
-+# If NB_TESTS is set, call skip() to skip number of tests.
-+# If NB_TESTS is empty, just output a reason with diag.
-+# An optional message can be added.
-+
-+function check_skip_kernel_test ()
-+{
-+	local num_tests="$1"
-+	local skip_message="$2"
-+
-+	# Check for skip test kernel flag
-+	if [ "$LTTNG_TOOLS_DISABLE_KERNEL_TESTS" == "1" ]; then
-+		if ! test -z "$num_tests"; then
-+			skip 0 "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${skip_message}" "$num_tests"
-+		else
-+			diag "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${skip_message}"
-+		fi
-+		return 0
-+	fi
-+
-+	# Check if we are running as root
-+	if [ "$(id -u)" != "0" ]; then
-+		if ! test -z "$num_tests"; then
-+			skip 0 "Root access is needed for kernel testing.${skip_message+ }${skip_message}" "$num_tests"
-+		else
-+			diag "Root access is needed for kernel testing.${skip_message+ }${skip_message}"
-+		fi
-+		return 0
-+	fi
-+
-+	return 1
-+}
-+
- # Check if base lttng-modules are present.
- # Bail out on failure
- function validate_lttng_modules_present ()
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index b8971a69de..baed27abaf 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -18,12 +18,12 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 12 deletions(-)
 
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index e556223..756fb98 100644
+index 7076488..e5be904 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -29,18 +29,6 @@ TESTS = tools/base-path/test_ust \
- 	tools/crash/test_crash \
+@@ -40,18 +40,6 @@ SERIAL_TESTS = tools/base-path/test_ust \
  	tools/regen-metadata/test_ust \
+ 	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
 -	tools/notification/test_notification_ust_error \
 -	tools/notification/test_notification_ust_buffer_usage \
@@ -39,4 +39,7 @@ index e556223..756fb98 100644
 -	tools/notification/test_notification_multi_app \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
- 	tools/rotation/test_save_load_mi \
+ 	tools/rotation/test_ust_kernel \
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index f39404afa0..79ffebcad0 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
 
 include lttng-platforms.inc
 
-DEPENDS = "liburcu popt libxml2 util-linux bison-native"
+DEPENDS = "liburcu popt libxml2 util-linux bison-native babeltrace2"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
 RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils"
@@ -36,13 +36,10 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
-           file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
-           file://0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch \
-           file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
-           file://0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch \
+           file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
            "
 
-SRC_URI[sha256sum] = "96ea42351ee112c19dad9fdc7aae93b583d9f1722b2175664a381d2d337703c4"
+SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -84,10 +81,6 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-4.1.xsd; do
-        install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
-    done
-
     # Patch in the correct path for the custom libraries a helper executable needs
     sed -i -e 's!FIXMEPTESTPATH!${PTEST_PATH}!g' "${D}${PTEST_PATH}/run-ptest"
 
-- 
2.43.0


