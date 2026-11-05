Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28004.1793856908843037859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IrwOhC2X;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=90918; q=dns/txt;
  s=iport01; t=1793856908; x=1795066508;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dg4ODKmL54FCY9H5aP4kDtf9SlQslE0qIfXj41T9Ubo=;
  b=IrwOhC2XYT78VH6xRn29dEMA8eQd9fxOA5Cu1y2oWnKB/m5kRDwi6Brd
   ql6vVlrs6pPCozTfWirkRRGLyE7AVRv+OVFBOkNI/P+QR8YzI3KQb0T7f
   n6hvpJBGjJblrU/Su7mhrkFIDTeEwuV4Sc1U5DnNZHdhlXWKsfZJourcX
   C6EWnVBS17MELPeIFG8RFCnRLPqHwdv0qOFBXoJDyKN/w+YOs/hxDhu8T
   +1mPoOqNKP3enxpY3fMfryaPaDCtSZOgDP5TtDxhciujhpzB8DqjNZFFv
   T6t6ZtipPXKUPYBFh1zRDeZYrCFlSgAnuho9XLKInI8S4DaJaPnhM8Lf2
   g==;
X-CSE-ConnectionGUID: hklbFC0BS1GkRUnW/iTGtA==
X-CSE-MsgGUID: JmntyzCNQIeZ+aXPWjURzQ==
X-IPAS-Result: =?us-ascii?q?A0ADAACYFOxq/5X/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YBopSQMBjG6HOIE1bItohWeMVRSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGCEoJzjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBIAECCgsBGAEbPgMBAk8LIyEJgnkBgjoDNwMRvEKBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DYTA2CWgELFAGBOAGFP4J/hSRdGAFEhDknGxuBcoEUAYE7gi6BB?=
 =?us-ascii?q?YEaNwsEGH4LBF+GIASCIoEMgVoYBmWMFQKBUoZwSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FH?=
 =?us-ascii?q?CZAGwoYGA1IESw3FRkEPm4Hki+CCVsNDgsHAQ0IFwQMEwkBGAkTAQcMFwEES?=
 =?us-ascii?q?QM1DAcDMgQJBhgFAQYCAgMhEQsCkwcQCpAWgiGLL5QkHTBxCiiDeIwkjz6Ff?=
 =?us-ascii?q?BozhASBV5JCg1WOfwuYfY4KhAqDU41YNBQdN4RpgWg8gVlwFTuCZwkJAUAZD?=
 =?us-ascii?q?44tAQEKC4FRJ4USgSZDgX7HSiYyAQEBAQcDLwEBBwIHDgMLgWiQABEXgVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:8+9b0K4bzPC+cHS9UAHmMgxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jcWDG3VOayLa2L2KY1yaoywpkwCucOHzNdmHAVp+yFkZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePY4c8MhcWUt1r
 NMbEg0LUVeCu82q6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYGNIIfQHZkM9qqej
 kDD+XjoEDo8Df2S+3mMwkqThNL1jxquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:e+W1haqxnEZxxIM1PQ/5daoaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:07StAW7oOeWajPYA0tss9E0QEO4OKlfmlVjTGXK+NiFodJKJYArF
X-Talos-MUID: 9a23:EDLDuAtImTBi9yznKs2npjRkKNZ6yIKXKU0/0pw2g/aGCBZiAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530232041"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:35:06 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 94B301800031A
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:35:06 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3F106CC1611; Wed,  4 Nov 2026 21:35:06 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371
Date: Wed,  4 Nov 2026 21:35:06 -0800
Message-Id: <20261105053506.165590-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249443
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

getfattr traversal and setfattr restore operations can follow
attacker-controlled symlinks and access unintended files. This can
lead to privilege escalation when invoked by a privileged process.

Backport the upstream hardening commits [7] and [8], identified by
the Debian tracker [10], while retaining attr 2.5.2. These fixes use
interfaces absent from 2.5.2, requiring the following prerequisites
in their dependency order:

- [1] Add the visibility attribute header. The compatibility helpers
  introduced by [3] include this header and use its hidden annotation
  for internal declarations.

- [2] Add xattrat syscall wrappers. These provide the getxattrat(),
  setxattrat(), listxattrat() and removexattrat() entry points used by
  [3] when the C library does not provide them.

- [3] Add xattrat compatibility helpers. The hardening fixes use these
  interfaces for directory-relative extended-attribute operations.
  They provide fallbacks for older kernels and unsupported
  O_PATH/AT_EMPTY_PATH combinations, using /proc/self/fd where needed.

- [4] Add the directory-fd-based walk_tree implementation and callback
  interface required by [7]. This allows getfattr to access entries
  relative to directory descriptors instead of repeatedly resolving
  their complete pathnames.

- [5] Defer restoration until command-line parsing is complete.
  This ensures -h and the -P option introduced by [8] take effect
  even when specified after --restore.

- [6] Add openat2 detection and a syscall wrapper. Commit [8] uses
  this interface with RESOLVE_NO_SYMLINKS to resolve restore
  directory components without following symbolic links.

The main fixes then convert getfattr to directory-relative xattr
operations [7] and harden setfattr --restore [8]. Restore retains
upstream compatibility behavior: -P protects directory traversal,
while -h prevents dereferencing the final component. Physical
directory resolution fails rather than silently falling back when
openat2 is unavailable.

Replace the existing walker in place, avoiding the upstream
old-walker rename and duplicate implementation. Include the relevant
test changes from [9] to stabilize root-test output on SELinux hosts.
Read the ptest TESTS list from the generated Makefile so conditional
tests are installed according to the configured build.

[1] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=21b5e5b9d394612f44e384c8fa024aea5e8dac68
[2] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=c62e9b55edd512ba3f87eaaaf5b822bd2a76bfe9
[3] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=c462283577f1a6479229c43184ad6af5921f439b
[4] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=9b37b117c5d5703aa7481f4c34f73b24c010ad25
[5] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=4fce17388e014a06cca16914ab3b7e4a0d117856
[6] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=1cea2fc5e8b5c8a5f29abf1141399e01a57a3154
[7] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=641ea6fcc556c1f34b77efb9cd3f876dff0a0a07
[8] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3fb06b9ba314d37035d0877e6de313de754f1ac8
[9] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=303335494a326026bc37e8d83ca47fa1a4d8dde6
[10] https://security-tracker.debian.org/tracker/CVE-2026-54371

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../attr/CVE-2026-54371-dependent_p1.patch    |  48 ++
 .../attr/CVE-2026-54371-dependent_p2.patch    | 197 +++++
 .../attr/CVE-2026-54371-dependent_p3.patch    | 710 ++++++++++++++++++
 .../attr/CVE-2026-54371-dependent_p4.patch    | 638 ++++++++++++++++
 .../attr/CVE-2026-54371-dependent_p5.patch    |  63 ++
 .../attr/CVE-2026-54371-dependent_p6.patch    | 140 ++++
 .../attr/attr/CVE-2026-54371_p1.patch         | 390 ++++++++++
 .../attr/attr/CVE-2026-54371_p2.patch         | 476 ++++++++++++
 meta/recipes-support/attr/attr_2.5.2.bb       |  10 +-
 9 files changed, 2671 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p1.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p2.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p3.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p4.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p5.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p6.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p1.patch
 create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p2.patch

diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p1.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p1.patch
new file mode 100644
index 00000000000..60b174b72d9
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p1.patch
@@ -0,0 +1,48 @@
+From 21b5e5b9d394612f44e384c8fa024aea5e8dac68 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 17:32:40 +0200
+Subject: [PATCH] Add visibility attribute header
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=21b5e5b9d394612f44e384c8fa024aea5e8dac68]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 21b5e5b9d394612f44e384c8fa024aea5e8dac68)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ include/Makemodule.am       |  1 +
+ include/visibility-hidden.h | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+ create mode 100644 include/visibility-hidden.h
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 3531fa1..f300edb 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -4,6 +4,7 @@ noinst_HEADERS += \
+ 	include/libattr.h \
+ 	include/misc.h \
+ 	include/nls.h \
++	include/visibility-hidden.h \
+ 	include/walk_tree.h
+ 
+ 
+diff --git a/include/visibility-hidden.h b/include/visibility-hidden.h
+new file mode 100644
+index 0000000..2d02731
+--- /dev/null
++++ b/include/visibility-hidden.h
+@@ -0,0 +1,11 @@
++#ifndef VISIBILITY_HIDDEN_H
++#define VISIBILITY_HIDDEN_H
++
++/* Mark library internal functions as hidden */
++#if defined(HAVE_VISIBILITY_ATTRIBUTE)
++# define hidden __attribute__((visibility("hidden")))
++#else
++# define hidden /* hidden */
++#endif
++
++#endif /* VISIBILITY_HIDDEN_H */
+-- 
+2.35.6
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p2.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p2.patch
new file mode 100644
index 00000000000..8525ba26794
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p2.patch
@@ -0,0 +1,197 @@
+From c62e9b55edd512ba3f87eaaaf5b822bd2a76bfe9 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 13:18:23 +0200
+Subject: [PATCH] Add xattrat syscall wrappers
+
+The getxattrat(), setxattrat(), listxattrat(), and removexattrat() system calls
+don't have shims provided by glibc, yet.  For each of those system calls, test
+if glibc defines it and add a local shim using syscall() if not.
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=c62e9b55edd512ba3f87eaaaf5b822bd2a76bfe9]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit c62e9b55edd512ba3f87eaaaf5b822bd2a76bfe9)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ configure.ac          |  7 ++++
+ include/Makemodule.am |  4 +-
+ include/xattrat.h     | 25 +++++++++++++
+ libmisc/Makemodule.am |  5 +++
+ libmisc/xattrat.c     | 87 +++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 126 insertions(+), 2 deletions(-)
+ create mode 100644 include/xattrat.h
+ create mode 100644 libmisc/xattrat.c
+
+diff --git a/configure.ac b/configure.ac
+index 02322c3..bf32dce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,6 +36,13 @@ AC_SYS_LARGEFILE
+ AM_PROG_AR
+ LT_INIT
+ 
++AC_CHECK_FUNCS(getxattrat setxattrat listxattrat removexattrat)
++AM_CONDITIONAL([NEED_XATTRAT],
++	       [test "x$ac_cv_func_getxattrat" = xno -o \
++		     "x$ac_cv_func_setxattrat" = xno -o \
++		     "x$ac_cv_func_listxattrat" = xno -o \
++		     "x$ac_cv_func_removexattrat" = xno])
++
+ AM_GNU_GETTEXT_VERSION([0.18.2])
+ AM_GNU_GETTEXT([external])
+ 
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index f300edb..bd1a4a8 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -5,8 +5,8 @@ noinst_HEADERS += \
+ 	include/misc.h \
+ 	include/nls.h \
+ 	include/visibility-hidden.h \
+-	include/walk_tree.h
+-
++	include/walk_tree.h \
++	include/xattrat.h
+ 
+ SUBST_INSTALL_HEADER = \
+ 	subst_install_header() { \
+diff --git a/include/xattrat.h b/include/xattrat.h
+new file mode 100644
+index 0000000..e4ba0c0
+--- /dev/null
++++ b/include/xattrat.h
+@@ -0,0 +1,25 @@
++#ifndef MISC_XATTRAT_H
++#define MISC_XATTRAT_H
++
++#include "config.h"
++
++#ifndef HAVE_GETXATTRAT
++ssize_t getxattrat(int dirfd, const char *path, int at_flags, const char *name,
++		   void *value, size_t size);
++#endif
++
++#ifndef HAVE_SETXATTRAT
++int setxattrat(int dirfd, const char *path, int at_flags, const char *name,
++	       const void *value, size_t size, int flags);
++#endif
++
++#ifndef HAVE_LISTXATTRAT
++ssize_t listxattrat(int dirfd, const char *path, int at_flags, char *list,
++		    size_t size);
++#endif
++
++#ifndef HAVE_REMOVEXATTRAT
++int removexattrat(int dirfd, const char *path, int at_flags, const char *name);
++#endif
++
++#endif /* MISC_XATTRAT_H */
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index d784622..9349959 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -6,3 +6,8 @@ libmisc_la_SOURCES = \
+ 	libmisc/quote.c \
+ 	libmisc/unquote.c \
+ 	libmisc/walk_tree.c
++
++if NEED_XATTRAT
++libmisc_la_SOURCES += \
++	libmisc/xattrat.c
++endif
+diff --git a/libmisc/xattrat.c b/libmisc/xattrat.c
+new file mode 100644
+index 0000000..5f6212c
+--- /dev/null
++++ b/libmisc/xattrat.c
+@@ -0,0 +1,87 @@
++/*
++  File: xattrat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <linux/xattr.h>
++#include <sys/syscall.h>
++#include <unistd.h>
++#include <errno.h>
++
++#include "xattrat.h"
++
++#pragma GCC diagnostic ignored "-Wunused-parameter"
++
++ssize_t
++getxattrat(int dirfd, const char *path, int at_flags, const char *name,
++	   void *value, size_t size)
++{
++#ifdef __NR_getxattrat
++	struct xattr_args uargs = {
++		.value = (unsigned long)value,
++		.size = size,
++	};
++
++	return syscall(__NR_getxattrat, dirfd, path, at_flags, name,
++		       &uargs, sizeof(uargs));
++#else
++	errno = ENOSYS;
++	return -1;
++#endif
++}
++
++int
++setxattrat(int dirfd, const char *path, int at_flags, const char *name,
++	   const void *value, size_t size, int flags)
++{
++#ifdef __NR_setxattrat
++	struct xattr_args uargs = {
++		.value = (unsigned long)value,
++		.size = size,
++		.flags = flags,
++	};
++
++        return syscall(__NR_setxattrat, dirfd, path, at_flags, name,
++                       &uargs, sizeof(uargs));
++#else
++	errno = ENOSYS;
++	return -1;
++#endif
++}
++
++ssize_t listxattrat(int dirfd, const char *path, int at_flags, char *list,
++		    size_t size)
++{
++#ifdef __NR_listxattrat
++        return syscall(__NR_listxattrat, dirfd, path, at_flags, list, size);
++#else
++	errno = ENOSYS;
++	return -1;
++#endif
++}
++
++int
++removexattrat(int dirfd, const char *path, int at_flags, const char *name)
++{
++#ifdef __NR_removexattrat
++	return syscall(__NR_removexattrat, dirfd, path, at_flags, name);
++#else
++	errno = ENOSYS;
++	return -1;
++#endif
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p3.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p3.patch
new file mode 100644
index 00000000000..ff1ee9f3faf
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p3.patch
@@ -0,0 +1,710 @@
+From c462283577f1a6479229c43184ad6af5921f439b Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 15:45:25 +0200
+Subject: [PATCH] Add xattrat syscall backwards compatibility code
+
+The getxattrat(), setxattrat(), listxattrat(), and removexattrat() system calls
+have only been added in kernel version 6.13 which was released in January 2025.
+On older systems, those system calls will fail with errno == ENOSYS.  So we use
+the old system calls (for example, getxattr() and lgetxattr()) when they are
+sufficient, and the new xattrat() system calls when they are needed.
+
+In addition, when the new system calls are not available, we resort to the
+following hacks for achieving the desired behavior: when dirfd is not AT_FDCWD,
+the pathname can usually be resolved relative to dirfd as
+"/proc/self/fd/<dirfd>/pathname".  And when that also fails because the
+resulting pathname is too long, the original pathname can be resolved using
+openat(dirfd, pathname, O_PATH) and then accessed as "/proc/self/fd/<fd>".
+
+Also, due to a current kernel limitation, the xattrat system calls will not
+accept dirfd file descriptors of type O_PATH with an empty pathname (and with
+the AT_EMPTY_PATH flag set in at_flags) [*].  When running into this case, we
+also fall back to accessing the file via "/proc/self/fd/<fd>".
+
+When those hacks fail because the /proc filesystem is not available, these
+compatibility wrappers will fail with errno == ENOSYS.
+
+[*] https://lore.kernel.org/linux-fsdevel/20260607164136.2948550-2-agruenba@redhat.com/
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=c462283577f1a6479229c43184ad6af5921f439b]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit c462283577f1a6479229c43184ad6af5921f439b)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ include/Makemodule.am          |   3 +-
+ include/xattrat_compat.h       |  24 ++++++++
+ libmisc/Makemodule.am          |   8 +++
+ libmisc/getxattrat_compat.c    | 108 +++++++++++++++++++++++++++++++++
+ libmisc/listxattrat_compat.c   | 107 ++++++++++++++++++++++++++++++++
+ libmisc/proc-self-fd.c         |  92 ++++++++++++++++++++++++++++
+ libmisc/proc-self-fd.h         |  31 ++++++++++
+ libmisc/removexattrat_compat.c | 107 ++++++++++++++++++++++++++++++++
+ libmisc/setxattrat_compat.c    | 108 +++++++++++++++++++++++++++++++++
+ 9 files changed, 587 insertions(+), 1 deletion(-)
+ create mode 100644 include/xattrat_compat.h
+ create mode 100644 libmisc/getxattrat_compat.c
+ create mode 100644 libmisc/listxattrat_compat.c
+ create mode 100644 libmisc/proc-self-fd.c
+ create mode 100644 libmisc/proc-self-fd.h
+ create mode 100644 libmisc/removexattrat_compat.c
+ create mode 100644 libmisc/setxattrat_compat.c
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index bd1a4a8..54f8ee0 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -6,7 +6,8 @@ noinst_HEADERS += \
+ 	include/nls.h \
+ 	include/visibility-hidden.h \
+ 	include/walk_tree.h \
+-	include/xattrat.h
++	include/xattrat.h \
++	include/xattrat_compat.h
+ 
+ SUBST_INSTALL_HEADER = \
+ 	subst_install_header() { \
+diff --git a/include/xattrat_compat.h b/include/xattrat_compat.h
+new file mode 100644
+index 0000000..0016e9e
+--- /dev/null
++++ b/include/xattrat_compat.h
+@@ -0,0 +1,24 @@
++#ifndef XATTRAT_COMPAT_H
++#define XATTRAT_COMPAT_H
++
++ssize_t getxattrat_compat(int dirfd, const char *path, int at_flags,
++			  const char *name, void *value, size_t size);
++
++int setxattrat_compat(int dirfd, const char *path, int at_flags,
++		      const char *name, const void *value, size_t size,
++		      int flags);
++
++ssize_t listxattrat_compat(int dirfd, const char *path, int at_flags,
++			   char *list, size_t size);
++
++int removexattrat_compat(int dirfd, const char *path, int at_flags,
++			 const char *name);
++
++#ifndef DECLARATIONS_ONLY
++# define getxattrat getxattrat_compat
++# define setxattrat setxattrat_compat
++# define listxattrat listxattrat_compat
++# define removexattrat removexattrat_compat
++#endif
++
++#endif /* XATTRAT_COMPAT_H */
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index 9349959..a42ae32 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -1,9 +1,17 @@
+ noinst_LTLIBRARIES += libmisc.la
+ 
++noinst_HEADERS += \
++	libmisc/proc-self-fd.h
++
+ libmisc_la_SOURCES = \
++	libmisc/getxattrat_compat.c \
+ 	libmisc/high_water_alloc.c \
++	libmisc/listxattrat_compat.c \
+ 	libmisc/next_line.c \
++	libmisc/proc-self-fd.c \
+ 	libmisc/quote.c \
++	libmisc/removexattrat_compat.c \
++	libmisc/setxattrat_compat.c \
+ 	libmisc/unquote.c \
+ 	libmisc/walk_tree.c
+ 
+diff --git a/libmisc/getxattrat_compat.c b/libmisc/getxattrat_compat.c
+new file mode 100644
+index 0000000..8c642b6
+--- /dev/null
++++ b/libmisc/getxattrat_compat.c
+@@ -0,0 +1,108 @@
++/*
++  File: getxattrat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/xattr.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <errno.h>
++#include <stdlib.h>
++#include "xattrat.h"
++#include "libmisc/proc-self-fd.h"
++
++#define DECLARATIONS_ONLY
++#include "xattrat_compat.h"
++
++/* Used in {set,list,remove}xattrat_compat.c */
++int slow_empty_paths;
++
++static ssize_t
++xgetxattr(const char *path, int at_flags, const char *name, void *value,
++	  size_t size)
++{
++	if (at_flags & AT_SYMLINK_NOFOLLOW)
++		return lgetxattr(path, name, value, size);
++	return getxattr(path, name, value, size);
++}
++
++ssize_t
++getxattrat_compat(int dirfd, const char *path, int at_flags, const char *name,
++		  void *value, size_t size)
++{
++	struct proc_self_fd_buffer buffer;
++	static int no_getxattrat;
++	char *newpath;
++	ssize_t ret;
++	int fd;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (!*path) {
++		if (!(at_flags & AT_EMPTY_PATH)) {
++			errno = ENOENT;
++			return -1;
++		}
++	}
++
++	if (dirfd == AT_FDCWD || *path == '/')
++		return xgetxattr(path, at_flags, name, value, size);
++
++	if (!no_getxattrat) {
++		if (!*path && slow_empty_paths)
++			goto proc_self_fd_path;
++		ret = getxattrat(dirfd, path, at_flags, name, value, size);
++		if (ret != -1)
++		       return ret;
++		if (need_slow_empty_paths(dirfd, path)) {
++			slow_empty_paths = 1;
++			goto proc_self_fd_path;
++		}
++		if (errno != ENOSYS)
++			return -1;
++		no_getxattrat = 1;
++	}
++
++proc_self_fd_path:
++	newpath = proc_self_fd_realpath(dirfd, path, &at_flags, &buffer);
++	if (!newpath)
++		return -1;
++	ret = xgetxattr(newpath, at_flags, name, value, size);
++	proc_self_fd_free(newpath, &buffer);
++	if (ret != -1)
++		return ret;
++	if (errno == ENOENT) {
++		if (!*path) {
++			errno = ENOSYS;
++			return -1;
++		}
++		if (fcntl(dirfd, F_GETFL) != -1)
++			errno = ENOENT;
++		return -1;
++	} else if (errno != ENAMETOOLONG)
++		return ret;
++
++	fd = openat_with_flags(dirfd, path, at_flags);
++	if (fd == -1)
++		return -1;
++	ret = getxattr(proc_self_fd_path(fd, &buffer), name, value, size);
++	close(fd);
++	return ret;
++}
+diff --git a/libmisc/listxattrat_compat.c b/libmisc/listxattrat_compat.c
+new file mode 100644
+index 0000000..17640cc
+--- /dev/null
++++ b/libmisc/listxattrat_compat.c
+@@ -0,0 +1,107 @@
++/*
++  File: listxattrat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/xattr.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <errno.h>
++#include <stdlib.h>
++#include "xattrat.h"
++#include "libmisc/proc-self-fd.h"
++
++#define DECLARATIONS_ONLY
++#include "xattrat_compat.h"
++
++/* Defined in getxattrat_compat.c */
++extern int slow_empty_paths;
++
++static ssize_t
++xlistxattr(const char *path, int at_flags, char *list, size_t size)
++{
++	if (at_flags & AT_SYMLINK_NOFOLLOW)
++		return llistxattr(path, list, size);
++	return listxattr(path, list, size);
++}
++
++ssize_t
++listxattrat_compat(int dirfd, const char *path, int at_flags, char *list,
++		   size_t size)
++{
++	struct proc_self_fd_buffer buffer;
++	static int no_listxattrat;
++	char *newpath;
++	ssize_t ret;
++	int fd;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (!*path) {
++		if (!(at_flags & AT_EMPTY_PATH)) {
++			errno = ENOENT;
++			return -1;
++		}
++	}
++
++	if (dirfd == AT_FDCWD || *path == '/')
++		return xlistxattr(path, at_flags, list, size);
++
++	if (!no_listxattrat) {
++		if (!*path && slow_empty_paths)
++			goto proc_self_fd_path;
++		ret = listxattrat(dirfd, path, at_flags, list, size);
++		if (ret != -1)
++		       return ret;
++		if (need_slow_empty_paths(dirfd, path)) {
++			slow_empty_paths = 1;
++			goto proc_self_fd_path;
++		}
++		if (errno != ENOSYS)
++			return -1;
++		no_listxattrat = 1;
++	}
++
++proc_self_fd_path:
++	newpath = proc_self_fd_realpath(dirfd, path, &at_flags, &buffer);
++	if (!newpath)
++		return -1;
++	ret = xlistxattr(newpath, at_flags, list, size);
++	proc_self_fd_free(newpath, &buffer);
++	if (ret != -1)
++		return ret;
++	if (errno == ENOENT) {
++		if (!*path) {
++			errno = ENOSYS;
++			return -1;
++		}
++		if (fcntl(dirfd, F_GETFL) != -1)
++			errno = ENOENT;
++		return -1;
++	} else if (errno != ENAMETOOLONG)
++		return ret;
++
++	fd = openat_with_flags(dirfd, path, at_flags);
++	if (fd == -1)
++		return -1;
++	ret = listxattr(proc_self_fd_path(fd, &buffer), list, size);
++	close(fd);
++	return ret;
++}
+diff --git a/libmisc/proc-self-fd.c b/libmisc/proc-self-fd.c
+new file mode 100644
+index 0000000..0ae5cf2
+--- /dev/null
++++ b/libmisc/proc-self-fd.c
+@@ -0,0 +1,92 @@
++/*
++  File: xattrat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <unistd.h>
++#include <fcntl.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <errno.h>
++#include "libmisc/proc-self-fd.h"
++
++char *
++proc_self_fd_path(int fd, struct proc_self_fd_buffer *buffer)
++{
++	sprintf(buffer->buffer, "/proc/self/fd/%d", fd);
++	return buffer->buffer;
++}
++
++void
++proc_self_fd_free(char *path, struct proc_self_fd_buffer *buffer)
++{
++	if (path != buffer->buffer)
++		free(path);
++}
++
++char *
++proc_self_fd_realpath(int dirfd, const char *path, int *at_flags,
++		      struct proc_self_fd_buffer *buffer)
++{
++	char *newpath;
++	int ret;
++
++	if (!*path) {
++		*at_flags &= ~AT_SYMLINK_NOFOLLOW;
++		return proc_self_fd_path(dirfd, buffer);
++	}
++	ret = asprintf(&newpath, "/proc/self/fd/%d/%s", dirfd, path);
++	if (ret == -1)
++		return NULL;
++	return newpath;
++}
++
++int
++openat_with_flags(int dirfd, const char *path, int at_flags)
++{
++	int flags = O_PATH | O_CLOEXEC;
++
++	if (at_flags & AT_SYMLINK_NOFOLLOW)
++		flags |= O_NOFOLLOW;
++	return openat(dirfd, path, flags);
++}
++
++/*
++ * getxattrat(), setxattrat(), listxattrat(), and removexattrat() up to at
++ * least kernel version 7.2 fail with EBADF when the dirfd is an O_PATH file
++ * descriptor and the pathname is NULL or empty.
++ */
++int
++need_slow_empty_paths(int dirfd, const char *path)
++{
++	int saved_errno = errno;
++	int open_flags;
++
++	if (errno != EBADF)
++		return 0;
++	if (*path)
++	       return 0;
++	open_flags = fcntl(dirfd, F_GETFL);
++	if (open_flags == -1) {
++		errno = saved_errno;
++		return 0;
++	}
++	if (!(open_flags & O_PATH))
++		return 0;
++	return 1;
++}
+diff --git a/libmisc/proc-self-fd.h b/libmisc/proc-self-fd.h
+new file mode 100644
+index 0000000..368fd1e
+--- /dev/null
++++ b/libmisc/proc-self-fd.h
+@@ -0,0 +1,31 @@
++#ifndef MISC_XATTRAT_COMPAT_H
++#define MISC_XATTRAT_COMPAT_H
++
++#include <limits.h>
++#include "include/visibility-hidden.h"
++
++/*
++ * The maximum number of decimal digits of an N-bit number is
++ * ceil(N * log10(2)), with log10(2) being approx. 0.30103.  We
++ * use 31/100 as a safe and close enough approximation; the
++ * overshoot even for 128-bit numbers is only one byte.
++ */
++#define TYPE_BITS(type) (sizeof(type) * CHAR_BIT)
++#define DECIMAL_DIGITS(type) ((TYPE_BITS(type) * 31 + 99) / 100)
++
++struct proc_self_fd_buffer {
++	char buffer[sizeof("/proc/self/fd/") +
++		    /* sign */ 1 + DECIMAL_DIGITS(int)];
++};
++
++hidden char *proc_self_fd_path(int fd, struct proc_self_fd_buffer *buffer);
++hidden void proc_self_fd_free(char *path, struct proc_self_fd_buffer *buffer);
++
++hidden extern int slow_empty_paths;
++
++hidden char *proc_self_fd_realpath(int dirfd, const char *path, int *at_flags,
++				   struct proc_self_fd_buffer *buffer);
++hidden int openat_with_flags(int dirfd, const char *path, int at_flags);
++hidden int need_slow_empty_paths(int dirfd, const char *path);
++
++#endif /* MISC_XATTRAT_COMPAT_H */
+diff --git a/libmisc/removexattrat_compat.c b/libmisc/removexattrat_compat.c
+new file mode 100644
+index 0000000..32e37cd
+--- /dev/null
++++ b/libmisc/removexattrat_compat.c
+@@ -0,0 +1,107 @@
++/*
++  File: getxattrat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/xattr.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <errno.h>
++#include <stdlib.h>
++#include "xattrat.h"
++#include "libmisc/proc-self-fd.h"
++
++#define DECLARATIONS_ONLY
++#include "xattrat_compat.h"
++
++/* Defined in getxattrat_compat.c */
++extern int slow_empty_paths;
++
++static int
++xremovexattr(const char *path, int at_flags, const char *name)
++{
++	if (at_flags & AT_SYMLINK_NOFOLLOW)
++		return lremovexattr(path, name);
++	return removexattr(path, name);
++}
++
++
++int
++removexattrat_compat(int dirfd, const char *path, int at_flags,
++		     const char *name)
++{
++	struct proc_self_fd_buffer buffer;
++	static int no_removexattrat;
++	char *newpath;
++	int fd, ret;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (!*path) {
++		if (!(at_flags & AT_EMPTY_PATH)) {
++			errno = ENOENT;
++			return -1;
++		}
++	}
++
++	if (dirfd == AT_FDCWD || *path == '/')
++		return xremovexattr(path, at_flags, name);
++
++	if (!no_removexattrat) {
++		if (!*path && slow_empty_paths)
++			goto proc_self_fd_path;
++		ret = removexattrat(dirfd, path, at_flags, name);
++		if (ret != -1)
++			return ret;
++		if (need_slow_empty_paths(dirfd, path)) {
++			slow_empty_paths = 1;
++			goto proc_self_fd_path;
++		}
++		if (errno != ENOSYS)
++			return ret;
++		no_removexattrat = 1;
++	}
++
++proc_self_fd_path:
++	newpath = proc_self_fd_realpath(dirfd, path, &at_flags, &buffer);
++	if (!newpath)
++		return -1;
++	ret = xremovexattr(newpath, at_flags, name);
++	proc_self_fd_free(newpath, &buffer);
++	if (ret != -1)
++		return ret;
++	if (errno == ENOENT) {
++		if (!*path) {
++			errno = ENOSYS;
++			return -1;
++		}
++		if (fcntl(dirfd, F_GETFL) != -1)
++			errno = ENOENT;
++		return -1;
++	} else if (errno != ENAMETOOLONG)
++		return ret;
++
++	fd = openat_with_flags(dirfd, path, at_flags);
++	if (fd == -1)
++		return -1;
++	ret = removexattr(proc_self_fd_path(fd, &buffer), name);
++	close(fd);
++	return ret;
++}
+diff --git a/libmisc/setxattrat_compat.c b/libmisc/setxattrat_compat.c
+new file mode 100644
+index 0000000..b8340b8
+--- /dev/null
++++ b/libmisc/setxattrat_compat.c
+@@ -0,0 +1,108 @@
++/*
++  File: getxattrat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/xattr.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <errno.h>
++#include <stdlib.h>
++#include "xattrat.h"
++#include "libmisc/proc-self-fd.h"
++
++#define DECLARATIONS_ONLY
++#include "xattrat_compat.h"
++
++/* Defined in getxattrat_compat.c */
++extern int slow_empty_paths;
++
++static int
++xsetxattr(const char *path, int at_flags, const char *name, const void *value,
++	  size_t size, int flags)
++{
++	if (at_flags & AT_SYMLINK_NOFOLLOW)
++		return lsetxattr(path, name, value, size, flags);
++	return setxattr(path, name, value, size, flags);
++}
++
++int
++setxattrat_compat(int dirfd, const char *path, int at_flags, const char *name,
++		  const void *value, size_t size, int flags)
++{
++	struct proc_self_fd_buffer buffer;
++	static int no_setxattrat;
++	char *newpath;
++	int fd, ret;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (!*path) {
++		if (!(at_flags & AT_EMPTY_PATH)) {
++			errno = ENOENT;
++			return -1;
++		}
++	}
++
++	if (dirfd == AT_FDCWD || *path == '/')
++		return xsetxattr(path, at_flags, name, value, size, flags);
++
++	if (!no_setxattrat) {
++		if (!*path && slow_empty_paths)
++			goto proc_self_fd_path;
++		ret = setxattrat(dirfd, path, at_flags, name, value, size,
++				 flags);
++		if (ret != -1)
++			return ret;
++		if (need_slow_empty_paths(dirfd, path)) {
++			slow_empty_paths = 1;
++			goto proc_self_fd_path;
++		}
++		if (errno != ENOSYS)
++			return ret;
++		no_setxattrat = 1;
++	}
++
++proc_self_fd_path:
++	newpath = proc_self_fd_realpath(dirfd, path, &at_flags, &buffer);
++	if (!newpath)
++		return -1;
++	ret = xsetxattr(newpath, at_flags, name, value, size, flags);
++	proc_self_fd_free(newpath, &buffer);
++	if (ret != -1)
++		return ret;
++	if (errno == ENOENT) {
++		if (!*path) {
++			errno = ENOSYS;
++			return -1;
++		}
++		if (fcntl(dirfd, F_GETFL) != -1)
++			errno = ENOENT;
++		return -1;
++	} else if (errno != ENAMETOOLONG)
++		return ret;
++
++	fd = openat_with_flags(dirfd, path, at_flags);
++	if (fd == -1)
++		return -1;
++	ret = setxattr(proc_self_fd_path(fd, &buffer), name, value, size, flags);
++	close(fd);
++	return ret;
++}
+-- 
+2.35.6
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p4.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p4.patch
new file mode 100644
index 00000000000..a286e2b5865
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p4.patch
@@ -0,0 +1,638 @@
+From 9b37b117c5d5703aa7481f4c34f73b24c010ad25 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 17:42:42 +0200
+Subject: [PATCH] Add the new walk_tree helper
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=9b37b117c5d5703aa7481f4c34f73b24c010ad25]
+
+Backport Changes:
+- Replaced attr 2.5.2's existing walk_tree.h and walk_tree.c in place
+  with the upstream walker. After the getfattr hardening, no caller uses
+  the old walker, so the separate old_walk_tree files and prerequisite
+  rename commit c21f3004ef0ad55c11ac0297ad3d0f82dfb4f768 are omitted.
+- Kept the existing walker entries in the Automake source lists; no
+  second walker implementation needs to be built.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 9b37b117c5d5703aa7481f4c34f73b24c010ad25)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ include/walk_tree.h |  44 ++--
+ libmisc/walk_tree.c | 479 ++++++++++++++++++++++++++------------------
+ 2 files changed, 302 insertions(+), 221 deletions(-)
+
+diff --git a/include/walk_tree.h b/include/walk_tree.h
+index b19ec23..60df8da 100644
+--- a/include/walk_tree.h
++++ b/include/walk_tree.h
+@@ -1,40 +1,40 @@
+ /*
+   File: walk_tree.h
+ 
+-  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
++  Copyright (C) 2007-2026 Andreas Gruenbacher <a.gruenbacher@computer.org>
+ 
+-  This program is free software; you can redistribute it and/or modify it under
+-  the terms of the GNU Lesser General Public License as published by the
+-  Free Software Foundation; either version 2.1 of the License, or (at
+-  your option) any later version.
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
+ 
+-  This program is distributed in the hope that it will be useful, but WITHOUT
+-  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
+-  License for more details.
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
+ 
+   You should have received a copy of the GNU Lesser General Public
+-  License along with this program.  If not, see <http://www.gnu.org/licenses/>.
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
+ */
+ 
+ #ifndef __WALK_TREE_H
+ #define __WALK_TREE_H
+ 
+-#define WALK_TREE_RECURSIVE		0x01
+-#define WALK_TREE_PHYSICAL		0x02
+-#define WALK_TREE_LOGICAL		0x04
+-#define WALK_TREE_DEREFERENCE		0x08
+-#define WALK_TREE_DEREFERENCE_TOPLEVEL	0x10
+-#define WALK_TREE_ONE_FILESYSTEM	0x20
++enum walk_flags {
++	WALK_TREE_RECURSIVE = 0x01,
++	WALK_TREE_PHYSICAL = 0x02,
++	WALK_TREE_LOGICAL = 0x04,
++	WALK_TREE_ONE_FILESYSTEM = 0x08,
+ 
+-#define WALK_TREE_TOPLEVEL	0x100
+-#define WALK_TREE_SYMLINK	0x200
+-#define WALK_TREE_FAILED	0x400
++	WALK_TREE_TOPLEVEL = 0x100,
++	WALK_TREE_FAILED = 0x200,
++};
+ 
+ struct stat;
+ 
+-extern int walk_tree(const char *path, int walk_flags, unsigned int num,
+-		     int (*func)(const char *, const struct stat *, int,
+-				 void *), void *arg);
++extern int walk_tree(const char *pathname, enum walk_flags walk_flags,
++		     int (*func)(int, const char *, const char *,
++				 unsigned char, enum walk_flags, void *),
++		     void *arg);
+ 
+ #endif
+diff --git a/libmisc/walk_tree.c b/libmisc/walk_tree.c
+index e9a942f..5b1b576 100644
+--- a/libmisc/walk_tree.c
++++ b/libmisc/walk_tree.c
+@@ -1,259 +1,340 @@
+ /*
+   File: walk_tree.c
+ 
+-  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
++  Copyright (C) 2007-2026 Andreas Gruenbacher <a.gruenbacher@computer.org>
+ 
+-  This program is free software; you can redistribute it and/or modify it under
+-  the terms of the GNU Lesser General Public License as published by the
+-  Free Software Foundation; either version 2.1 of the License, or (at
+-  your option) any later version.
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
+ 
+-  This program is distributed in the hope that it will be useful, but WITHOUT
+-  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
+-  License for more details.
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
+ 
+   You should have received a copy of the GNU Lesser General Public
+-  License along with this program.  If not, see <http://www.gnu.org/licenses/>.
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
+ */
+ 
+ #include "config.h"
+-
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
+ #include <dirent.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+ 
+ #include "walk_tree.h"
+ 
+-struct entry_handle {
+-	struct entry_handle *prev, *next;
+-	dev_t dev;
+-	ino_t ino;
++struct dir_stack_entry {
++	struct dir_stack_entry *parent;
+ 	DIR *stream;
+ 	long pos;
++	dev_t dev;
++	ino_t ino;
+ };
+ 
++struct dir_hash_entry {
++	struct dir_hash_entry *next;
++	dev_t dev;
++	ino_t ino;
++};
++
++#define DIR_HASH_SIZE 128
++
+ struct walk_tree_args {
+-	char path[FILENAME_MAX];
+-	int walk_flags;
+-	int (*func)(const char *, const struct stat *, int, void *);
++	enum walk_flags walk_flags;
++	int (*func)(int, const char *, const char *, unsigned char,
++		    enum walk_flags, void *);
+ 	void *arg;
+ 	int depth;
+-	struct entry_handle dirs;
+-	struct entry_handle *closed;
+ 	unsigned int num_dir_handles;
+-	struct stat st;
+ 	dev_t dev;
++	struct dir_hash_entry **dir_hash;
+ };
+ 
+-static int walk_tree_visited(struct entry_handle *dirs, dev_t dev, ino_t ino)
++static int dir_visited(struct dir_stack_entry *entry, dev_t dev, ino_t ino)
+ {
+-	struct entry_handle *i;
++	while (entry) {
++		if (entry->dev == dev && entry->ino == ino)
++			  return 1;
++		entry = entry->parent;
++	}
++	return 0;
++}
+ 
+-	for (i = dirs->next; i != dirs; i = i->next)
+-		if (i->dev == dev && i->ino == ino)
++static unsigned int dir_hash(dev_t dev, ino_t ino)
++{
++	return (dev ^ ino) % DIR_HASH_SIZE;
++}
++
++static int dir_hash_insert_unique(struct walk_tree_args *args, struct stat *st)
++{
++	unsigned int bucket = dir_hash(st->st_dev, st->st_ino);
++	struct dir_hash_entry *entry;
++
++	if (!args->dir_hash) {
++		/* allocate the directory hash table */
++		args->dir_hash = calloc(DIR_HASH_SIZE, sizeof(*args->dir_hash));
++		if (!args->dir_hash)
++			return -1;
++	}
++
++	entry = args->dir_hash[bucket];
++	while (entry) {
++		if (entry->dev == st->st_dev && entry->ino == st->st_ino)
+ 			return 1;
++		entry = entry->next;
++	}
++
++	entry = malloc(sizeof(*entry));
++	if (!entry)
++		return -1;
++
++	entry->dev = st->st_dev;
++	entry->ino = st->st_ino;
++	entry->next = args->dir_hash[bucket];
++	args->dir_hash[bucket] = entry;
+ 	return 0;
+ }
+ 
+-static int walk_tree_rec(struct walk_tree_args *args)
++static char *new_dirname(const char *dirname, const char *pathname)
+ {
+-	int follow_symlinks = (args->walk_flags & WALK_TREE_LOGICAL) ||
+-			      ((args->walk_flags & WALK_TREE_DEREFERENCE) &&
+-			       !(args->walk_flags & WALK_TREE_PHYSICAL) &&
+-			       args->depth == 0);
+-	int have_dir_stat = 0, flags = args->walk_flags, err;
+-	struct entry_handle dir;
+-
+-	/*
+-	 * If (walk_flags & WALK_TREE_PHYSICAL), do not traverse symlinks.
+-	 * If (walk_flags & WALK_TREE_LOGICAL), traverse all symlinks.
+-	 * Otherwise, traverse only top-level symlinks.
+-	 */
+-	if (args->depth == 0)
+-		flags |= WALK_TREE_TOPLEVEL;
++	size_t dirlen, pathlen;
++	char *newname, *n;
++	int need_slash;
++
++	if (*dirname == '\0' && *pathname == '.' &&
++	    (*(pathname+1) == '/' || *(pathname+1) == '\0')) {
++		pathname++;
++		while (*pathname == '/')
++			pathname++;
++	}
+ 
+-	if (lstat(args->path, &args->st) != 0)
+-		return args->func(args->path, NULL, flags | WALK_TREE_FAILED,
+-				  args->arg);
++	dirlen = strlen(dirname);
++	pathlen = strlen(pathname);
++	need_slash = (pathlen > 0 && pathname[pathlen - 1] != '/');
++	n = newname = malloc(dirlen + pathlen + need_slash + 1);
++	if (newname == NULL)
++		return NULL;
++	memcpy(n, dirname, dirlen);
++	n += dirlen;
++	memcpy(n, pathname, pathlen);
++	n += pathlen;
++	if (need_slash)
++		*n++ = '/';
++	*n++ = '\0';
++	return newname;
++}
+ 
+-	if (flags & WALK_TREE_ONE_FILESYSTEM) {
+-		if (args->dev == 0)
+-			args->dev = args->st.st_dev;
+-		else if (args->st.st_dev != args->dev)
+-			return 0;
+-	}
++static int walk_tree_rec(int dirfd, const char *dirname, const char *pathname,
++			 unsigned char dirtype, struct walk_tree_args *args,
++			 struct dir_stack_entry *parent_dir)
++{
++	enum walk_flags walk_flags = args->walk_flags;
++	struct dir_stack_entry this_dir = {
++		.parent = parent_dir,
++	};
++	int follow;
++	struct stat st;
++	char *mydirname = NULL;
++	int dir_open_flags;
++	int fd = -1;
++	struct dirent *entry;
++	int err = 0;
+ 
+-	if (S_ISLNK(args->st.st_mode)) {
+-		flags |= WALK_TREE_SYMLINK;
+-		if ((flags & WALK_TREE_DEREFERENCE) ||
+-		    ((flags & WALK_TREE_TOPLEVEL) &&
+-		     (flags & WALK_TREE_DEREFERENCE_TOPLEVEL))) {
+-			if (stat(args->path, &args->st) != 0)
+-				return args->func(args->path, NULL,
+-						  flags | WALK_TREE_FAILED,
+-						  args->arg);
+-			dir.dev = args->st.st_dev;
+-			dir.ino = args->st.st_ino;
+-			have_dir_stat = 1;
++	if (args->depth == 0)
++		walk_flags |= WALK_TREE_TOPLEVEL;
++
++	follow = (walk_flags & WALK_TREE_LOGICAL) ||
++		 (!(walk_flags & WALK_TREE_PHYSICAL) && !args->depth);
++
++	if (!(walk_flags & WALK_TREE_RECURSIVE) ||
++	    (dirtype != DT_UNKNOWN &&
++	     dirtype != DT_DIR &&
++	     (dirtype != DT_LNK ||
++	      ((walk_flags & WALK_TREE_PHYSICAL) &&
++	       !(walk_flags & WALK_TREE_TOPLEVEL)))))
++		goto visit_this;
++
++	if (args->num_dir_handles == 0) {
++		struct dir_stack_entry *top;
++
++close_another_parent:
++		/* Close the topmost parent directory handle still open. */
++		top = parent_dir;
++		if (!top || !top->stream) {
++			errno = ENFILE;
++			goto fail;
+ 		}
+-	} else if (S_ISDIR(args->st.st_mode)) {
+-		dir.dev = args->st.st_dev;
+-		dir.ino = args->st.st_ino;
+-		have_dir_stat = 1;
++		while (top->parent && top->parent->stream)
++			top = top->parent;
++		top->pos = telldir(top->stream);
++		closedir(top->stream);
++		top->stream = NULL;
++		args->num_dir_handles++;
+ 	}
+-	err = args->func(args->path, &args->st, flags, args->arg);
+-
+-	/*
+-	 * Recurse if WALK_TREE_RECURSIVE and the path is:
+-	 *      a dir not from a symlink
+-	 *      a link and follow_symlinks
+-	 */
+-        if ((flags & WALK_TREE_RECURSIVE) &&
+-	    ((!(flags & WALK_TREE_SYMLINK) && S_ISDIR(args->st.st_mode)) ||
+-	     ((flags & WALK_TREE_SYMLINK) && follow_symlinks))) {
+-		struct dirent *entry;
+-
+-		/*
+-		 * Check if we have already visited this directory to break
+-		 * endless loops.
+-		 *
+-		 * If we haven't stat()ed the file yet, do an opendir() for
+-		 * figuring out whether we have a directory, and check whether
+-		 * the directory has been visited afterwards. This saves a
+-		 * system call for each non-directory found.
+-		 */
+-		if (have_dir_stat && walk_tree_visited(&args->dirs, dir.dev, dir.ino))
+-			return err;
+-
+-		if (args->num_dir_handles == 0 && args->closed->prev != &args->dirs) {
+-close_another_dir:
+-			/* Close the topmost directory handle still open. */
+-			args->closed = args->closed->prev;
+-			args->closed->pos = telldir(args->closed->stream);
+-			closedir(args->closed->stream);
+-			args->closed->stream = NULL;
+-			args->num_dir_handles++;
+-		}
+ 
+-		dir.stream = opendir(args->path);
+-		if (!dir.stream) {
+-			if (errno == ENFILE && args->closed->prev != &args->dirs) {
+-				/* Ran out of file descriptors. */
+-				args->num_dir_handles = 0;
+-				goto close_another_dir;
+-			}
++	dir_open_flags = O_RDONLY | O_DIRECTORY | (follow ? 0 : O_NOFOLLOW);
++	fd = openat(dirfd, pathname, dir_open_flags);
++	if (fd == -1) {
++		if (errno == ENOTDIR || errno == ENOENT || errno == ELOOP)
++			goto visit_this;
++		if (errno != ENFILE)
++			goto fail;
++		/* Ran out of file descriptors. */
++		args->num_dir_handles = 0;
++		goto close_another_parent;
++	}
++	args->num_dir_handles--;
++	if (dirtype == DT_UNKNOWN && !follow)
++		dirtype = DT_DIR;
+ 
+-			/*
+-			 * PATH may be a symlink to a regular file, or a dead
+-			 * symlink which we didn't follow above.
+-			 */
+-			if (errno != ENOTDIR && errno != ENOENT)
+-				err += args->func(args->path, NULL, flags |
+-						 WALK_TREE_FAILED, args->arg);
+-			return err;
+-		}
++	if (fstat(fd, &st) == -1)
++		goto fail;
++	if (walk_flags & WALK_TREE_ONE_FILESYSTEM) {
++		if (args->dev == 0)
++			args->dev = st.st_dev;
++		else if (st.st_dev != args->dev)
++			goto dir_visited;
++	}
+ 
+-		/* See walk_tree_visited() comment above... */
+-		if (!have_dir_stat) {
+-			if (stat(args->path, &args->st) != 0)
+-				goto skip_dir;
+-			dir.dev = args->st.st_dev;
+-			dir.ino = args->st.st_ino;
+-			if (walk_tree_visited(&args->dirs, dir.dev, dir.ino))
+-				goto skip_dir;
++	if (walk_flags & WALK_TREE_LOGICAL) {
++		if (dir_visited(parent_dir, st.st_dev, st.st_ino))
++			goto dir_visited;
++		this_dir.dev = st.st_dev;
++		this_dir.ino = st.st_ino;
++	} else {
++		int ret = dir_hash_insert_unique(args, &st);
++		if (ret == 1)
++			goto dir_visited;
++		if (ret == -1)
++			goto fail;
++	}
++	goto visit_this;
++
++dir_visited:
++	close(fd);
++	fd = -1;
++	if (dirtype == DT_UNKNOWN) {
++		if (fstatat(dirfd, pathname, &st, AT_SYMLINK_NOFOLLOW) == -1)
++			goto fail;
++		dirtype = IFTODT(st.st_mode);
++	}
++	if (dirtype == DT_DIR)
++		goto out;
++
++visit_this:
++	err += args->func(dirfd, dirname, pathname, dirtype,
++			  walk_flags, args->arg);
++
++	if (fd == -1)
++		goto out;
++	this_dir.stream = fdopendir(fd);
++	if (this_dir.stream == NULL)
++		goto fail;
++
++	mydirname = new_dirname(dirname, pathname);
++	if (mydirname == NULL)
++		goto fail;
++
++	args->depth++;
++	while ((entry = readdir(this_dir.stream)) != NULL) {
++		if (!strcmp(entry->d_name, ".") ||
++		    !strcmp(entry->d_name, ".."))
++			continue;
++
++		err += walk_tree_rec(fd, mydirname, entry->d_name,
++				     entry->d_type, args, &this_dir);
++
++		if (!this_dir.stream) {
++			/* Reopen the directory handle. */
++			fd = openat(dirfd, pathname, dir_open_flags);
++			if (fd == -1)
++				goto fail_depth;
++			args->num_dir_handles--;
++			this_dir.stream = fdopendir(fd);
++			if (!this_dir.stream)
++				goto fail_depth;
++			seekdir(this_dir.stream, this_dir.pos);
+ 		}
++	}
++	args->depth--;
+ 
+-		/* Insert into the list of handles. */
+-		dir.next = args->dirs.next;
+-		dir.prev = &args->dirs;
+-		dir.prev->next = &dir;
+-		dir.next->prev = &dir;
+-		args->num_dir_handles--;
+-
+-		while ((entry = readdir(dir.stream)) != NULL) {
+-			char *path_end;
+-
+-			if (!strcmp(entry->d_name, ".") ||
+-			    !strcmp(entry->d_name, ".."))
+-				continue;
+-			path_end = strchr(args->path, 0);
+-			if ((path_end - args->path) + strlen(entry->d_name) + 1 >=
+-			    FILENAME_MAX) {
+-				errno = ENAMETOOLONG;
+-				err += args->func(args->path, NULL,
+-						  flags | WALK_TREE_FAILED,
+-						  args->arg);
+-				continue;
+-			}
+-			*path_end++ = '/';
+-			strcpy(path_end, entry->d_name);
+-			args->depth++;
+-			err += walk_tree_rec(args);
+-			args->depth--;
+-			*--path_end = 0;
+-			if (!dir.stream) {
+-				/* Reopen the directory handle. */
+-				dir.stream = opendir(args->path);
+-				if (!dir.stream)
+-					return err + args->func(args->path,
+-								NULL,
+-								flags | WALK_TREE_FAILED,
+-								args->arg);
+-				seekdir(dir.stream, dir.pos);
+-
+-				args->closed = args->closed->next;
+-				args->num_dir_handles--;
+-			}
+-		}
++	if (closedir(this_dir.stream) != 0) {
++		this_dir.stream = NULL;
++		goto fail;
++	}
++	this_dir.stream = NULL;
+ 
+-		/* Remove from the list of handles. */
+-		dir.prev->next = dir.next;
+-		dir.next->prev = dir.prev;
++out:
++	free(mydirname);
++	if (this_dir.stream) {
++		closedir(this_dir.stream);
++		args->num_dir_handles++;
++		fd = -1;
++	}
++	if (fd != -1) {
++		close(fd);
+ 		args->num_dir_handles++;
+-
+-	skip_dir:
+-		if (closedir(dir.stream) != 0)
+-			err += args->func(args->path, NULL,
+-					 flags | WALK_TREE_FAILED, args->arg);
+ 	}
+ 	return err;
++
++fail:
++	err += args->func(dirfd, dirname, pathname, dirtype,
++			  walk_flags | WALK_TREE_FAILED, args->arg);
++	goto out;
++
++fail_depth:
++	args->depth--;
++	goto fail;
+ }
+ 
+-int walk_tree(const char *path, int walk_flags, unsigned int num,
+-	      int (*func)(const char *, const struct stat *, int, void *),
++/*
++ * If (walk_flags & WALK_TREE_PHYSICAL), do not traverse symlinks.
++ * If (walk_flags & WALK_TREE_LOGICAL), traverse all symlinks.
++ * Otherwise, traverse only top-level symlinks.
++ */
++int walk_tree(const char *pathname, enum walk_flags walk_flags,
++	      int (*func)(int, const char *, const char *, unsigned char,
++			  enum walk_flags, void *),
+ 	      void *arg)
+ {
+-	struct walk_tree_args args;
+-
+-	args.num_dir_handles = num;
+-	if (args.num_dir_handles < 1) {
+-		struct rlimit rlimit;
+-
+-		args.num_dir_handles = 1;
+-		if (getrlimit(RLIMIT_NOFILE, &rlimit) == 0 &&
+-		    rlimit.rlim_cur >= 2)
+-			args.num_dir_handles = rlimit.rlim_cur / 2;
+-	}
+-	args.dirs.next = &args.dirs;
+-	args.dirs.prev = &args.dirs;
+-	args.closed = &args.dirs;
+-	if (strlen(path) >= FILENAME_MAX) {
+-		errno = ENAMETOOLONG;
+-		return func(path, NULL, WALK_TREE_FAILED, arg);
++	struct walk_tree_args args = {
++		.walk_flags = walk_flags,
++		.func = func,
++		.arg = arg,
++	};
++	struct rlimit rlimit;
++	int err;
++
++	/* number of directory file descriptors to keep open at a time */
++	if (getrlimit(RLIMIT_NOFILE, &rlimit) != 0)
++		rlimit.rlim_cur = 0;
++	args.num_dir_handles = rlimit.rlim_cur / 4 + 1;
++
++	err = walk_tree_rec(AT_FDCWD, "", pathname, DT_UNKNOWN, &args, NULL);
++
++	if (args.dir_hash) {
++		/* destroy the directory hash table */
++		int n;
++
++		for (n = 0; n < DIR_HASH_SIZE; n++) {
++			struct dir_hash_entry *entry = args.dir_hash[n];
++			while (entry) {
++				struct dir_hash_entry *next = entry->next;
++				free(entry);
++				entry = next;
++			}
++		}
++		free(args.dir_hash);
+ 	}
+-	strcpy(args.path, path);
+-	args.walk_flags = walk_flags;
+-	args.func = func;
+-	args.arg = arg;
+-	args.depth = 0;
+-	args.dev = 0;
+-
+-	return walk_tree_rec(&args);
++
++	return err;
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p5.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p5.patch
new file mode 100644
index 00000000000..13d39094776
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p5.patch
@@ -0,0 +1,63 @@
+From 4fce17388e014a06cca16914ab3b7e4a0d117856 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 19 Jun 2026 19:35:09 +0200
+Subject: [PATCH] setfattr: Do not ignore --no-dereference after --restore
+
+Process the entire command line before starting to restore all files specified
+by --restore=file options.  That way, --no-dereference will take effect even
+when it occurs at the end of the command line.
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=4fce17388e014a06cca16914ab3b7e4a0d117856]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 4fce17388e014a06cca16914ab3b7e4a0d117856)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ tools/setfattr.c | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/tools/setfattr.c b/tools/setfattr.c
+index 7906fe9..7b30159 100644
+--- a/tools/setfattr.c
++++ b/tools/setfattr.c
+@@ -193,6 +193,7 @@ void help(void)
+ 
+ int main(int argc, char *argv[])
+ {
++	char **restore_args = NULL;
+ 	int opt;
+ 
+ 	progname = basename(argv[0]);
+@@ -234,8 +235,14 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'B':  /* restore */
+-				opt_restore = 1;
+-				restore(optarg);
++				opt_restore++;
++				restore_args = realloc(restore_args,
++					opt_restore * sizeof(*restore_args));
++				if (!restore_args) {
++					perror(progname);
++					exit(1);
++				}
++				restore_args[opt_restore - 1] = optarg;
+ 				break;
+ 
+ 			case 'V':
+@@ -253,6 +260,12 @@ int main(int argc, char *argv[])
+ 	if (!(((opt_remove || opt_set) && optind < argc) || opt_restore))
+ 		goto synopsis;
+ 
++	if (opt_restore) {
++		for (opt = 0; opt < opt_restore; opt++)
++			restore(restore_args[opt]);
++		free(restore_args);
++	}
++
+ 	while (optind < argc) {
+ 		do_set(argv[optind], unquote(opt_name), opt_value);
+ 		optind++;
+-- 
+2.35.6
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p6.patch b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p6.patch
new file mode 100644
index 00000000000..20861c14bf5
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371-dependent_p6.patch
@@ -0,0 +1,140 @@
+From 1cea2fc5e8b5c8a5f29abf1141399e01a57a3154 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Sat, 20 Jun 2026 16:17:02 +0200
+Subject: [PATCH] Add openat2 syscall wrapper
+
+Add a syscall wrapper for the openat2() syscall added in kernel version v5.6
+from March 2020.
+
+On systems where the openat2() syscall is available but shouldn't be used, use
+the --disable-openat2 configure option.
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=1cea2fc5e8b5c8a5f29abf1141399e01a57a3154]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 1cea2fc5e8b5c8a5f29abf1141399e01a57a3154)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ configure.ac          | 14 ++++++++++++++
+ include/Makemodule.am |  1 +
+ include/openat2.h     | 16 ++++++++++++++++
+ libmisc/Makemodule.am |  7 +++++++
+ libmisc/openat2.c     | 30 ++++++++++++++++++++++++++++++
+ 5 files changed, 68 insertions(+)
+ create mode 100644 include/openat2.h
+ create mode 100644 libmisc/openat2.c
+
+diff --git a/configure.ac b/configure.ac
+index 0139fe6..7d13edf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -37,6 +37,20 @@ AC_SYS_LARGEFILE
+ AM_PROG_AR
+ LT_INIT
+ 
++AC_CHECK_FUNCS(openat2)
++AC_CHECK_HEADERS([linux/openat2.h])
++AC_CHECK_DECL([__NR_openat2], [], [], [[#include <sys/syscall.h>]])
++if test "x$ac_cv_have_decl___NR_openat2" = xyes -a \
++	"x$ac_cv_header_linux_openat2_h" = xyes; then
++	use_openat2=yes
++else
++	use_openat2=no
++fi
++AM_CONDITIONAL([USE_OPENAT2], [test "x$use_openat2" = xyes])
++AM_CONDITIONAL([HAVE_OPENAT2], [test "x$ac_cv_func_openat2" = xyes])
++AS_IF([test "x$use_openat2" = xyes],
++      [AC_DEFINE([USE_OPENAT2], [1], [Define to use openat2 syscall])])
++
+ AC_CHECK_FUNCS(getxattrat setxattrat listxattrat removexattrat)
+ AM_CONDITIONAL([NEED_XATTRAT],
+ 	       [test "x$ac_cv_func_getxattrat" = xno -o \
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 54f8ee0..3a0b50d 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -4,6 +4,7 @@ noinst_HEADERS += \
+ 	include/libattr.h \
+ 	include/misc.h \
+ 	include/nls.h \
++	include/openat2.h \
+ 	include/visibility-hidden.h \
+ 	include/walk_tree.h \
+ 	include/xattrat.h \
+diff --git a/include/openat2.h b/include/openat2.h
+new file mode 100644
+index 0000000..d267895
+--- /dev/null
++++ b/include/openat2.h
+@@ -0,0 +1,16 @@
++#ifndef MISC_OPENAT2_H
++#define MISC_OPENAT2_H
++
++#include "config.h"
++#include <stdint.h>
++
++#ifdef USE_OPENAT2
++#include <linux/openat2.h>
++
++#ifndef HAVE_OPENAT2
++int openat2(int dirfd, const char *pathname, const struct open_how *how,
++	    size_t size);
++#endif
++#endif
++
++#endif /* MISC_OPENAT2_H */
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index a42ae32..99b1a49 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -19,3 +19,10 @@ if NEED_XATTRAT
+ libmisc_la_SOURCES += \
+ 	libmisc/xattrat.c
+ endif
++
++if USE_OPENAT2
++if !HAVE_OPENAT2
++libmisc_la_SOURCES += \
++	libmisc/openat2.c
++endif
++endif
+diff --git a/libmisc/openat2.c b/libmisc/openat2.c
+new file mode 100644
+index 0000000..bdc78e1
+--- /dev/null
++++ b/libmisc/openat2.c
+@@ -0,0 +1,30 @@
++/*
++  File: openat2.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/syscall.h>
++#include <unistd.h>
++
++#include "openat2.h"
++
++int openat2(int dirfd, const char *pathname, const struct open_how *how,
++	    size_t size)
++{
++	return syscall(__NR_openat2, dirfd, pathname, how, size);
++}
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371_p1.patch b/meta/recipes-support/attr/attr/CVE-2026-54371_p1.patch
new file mode 100644
index 00000000000..7762c1b8685
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371_p1.patch
@@ -0,0 +1,390 @@
+From 641ea6fcc556c1f34b77efb9cd3f876dff0a0a07 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 17:30:22 +0200
+Subject: [PATCH] harden getfattr
+
+With this commit, the behavior of option -R (--recursive) changes as follows
+when used together with -h (--no-dereference): previously, after setting things
+up as follows:
+
+  $ mkdir d
+  $ touch d/f
+  $ setfattr -n user.name -v value d/f
+  $ ln -s d l
+
+The following command:
+
+  $ getfattr -Rdh l
+
+would produce no output because the -h (--no-dereference) option prevented
+getfattr from following l and resursing into d.  This was wrong: the -h
+(--no-dereference) option is supposed to control whether to dereference the
+files visited, but not which files are visited.  So with this commit, the
+following output will be produced instead:
+
+  $ getfattr -Rdh l
+  > # file: l/f
+  > user.name="value"
+  >
+
+This is because by default, getfattr follows symbolic links specified on the
+command line, but not symbolic links encountered while traversing the directory
+tree.  The -L (--logical) option changes the behavior to always follow symbolic
+links, while the -P (--physical) option changes the behavior to never follow
+them.
+
+Fixes: CVE-2026-54371 ("attr < 2.6.0 Symlink Traversal Privilege Escalation via getfattr")
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=641ea6fcc556c1f34b77efb9cd3f876dff0a0a07]
+
+Backport Changes:
+- Retained the attr 2.5.2 non-static declarations because the unrelated
+  tools cleanup commit is not required by the security fix.
+- Kept the existing getfattr.test filename used by the 2.5.2 ptest harness.
+- Included seven sort-getfattr-output pipelines in the root test and
+  the helper's security.selinux filter from upstream commit
+  303335494a326026bc37e8d83ca47fa1a4d8dde6 so output remains
+  stable on SELinux hosts.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 641ea6fcc556c1f34b77efb9cd3f876dff0a0a07)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ man/man1/getfattr.1       |   3 +-
+ test/root/getfattr.test   |  20 +++++---
+ test/sort-getfattr-output |   6 +++++-
+ tools/getfattr.c          | 100 ++++++++++++++++++++++------------------
+ 4 files changed, 73 insertions(+), 56 deletions(-)
+
+diff --git a/man/man1/getfattr.1 b/man/man1/getfattr.1
+index df8bb8a..c527271 100644
+--- a/man/man1/getfattr.1
++++ b/man/man1/getfattr.1
+@@ -79,8 +79,7 @@ while strings encoded as hexadecimal and base64 are prefixed with
+ .TP
+ .BR \-h ", " \-\-no-dereference
+ Do not dereference symlinks. Instead of the file a symlink refers to, the
+-symlink itself is examined.  Unless doing a logical (\-L) traversal, do not
+-traverse symlinks to directories.
++symlink itself is examined.
+ .TP
+ .BR \-m " \f2pattern\f1, " \-\-match "=\f2pattern\f1"
+ Only include attributes with names matching the regular expression
+diff --git a/test/root/getfattr.test b/test/root/getfattr.test
+index 8319de7..4fb0754 100644
+--- a/test/root/getfattr.test
++++ b/test/root/getfattr.test
+@@ -11,19 +11,19 @@ Cry immediately if we are not running as root.
+ 	$ setfattr -h -n trusted.test -v test l
+ 
+ This case should be obvious:
+-	$ getfattr -m- -d f
++	$ getfattr -m- -d f | sort-getfattr-output
+ 	> # file: f
+ 	> user.test="test"
+ 	>
+ 
+ Without -h, we dereference symlinks:
+-	$ getfattr -m- -d l
++	$ getfattr -m- -d l | sort-getfattr-output
+ 	> # file: l
+ 	> user.test="test"
+ 	>
+ 
+ With -h, we do not dereference symlinks:
+-	$ getfattr -m- -hd l
++	$ getfattr -m- -hd l | sort-getfattr-output
+ 	> # file: l
+ 	> trusted.test="test"
+ 	>
+@@ -55,7 +55,13 @@ Make sure we follow symlinks on the command line only when we should:
+ 	> user.test="test"
+ 	>
+ 
+-	$ getfattr -m- -Rhd here
++	$ getfattr -m- -Rhd here | sort-getfattr-output
++	> # file: here/f
++	> user.test="test"
++	>
++	> # file: here/l
++	> trusted.test="test"
++	>
+ 
+ 	$ getfattr -m- -RLhd here | sort-getfattr-output
+ 	> # file: here/f
+@@ -65,7 +71,7 @@ Make sure we follow symlinks on the command line only when we should:
+ 	> trusted.test="test"
+ 	>
+ 
+-	$ getfattr -m- -RPhd here
++	$ getfattr -m- -RPhd here | sort-getfattr-output
+ 
+ Make sure we recurse into sub-directories:
+ 	$ mkdir sub
+@@ -89,7 +95,7 @@ Make sure we recurse into sub-directories:
+ Make sure we follow symlinks to directories only when we should:
+ 	$ mkdir sub2
+ 	$ ln -s ../sub sub2/to-sub
+-	$ getfattr -m- -Rhd sub2
++	$ getfattr -m- -Rhd sub2 | sort-getfattr-output
+ 
+ 	$ getfattr -m- -RLhd sub2 | sort-getfattr-output
+ 	> # file: sub2/to-sub/f
+@@ -99,7 +105,7 @@ Make sure we follow symlinks to directories only when we should:
+ 	> trusted.test="test"
+ 	>
+ 
+-	$ getfattr -m- -RPhd sub2
++	$ getfattr -m- -RPhd sub2 | sort-getfattr-output
+ 
+ Symlink loop detection:
+ 	$ ln -s .. sub/up
+diff --git a/test/sort-getfattr-output b/test/sort-getfattr-output
+index 9901ed3..1d5d135 100755
+--- a/test/sort-getfattr-output
++++ b/test/sort-getfattr-output
+@@ -1,4 +1,8 @@
+ #! /usr/bin/perl -w
+ 
+ undef $/;
+-print join("\n\n", sort split(/\n\n/, <>)), "\n\n";
++my @blocks = sort split(/\n\n/, <>);
++for my $block (@blocks) {
++    my @lines = grep { !/^security\.selinux/ } split(/\n/, $block);
++    print join("\n", @lines) . "\n\n" if @lines > 1;
++}
+diff --git a/tools/getfattr.c b/tools/getfattr.c
+index c0b733d..2823578 100644
+--- a/tools/getfattr.c
++++ b/tools/getfattr.c
+@@ -24,6 +24,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <fcntl.h>
+ #include <errno.h>
+ #include <ctype.h>
+ #include <getopt.h>
+@@ -32,6 +33,7 @@
+ #include <libgen.h>
+ #include <sys/xattr.h>
+ 
++#include "xattrat_compat.h"
+ #include "walk_tree.h"
+ #include "misc.h"
+ 
+@@ -55,7 +57,8 @@ static const struct option long_options[] = {
+ 	{ NULL,			0, 0, 0 }
+ };
+ 
+-int walk_flags = WALK_TREE_DEREFERENCE;
++enum walk_flags walk_flags = 0;
++static int at_flags = 0;
+ int opt_dump;  /* dump attribute values (or only list the names) */
+ char *opt_name;  /* dump named attributes */
+ char *opt_name_pattern = "^user\\.";  /* include only matching names */
+@@ -80,18 +83,6 @@ static const char *xquote(const char *str, const char *quote_chars)
+ 	return q;
+ }
+ 
+-int do_getxattr(const char *path, const char *name, void *value, size_t size)
+-{
+-	return ((walk_flags & WALK_TREE_DEREFERENCE) ?
+-		getxattr : lgetxattr)(path, name, value, size);
+-}
+-
+-int do_listxattr(const char *path, char *list, size_t size)
+-{
+-	return ((walk_flags & WALK_TREE_DEREFERENCE) ?
+-		listxattr : llistxattr)(path, list, size);
+-}
+-
+ const char *strerror_ea(int err)
+ {
+ #ifdef __linux__
+@@ -229,7 +220,9 @@ const char *encode(const char *value, size_t *size)
+ 	return encoded;
+ }
+ 
+-int print_attribute(const char *path, const char *name, int *header_printed)
++int print_attribute(int dirfd, const char *dirname, const char *pathname,
++			   const char *fullname, const char *name,
++			   int *header_printed)
+ {
+ 	static char *value;
+ 	static size_t value_size;
+@@ -237,9 +230,9 @@ int print_attribute(const char *path, const char *name, int *header_printed)
+ 	size_t length = 0;
+ 
+ 	if (opt_dump || opt_value_only) {
+-		rval = do_getxattr(path, name, NULL, 0);
++		rval = getxattrat(dirfd, pathname, at_flags, name, NULL, 0);
+ 		if (rval < 0) {
+-			fprintf(stderr, "%s: ", xquote(path, "\n\r"));
++			fprintf(stderr, "%s: ", xquote(fullname, "\n\r"));
+ 			fprintf(stderr, "%s: %s\n", xquote(name, "\n\r"),
+ 				strerror_ea(errno));
+ 			return 1;
+@@ -249,9 +242,10 @@ int print_attribute(const char *path, const char *name, int *header_printed)
+ 			had_errors++;
+ 			return 1;
+ 		}
+-		rval = do_getxattr(path, name, value, value_size);
++		rval = getxattrat(dirfd, pathname, at_flags, name, value,
++				   value_size);
+ 		if (rval < 0) {
+-			fprintf(stderr, "%s: ", xquote(path, "\n\r"));
++			fprintf(stderr, "%s: ", xquote(fullname, "\n\r"));
+ 			fprintf(stderr, "%s: %s\n", xquote(name, "\n\r"),
+ 				strerror_ea(errno));
+ 			return 1;
+@@ -260,24 +254,20 @@ int print_attribute(const char *path, const char *name, int *header_printed)
+ 	}
+ 
+ 	if (opt_strip_leading_slash) {
+-		if (*path == '/') {
++		if (*fullname == '/') {
+ 			if (!absolute_warning) {
+-				fprintf(stderr, _("%s: Removing leading '/' "
+-					"from absolute path names\n"),
++				fprintf(stderr, _("%s: Removing leading "
++					"'/' from absolute path names\n"),
+ 					progname);
+ 				absolute_warning = 1;
+ 			}
+-			while (*path == '/')
+-				path++;
+-		} else if (*path == '.' && *(path+1) == '/')
+-			while (*++path == '/')
+-				/* nothing */ ;
+-		if (*path == '\0')
+-			path = ".";
++			while (*fullname == '/')
++				fullname++;
++		}
+ 	}
+ 
+ 	if (!*header_printed && !opt_value_only) {
+-		printf("# file: %s\n", xquote(path, "\n\r"));
++		printf("# file: %s\n", xquote(fullname, "\n\r"));
+ 		*header_printed = 1;
+ 	}
+ 
+@@ -294,7 +284,8 @@ int print_attribute(const char *path, const char *name, int *header_printed)
+ 	return 0;
+ }
+ 
+-int list_attributes(const char *path, int *header_printed)
++int list_attributes(int dirfd, const char *dirname, const char *pathname,
++			   const char *fullname, int *header_printed)
+ {
+ 	static char *list;
+ 	static size_t list_size;
+@@ -304,10 +295,10 @@ int list_attributes(const char *path, int *header_printed)
+ 	ssize_t length;
+ 	char *l;
+ 
+-	length = do_listxattr(path, NULL, 0);
++	length = listxattrat(dirfd, pathname, at_flags, NULL, 0);
+ 	if (length < 0) {
+-		fprintf(stderr, "%s: %s: %s\n", progname, xquote(path, "\n\r"),
+-			strerror_ea(errno));
++		fprintf(stderr, "%s: %s: %s\n", progname,
++			xquote(fullname, "\n\r"), strerror_ea(errno));
+ 		had_errors++;
+ 		return 1;
+ 	} else if (length == 0)
+@@ -319,9 +310,10 @@ int list_attributes(const char *path, int *header_printed)
+ 		return 1;
+ 	}
+ 
+-	length = do_listxattr(path, list, list_size);
++	length = listxattrat(dirfd, pathname, at_flags, list, list_size);
+ 	if (length < 0) {
+-		perror(xquote(path, "\n\r"));
++		fprintf(stderr, "%s: %s: %s\n", progname,
++			xquote(fullname, "\n\r"), strerror_ea(errno));
+ 		had_errors++;
+ 		return 1;
+ 	}
+@@ -351,27 +343,44 @@ int list_attributes(const char *path, int *header_printed)
+ 		int n;
+ 
+ 		for (n = 0; n < num_names; n++)
+-			print_attribute(path, names[n], header_printed);
++			print_attribute(dirfd, dirname, pathname, fullname,
++					names[n], header_printed);
+ 	}
+ 	return 0;
+ }
+ 
+-int do_print(const char *path, const struct stat *stat, int walk_flags,
+-	     void *unused)
++int do_print(int dirfd, const char *dirname, const char *pathname,
++		    unsigned char dirtype, enum walk_flags walk_flags,
++		    void *unused)
+ {
++	static char *__fullname;
++	const char *fullname;
+ 	int header_printed = 0;
+ 	int err = 0;
+ 
++	if (*dirname) {
++		free(__fullname);
++		__fullname = NULL;
++		if (asprintf(&__fullname, "%s%s", dirname, pathname) == -1) {
++			fprintf(stderr, "%s: %s", progname, strerror(errno));
++			return 1;
++		}
++		fullname = __fullname;
++	} else
++		fullname = pathname;
++
+ 	if (walk_flags & WALK_TREE_FAILED) {
+-		fprintf(stderr, "%s: %s: %s\n", progname, xquote(path, "\n\r"),
+-			strerror(errno));
++		fprintf(stderr, "%s: %s: %s\n", progname,
++			xquote(fullname, "\n\r"), strerror(errno));
+ 		return 1;
+ 	}
+ 
+ 	if (opt_name)
+-		err = print_attribute(path, opt_name, &header_printed);
++		err = print_attribute(dirfd, dirname, pathname, fullname,
++				      opt_name, &header_printed);
+ 	else
+-		err = list_attributes(path, &header_printed);
++		err = list_attributes(dirfd, dirname, pathname, fullname,
++				      &header_printed);
+ 
+ 	if (header_printed)
+ 		puts("");
+@@ -435,7 +444,7 @@ int main(int argc, char *argv[])
+ 				return 0;
+ 
+ 			case 'h': /* do not dereference symlinks */
+-				walk_flags &= ~WALK_TREE_DEREFERENCE;
++				at_flags |= AT_SYMLINK_NOFOLLOW;
+ 				break;
+ 
+ 			case 'n':  /* get named attribute */
+@@ -492,8 +501,8 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	while (optind < argc) {
+-		had_errors += walk_tree(argv[optind], walk_flags, 0,
+-					do_print, NULL);
++		had_errors += walk_tree(argv[optind], walk_flags, do_print,
++					NULL);
+ 		optind++;
+ 	}
+ 
+@@ -505,4 +514,3 @@ synopsis:
+ 		progname, CMD_LINE_SPEC, progname);
+ 	return 2;
+ }
+-
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/attr/CVE-2026-54371_p2.patch b/meta/recipes-support/attr/attr/CVE-2026-54371_p2.patch
new file mode 100644
index 00000000000..108b5bc1986
--- /dev/null
+++ b/meta/recipes-support/attr/attr/CVE-2026-54371_p2.patch
@@ -0,0 +1,476 @@
+From 3fb06b9ba314d37035d0877e6de313de754f1ac8 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Sun, 21 Jun 2026 01:46:49 +0200
+Subject: [PATCH] harden setfattr --restore
+
+In setfattr --restore, use functions that support the AT_SYMLINK_NOFOLLOW flag
+([l]setxattr() -> setxattrat(), [l]removexattr() -> removexattrat()).  Add a -P
+(--physical) option to use together with --restore.
+
+In physical restore mode, use openat2(RESOLVE_NO_SYMLINKS) for resolving the
+pathname components leading up to the last one.  Then, depending on the -h
+(--no-dereference) option, use the AT_SYMLINK_NOFOLLOW flag on the last
+pathname component.
+
+On systems where openat2() *is* available, warn when attempting a restore
+without also using the -P (--physical) and -h (--no-dereference) options as
+that can be dangerous.  The purpose of these warnings is to cause users to
+switch to using those options over time.
+
+These warnings can be disabled with the --disable-unsafe-restore-warnings
+configure option.
+
+On systems where openat2() *is not* available, do not warn about these
+conditions; this is to preserve the historic behavior when building this
+package on older systems.  On those systems, a physical restore will fail with
+ENOSYS ("Function not implemented").
+
+Fixes: CVE-2026-54371 ("attr < 2.6.0 Symlink Traversal Privilege Escalation via getfattr")
+
+CVE: CVE-2026-54371
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3fb06b9ba314d37035d0877e6de313de754f1ac8]
+
+Backport Changes:
+- Retained the attr 2.5.2 non-static declarations because the unrelated
+  tools cleanup commit is not required by the security fix.
+- Kept the existing .test filename used by the 2.5.2 ptest harness.
+- Replaced the original attr 2.5.2 static restore buffer directly because
+  prerequisite commit dcdab7724265 is not carried as a separate patch.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 3fb06b9ba314d37035d0877e6de313de754f1ac8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ configure.ac        |   9 +++
+ man/man1/setfattr.1 |   9 ++-
+ test/Makemodule.am  |   5 ++
+ test/restore.test   |  19 +++++
+ tools/setfattr.c    | 168 +++++++++++++++++++++++++++++++++++---------
+ 5 files changed, 174 insertions(+), 36 deletions(-)
+ create mode 100644 test/restore.test
+
+diff --git a/configure.ac b/configure.ac
+index 7d13edf..b13ac08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,6 +51,15 @@ AM_CONDITIONAL([HAVE_OPENAT2], [test "x$ac_cv_func_openat2" = xyes])
+ AS_IF([test "x$use_openat2" = xyes],
+       [AC_DEFINE([USE_OPENAT2], [1], [Define to use openat2 syscall])])
+ 
++AC_ARG_ENABLE([unsafe-restore-warnings],
++	[AS_HELP_STRING([--disable-unsafe-restore-warnings], [Disable warnings about unsafe restore operations])])
++if test "x$use_openat2" = xno; then
++	enable_unsafe_restore_warnings=no
++fi
++AM_CONDITIONAL([UNSAFE_RESTORE_WARNINGS], [test "x$enable_unsafe_restore_warnings" != xno])
++AS_IF([test "x$enable_unsafe_restore_warnings" != xno],
++      [AC_DEFINE([UNSAFE_RESTORE_WARNINGS], [1], [Define to enable unsafe restore warnings])])
++
+ AC_CHECK_FUNCS(getxattrat setxattrat listxattrat removexattrat)
+ AM_CONDITIONAL([NEED_XATTRAT],
+ 	       [test "x$ac_cv_func_getxattrat" = xno -o \
+diff --git a/man/man1/setfattr.1 b/man/man1/setfattr.1
+index e011ca7..d24135c 100644
+--- a/man/man1/setfattr.1
++++ b/man/man1/setfattr.1
+@@ -30,7 +30,7 @@ setfattr \- set extended attributes of filesystem objects
+ .nf
+ \f3setfattr\f1 [\f3\-h\f1] \f3\-n name\f1 [\f3\-v value\f1] \f3pathname\f1...
+ \f3setfattr\f1 [\f3\-h\f1] \f3\-x name\f1 \f3pathname\f1...
+-\f3setfattr\f1 [\f3\-h\f1] \f3\-\-restore=file\f1
++\f3setfattr\f1 [\f3\-hP\f1] \f3\-\-restore=file\f1
+ .fi
+ .SH DESCRIPTION
+ The 
+@@ -62,8 +62,11 @@ Remove the named extended attribute entirely.
+ .BR \-h ", " \-\-no-dereference
+ Do not follow symlinks.  If
+ .I pathname
+-is a symbolic link, it is not followed, but is instead itself the
+-inode being modified.
++is a symbolic link, it is not followed, but is instead modified itself.
++.TP
++.BR \-P ", " \-\-physical
++Do not traverse symbolic links in pathnames during a restore.  Can be combined
++with option \-h.
+ .TP
+ .BR \-\-restore =\f2file\f1
+ Restores extended attributes from file.
+diff --git a/test/Makemodule.am b/test/Makemodule.am
+index 8bfadb9..5279d8c 100644
+--- a/test/Makemodule.am
++++ b/test/Makemodule.am
+@@ -2,6 +2,11 @@ TESTS = \
+ 	test/attr.test \
+ 	test/root/getfattr.test
+ 
++if UNSAFE_RESTORE_WARNINGS
++TESTS += \
++	test/restore.test
++endif
++
+ EXTRA_DIST += \
+ 	test/README \
+ 	test/run \
+diff --git a/test/restore.test b/test/restore.test
+new file mode 100644
+index 0000000..f9fb0bc
+--- /dev/null
++++ b/test/restore.test
+@@ -0,0 +1,19 @@
++	$ mkdir d
++	$ touch d/f
++	$ touch d/l
++	$ setfattr -n user.name -v value d/f
++	$ [ "$(id -u)" != 0 ] || setfattr -h -n trusted.name -v value d/l
++
++	$ getfattr -RP d > physical
++
++	$ setfattr --restore=physical
++	> Warning: option --restore=file is unsafe without option -P (--physical) as it traverses symbolic links in pathnames
++	> Warning: option --restore=file is unsafe without option -h (--no-dereference) as it dereferences symbolic link pathnames
++
++	$ setfattr --restore=physical -h
++	> Warning: option --restore=file is unsafe without option -P (--physical) as it traverses symbolic links in pathnames
++
++	$ setfattr --restore=physical --physical
++	> Warning: option --restore=file is unsafe without option -h (--no-dereference) as it dereferences symbolic link pathnames
++
++	$ setfattr --restore=physical -h --physical
+diff --git a/tools/setfattr.c b/tools/setfattr.c
+index 7b30159..1fe3253 100644
+--- a/tools/setfattr.c
++++ b/tools/setfattr.c
+@@ -30,19 +30,25 @@
+ #include <ctype.h>
+ #include <libgen.h>
+ #include <sys/xattr.h>
++#include <unistd.h>
++#include <fcntl.h>
+ #include <errno.h>
++#include "openat2.h"
+ 
++#include "xattrat_compat.h"
+ #include "misc.h"
+ 
+-#define CMD_LINE_OPTIONS "n:x:v:h"
++#define CMD_LINE_OPTIONS "n:x:v:hP"
+ #define CMD_LINE_SPEC1 "{-n name} [-v value] [-h] file..."
+ #define CMD_LINE_SPEC2 "{-x name} [-h] file..."
++#define CMD_LINE_SPEC3 "[-hP] --restore=file"
+ 
+ static const struct option long_options[] = {
+ 	{ "name",		1, 0, 'n' }, 
+ 	{ "remove",		1, 0, 'x' },
+ 	{ "value",		1, 0, 'v' },
+ 	{ "no-dereference",	0, 0, 'h' },
++	{ "physical",		0, 0, 'P' },
+ 	{ "restore",		1, 0, 'B' },
+ 	{ "raw",		0, 0, CHAR_MAX + 1 },
+ 	{ "version",		0, 0, 'V' },
+@@ -57,13 +63,14 @@ int opt_remove;  /* remove an attribute */
+ int opt_restore;  /* restore has been run */
+ int opt_deref = 1;  /* dereference symbolic links */
+ int opt_raw;  /* attribute value is not encoded */
++static int opt_physical;
+ 
+ int had_errors;
+ const char *progname;
+ 
+-int do_set(const char *path, const char *name, const char *value);
++int do_set(int dirfd, const char *pathname, const char *fullpath,
++		  const char *name, const char *value);
+ const char *decode(const char *value, size_t *size);
+-int restore(const char *filename);
+ int hex_digit(char c);
+ int base64_digit(char c);
+ 
+@@ -87,25 +94,20 @@ static const char *xquote(const char *str, const char *quote_chars)
+ 	return q;
+ }
+ 
+-int do_setxattr(const char *path, const char *name,
+-		const void *value, size_t size)
+-{
+-	return (opt_deref ? setxattr : lsetxattr)(path, name, value, size, 0);
+-}
+-
+-int do_removexattr(const char *path, const char *name)
+-{
+-	return (opt_deref ? removexattr : lremovexattr)(path, name);
+-}
+-
+ int restore(const char *filename)
+ {
+-	static char *path;
+-	static size_t path_size;
++	char *fullpath = NULL;
++	size_t fullpath_size = 0;
+ 	FILE *file;
+ 	char *l;
+ 	int line = 0, backup_line, status = 0;
+-	
++	int dirfd = -1;
++	char *pathname, *dirname = NULL;
++#ifdef UNSAFE_RESTORE_WARNINGS
++	static int non_physical_restore_warning;
++	static int deref_restore_warning;
++#endif
++
+ 	if (strcmp(filename, "-") == 0)
+ 		file = stdin;
+ 	else {
+@@ -140,20 +142,85 @@ int restore(const char *filename)
+ 		} else
+ 			l += 8;
+ 		l = unquote(l);
+-		if (high_water_alloc((void **)&path, &path_size, strlen(l)+1)) {
++		if (high_water_alloc((void **)&fullpath, &fullpath_size, strlen(l)+1)) {
+ 			perror(progname);
+ 			status = 1;
+ 			goto cleanup;
+ 		}
+-		strcpy(path, l);
++		strcpy(fullpath, l);
++
++#ifdef UNSAFE_RESTORE_WARNINGS
++		if (!opt_physical && !non_physical_restore_warning) {
++			fprintf(stderr,
++				_("Warning: option --restore=file is unsafe "
++				  "without option -P (--physical) as it "
++				  "traverses symbolic links in pathnames\n"));
++			non_physical_restore_warning = 1;
++		}
++		if (opt_deref && !deref_restore_warning) {
++			fprintf(stderr,
++				_("Warning: option --restore=file is unsafe "
++				  "without option -h (--no-dereference) as it "
++				  "dereferences symbolic link pathnames\n"));
++			deref_restore_warning = 1;
++		}
++#endif
++
++		/* find the last pathname component */
++		pathname = fullpath + strlen(fullpath);
++		while (pathname > fullpath && pathname[-1] == '/')
++			pathname--;
++		while (pathname > fullpath && pathname[-1] != '/')
++			pathname--;
++
++		if (opt_physical && pathname != fullpath) {
++			dirname = malloc(pathname - fullpath + 1);
++			if (dirname == NULL) {
++				fprintf(stderr, "%s: %s\n", progname,
++					strerror(errno));
++				status = 1;
++				goto cleanup;
++			}
++			memcpy(dirname, fullpath, pathname - fullpath);
++			dirname[pathname - fullpath] = '\0';
++#ifdef USE_OPENAT2
++			struct open_how how = {
++				.flags = O_PATH | O_DIRECTORY,
++				.resolve = RESOLVE_NO_SYMLINKS,
++			};
++
++			dirfd = openat2(AT_FDCWD, dirname, &how, sizeof(how));
++#else
++			errno = ENOSYS;
++			dirfd = -1;
++#endif
++			if (dirfd == -1) {
++				fprintf(stderr,
++					_("%s: lookup of directory %s without "
++					  "following symlinks: %s\n"),
++					progname, dirname, strerror(errno));
++				status = 1;
++				goto cleanup;
++			}
++		} else {
++			pathname = fullpath;
++			dirfd = AT_FDCWD;
++		}
+ 
+ 		while ((l = next_line(file)) != NULL && *l != '\0') {
+ 			char *name = l, *value = strchr(l, '=');
+ 			line++;
+ 			if (value)
+ 				*value++ = '\0';
+-			status = do_set(path, unquote(name), value);
++			status = do_set(dirfd, pathname, fullpath,
++					unquote(name), value);
+ 		}
++		if (dirfd != -1 && dirfd != AT_FDCWD) {
++			close(dirfd);
++			dirfd = -1;
++		}
++		free(dirname);
++		dirname = NULL;
+ 		if (l == NULL)
+ 			break;
+ 		line++;
+@@ -166,8 +233,12 @@ int restore(const char *filename)
+ 	}
+ 
+ cleanup:
+-	if (path)
+-		free(path);
++	if (dirfd != -1 && dirfd != AT_FDCWD) {
++		close(dirfd);
++		dirfd = -1;
++	}
++	free(dirname);
++	free(fullpath);
+ 	if (file != stdin)
+ 		fclose(file);
+ 	if (status)
+@@ -180,11 +251,13 @@ void help(void)
+ 	printf(_("%s %s -- set extended attributes\n"), progname, VERSION);
+ 	printf(_("Usage: %s %s\n"), progname, CMD_LINE_SPEC1);
+ 	printf(_("       %s %s\n"), progname, CMD_LINE_SPEC2);
++	printf(_("       %s %s\n"), progname, CMD_LINE_SPEC3);
+ 	printf(_(
+ "  -n, --name=name         set the value of the named extended attribute\n"
+ "  -x, --remove=name       remove the named extended attribute\n"
+ "  -v, --value=value       use value as the attribute value\n"
+ "  -h, --no-dereference    do not dereference symbolic links\n"
++"  -P, --physical          do not traverse symbolic links during a restore\n"
+ "      --restore=file      restore extended attributes\n"
+ "      --raw               attribute value is not encoded\n"
+ "      --version           print version and exit\n"
+@@ -193,6 +266,7 @@ void help(void)
+ 
+ int main(int argc, char *argv[])
+ {
++	enum { UNDEFINED_MODE, SET_MODE, RESTORE_MODE } mode = UNDEFINED_MODE;
+ 	char **restore_args = NULL;
+ 	int opt;
+ 
+@@ -207,6 +281,9 @@ int main(int argc, char *argv[])
+ 		                  long_options, NULL)) != -1) {
+ 		switch(opt) {
+ 			case 'n':  /* attribute name */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (opt_name || opt_remove)
+ 					goto synopsis;
+ 				opt_name = optarg;
+@@ -218,16 +295,25 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'v':  /* attribute value */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (opt_value || opt_remove)
+ 					goto synopsis;
+ 				opt_value = optarg;
+ 				break;
+ 
+ 			case CHAR_MAX + 1:
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				opt_raw = 1;
+ 				break;
+ 
+ 			case 'x':  /* remove attribute */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (opt_name || opt_set)
+ 					goto synopsis;
+ 				opt_name = optarg;
+@@ -235,6 +321,9 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'B':  /* restore */
++				if (mode == SET_MODE)
++					goto synopsis;
++				mode = RESTORE_MODE;
+ 				opt_restore++;
+ 				restore_args = realloc(restore_args,
+ 					opt_restore * sizeof(*restore_args));
+@@ -245,6 +334,13 @@ int main(int argc, char *argv[])
+ 				restore_args[opt_restore - 1] = optarg;
+ 				break;
+ 
++			case 'P': /* --physical */
++				if (mode == SET_MODE)
++					goto synopsis;
++				mode = RESTORE_MODE;
++				opt_physical = 1;
++				break;
++
+ 			case 'V':
+ 				printf("%s " VERSION "\n", progname);
+ 				return 0;
+@@ -260,29 +356,35 @@ int main(int argc, char *argv[])
+ 	if (!(((opt_remove || opt_set) && optind < argc) || opt_restore))
+ 		goto synopsis;
+ 
+-	if (opt_restore) {
++	if (mode == RESTORE_MODE) {
+ 		for (opt = 0; opt < opt_restore; opt++)
+ 			restore(restore_args[opt]);
+ 		free(restore_args);
+ 	}
+ 
+ 	while (optind < argc) {
+-		do_set(argv[optind], unquote(opt_name), opt_value);
++		if (mode == RESTORE_MODE)
++			goto synopsis;
++		mode = SET_MODE;
++		do_set(AT_FDCWD, argv[optind], argv[optind], unquote(opt_name),
++		       opt_value);
+ 		optind++;
+ 	}
+ 
+ 	return (had_errors ? 1 : 0);
+ 
+ synopsis:
+-	fprintf(stderr, _("Usage: %s %s\n"
+-			  "       %s %s\n"
+-	                  "Try `%s --help' for more information.\n"),
+-		progname, CMD_LINE_SPEC1, progname, CMD_LINE_SPEC2, progname);
++	fprintf(stderr, _("Usage: %s %s\n"), progname, CMD_LINE_SPEC1);
++	fprintf(stderr, _("       %s %s\n"), progname, CMD_LINE_SPEC2);
++	fprintf(stderr, _("       %s %s\n"), progname, CMD_LINE_SPEC3);
++	fprintf(stderr, _("Try `%s --help' for more information.\n"), progname);
+ 	return 2;
+ }
+ 
+-int do_set(const char *path, const char *name, const char *value)
++int do_set(int dirfd, const char *pathname, const char *fullpath,
++		  const char *name, const char *value)
+ {
++	int at_flags = opt_deref ? 0 : AT_SYMLINK_NOFOLLOW;
+ 	size_t size = 0;
+ 	int error;
+ 
+@@ -294,13 +396,14 @@ int do_set(const char *path, const char *name, const char *value)
+ 			return 1;
+ 	}
+ 	if (opt_set || opt_restore)
+-		error = do_setxattr(path, name, value, size);
++		error = setxattrat(dirfd, pathname, at_flags,
++				   name, value, size, 0);
+ 	else
+-		error = do_removexattr(path, name);
++		error = removexattrat(dirfd, pathname, at_flags, name);
+ 
+ 	if (error < 0) {
+ 		fprintf(stderr, "%s: %s: %s\n",
+-			progname, xquote(path, "\n\r"), strerror_ea(errno));
++			progname, xquote(fullpath, "\n\r"), strerror_ea(errno));
+ 		had_errors++;
+ 		return 1;
+ 	}
+@@ -486,4 +589,3 @@ int base64_digit(char c)
+ 	else
+ 		return -1;
+ }
+-
+-- 
+2.35.6
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-support/attr/attr_2.5.2.bb
index 390445b959f..9eb142e17ea 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.5.2.bb
@@ -17,6 +17,14 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
            file://run-ptest \
            file://0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch \
+           file://CVE-2026-54371-dependent_p1.patch \
+           file://CVE-2026-54371-dependent_p2.patch \
+           file://CVE-2026-54371-dependent_p3.patch \
+           file://CVE-2026-54371-dependent_p4.patch \
+           file://CVE-2026-54371-dependent_p5.patch \
+           file://CVE-2026-54371-dependent_p6.patch \
+           file://CVE-2026-54371_p1.patch \
+           file://CVE-2026-54371_p2.patch \
 "
 
 SRC_URI[sha256sum] = "39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87"
@@ -35,7 +43,7 @@ ALTERNATIVE_TARGET[getfattr] = "${bindir}/getfattr"
 do_install_ptest() {
     install -m755 ${S}/test/run ${S}/test/sort-getfattr-output ${D}${PTEST_PATH}/
 
-    for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+    for t in $(makefile-getvar ${B}/Makefile TESTS); do
         install -m644 ${S}/$t ${D}${PTEST_PATH}/
     done
 }
-- 
2.35.6

