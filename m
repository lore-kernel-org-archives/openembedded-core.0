Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2488.1793771623174818563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iONBEiWE;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=88589; q=dns/txt;
  s=iport01; t=1793771623; x=1794981223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JNJOWnJPe0sb8ODSUMLykx1ByFgU23TSVlyeLkie3G4=;
  b=iONBEiWE07R3p68sLc0WAnWkj/riLAUa0Qo2VuA/RmAYQ7wa2jEVfWhf
   q/ZjxQIxNj8nIOYc1HcjS3b+dgLSvogFO5Q/3qIWheKw0okciEmaqVKD/
   f249QI2RPZqLc4vi25TH2GZ7zPINBh4nLRkEaJMbejnjbd8TavsYuHqpU
   niSJpNSfB3lR+UlCX//f2c/pvW97PLD0gW10bTsIJS3G9NI0S5HEWiwQX
   9gVr++k0GP+37Ld1C1IXSJ3hsZFa/Hn8xHUGxG3Rdpp2QZg40zOXp+D+C
   1YS7kgF2B5HtfcwpVZgu5OHXe7muYI16IMvWr+S//ZwDrSy3kTr/f+P2J
   Q==;
X-CSE-ConnectionGUID: q5cIXO6wSR+TqHvLZKAh2A==
X-CSE-MsgGUID: 1ugwHMWRTLihZIo7Zz1JZQ==
X-IPAS-Result: =?us-ascii?q?A0BmAgCOx+pq/43/Ja1aFggBAQsSDIIFC4JXdWBDSQMBl?=
 =?us-ascii?q?kcDgROKUpI7FIFkBg8BAQEPLgYdBAEBghKCcwKOHAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGFQE5DZASAQIBAwEZAQwLARgBLRAcA?=
 =?us-ascii?q?wECFxggBwQjCBkJgnkBgjoDNwMRukGBeTOBAYMpAT8CQ1DYTA2CWgELFAGBO?=
 =?us-ascii?q?IVAgn+FJF0YAYR9JxsbgXKBFYE7gTh2gQWBGjcLAQMYfgsEI14PhW8Egg0Vg?=
 =?us-ascii?q?QyBWhgGZYIiiXYCiEJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGYLGgVhCAINDHQ5EDAeJC8FHCZAGwoUGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hki2CCVQtBgEBLgIMHQ0DERMBBwwXARc2AzUMBwEWHhMYBQEFAQEnDwILB?=
 =?us-ascii?q?pMAAxMHkBaCIYE1nh4dMHEKKIN4hhqGCo0+ggCFfBozhASBV5JCkW1nC5h9j?=
 =?us-ascii?q?goWg3SDU41YT02EaYFoPIFZcBU7gmcJCQFAGQ+BHAWNDQsLgVEngWiDKoFpy?=
 =?us-ascii?q?UgmMgIBAQcDLwEBBwIHDgMLgWiQAAEQF3ZgAQE?=
IronPort-Data: A9a23:Kmto+ajbMec9UmBNmxLuot/FX161MREKZh0ujC45NGQN5FlHY01je
 htvW2qCbqyCYWX0edAkO4qw9UICsJ/VmN4wHQQ5+SA9HihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUBp+1WMUYQ6
 sciawwUTg6ntcGfwOiSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DRHZkNxR3Cz
 o7A1z3kDQ46EeOl9R6E8kCNgbD9j3rZartHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:rPOLS60zJquP5xa6qEQbZAqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:gn//aGwVk+1XHmfw1meaBgUNR8sEQlqD00zqYHOhKXhNep68SQW5rfY=
X-Talos-MUID: 9a23:qO8xVgrVxj8hio4ae/gez2h/O9hIxpuUNGQMkacnvJa2J3VSCQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543040332"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 05:53:40 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B745D180005D5;
	Wed,  4 Nov 2026 05:53:40 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 61FDCCBF202; Tue,  3 Nov 2026 21:53:40 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/3] acl: fix CVE-2026-54369
Date: Tue,  3 Nov 2026 21:53:34 -0800
Message-Id: <20261104055335.2080900-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104055335.2080900-1-dkelaiya@cisco.com>
References: <20261104055335.2080900-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249329
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the libacl _at API implementation [1] identified by [2] to
ACL 2.3.2. These directory-relative APIs support AT_SYMLINK_NOFOLLOW
and AT_EMPTY_PATH. Existing pathname APIs retain their historical
symlink-following behavior; callers must adopt the new interfaces.

Include the following prerequisite changes:

Extract visibility-hidden.h [5]. The proc-self-fd compatibility
helpers introduced by [7] include this header and use its hidden
annotation for internal declarations.

Add xattrat syscall wrappers [6]. The compatibility functions in
[7] call these wrappers when libc lacks the corresponding
interfaces. Include only the errno.h correction from [10] so
errno and ENOSYS are declared in the fallback paths.

Add xattrat compatibility implementations [7]. The new ACL APIs
use these functions to support older kernels and unsupported
O_PATH/AT_EMPTY_PATH combinations through the fallbacks described
upstream [9].

Include API documentation [3] and clarification of the legacy
functions' symlink behavior [4] so applications can correctly adopt
the new interfaces [8]. These documentation changes explain the
security-relevant behavior without changing the legacy API contract.

The shared helpers and new APIs also support the following
CVE-2026-54370 utility hardening. The preceding tar change prevents
name conflicts with the newly introduced libacl declarations.

[1] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=5906d2868ec8d3b08be556153696e6b1122eeeda
[2] https://security-tracker.debian.org/tracker/CVE-2026-54369
[3] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=0071c6d1fea0a8a6270333baa85fb609be325c26
[4] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=170dbd3beff9bd5bdab3f72db1a04bf282f6087c
[5] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=60d3c0c7539f4082ab963c9b20a8fa3ac0fbc73e
[6] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=4eb92d4d449d16fdae4f9ba332809ff9bfd47e65
[7] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=ea0b56cdd9b3d537da2366dacbbfc93fefce152a
[8] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=Instead%2C%20version%202.4.0,control%20when%20to%20follow%20symbolic%20links.
[9] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=The%20xattrat%28%29%20system%20calls,these%20operations%20will%20fail.
[10] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=a009adf38ed8cf3cc2ad8bfb7060630caba0bdaa

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../acl/CVE-2026-54369-dependent_p1.patch     |  69 ++
 .../acl/CVE-2026-54369-dependent_p2.patch     | 200 ++++
 .../acl/CVE-2026-54369-dependent_p3.patch     | 712 +++++++++++++
 .../attr/acl/CVE-2026-54369_p1.patch          | 719 +++++++++++++
 .../attr/acl/CVE-2026-54369_p2.patch          | 957 ++++++++++++++++++
 .../attr/acl/CVE-2026-54369_p3.patch          | 109 ++
 meta/recipes-support/attr/acl_2.3.2.bb        |   6 +
 7 files changed, 2772 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch

diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch
new file mode 100644
index 00000000000..c1fd57720f6
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch
@@ -0,0 +1,69 @@
+From 104000f79a011db7731d8fcfdfbdb750d79a62b7 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 16:56:37 +0200
+Subject: [PATCH] Split off visibility attribute header
+
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=60d3c0c7539f4082ab963c9b20a8fa3ac0fbc73e]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 60d3c0c7539f4082ab963c9b20a8fa3ac0fbc73e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/Makemodule.am       |  1 +
+ include/misc.h              |  8 +-------
+ include/visibility-hidden.h | 11 +++++++++++
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+ create mode 100644 include/visibility-hidden.h
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 89bc669..dd95135 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -3,6 +3,7 @@ noinst_HEADERS += \
+ 	include/acl.h \
+ 	include/acl_ea.h \
+ 	include/misc.h \
++	include/visibility-hidden.h \
+ 	include/walk_tree.h
+ 
+ SUBST_INSTALL_HEADER = \
+diff --git a/include/misc.h b/include/misc.h
+index 52cfec4..ec095d9 100644
+--- a/include/misc.h
++++ b/include/misc.h
+@@ -20,13 +20,7 @@
+ 
+ #include <stdio.h>
+ #include <sys/types.h>
+-
+-/* Mark library internal functions as hidden */
+-#if defined(HAVE_VISIBILITY_ATTRIBUTE)
+-# define hidden __attribute__((visibility("hidden")))
+-#else
+-# define hidden /* hidden */
+-#endif
++#include "include/visibility-hidden.h"
+ 
+ hidden int __acl_high_water_alloc(void **buf, size_t *bufsize, size_t newsize);
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
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch
new file mode 100644
index 00000000000..a08a5a33f29
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch
@@ -0,0 +1,200 @@
+From 46ef0ac778d0fe5099e9268c45fd97817a843199 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 12 Jun 2026 13:18:23 +0200
+Subject: [PATCH] Add xattrat syscall wrappers
+
+The getxattrat(), setxattrat(), listxattrat(), and removexattrat() system calls
+don't have shims provided by glibc, yet.  For each of those system calls, test
+if glibc defines it and add a local shim using syscall() if not.
+
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=4eb92d4d449d16fdae4f9ba332809ff9bfd47e65]
+
+Backport Changes:
+- Fold only the libmisc/xattrat.c <errno.h> include from upstream
+  follow-up a009adf38ed8cf3cc2ad8bfb7060630caba0bdaa so errno and
+  ENOSYS are declared for the syscall fallback paths.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 4eb92d4d449d16fdae4f9ba332809ff9bfd47e65)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ configure.ac          |  7 ++++
+ include/Makemodule.am |  3 +-
+ include/xattrat.h     | 25 +++++++++++++
+ libmisc/Makemodule.am |  5 +++
+ libmisc/xattrat.c     | 85 +++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 124 insertions(+), 1 deletion(-)
+ create mode 100644 include/xattrat.h
+ create mode 100644 libmisc/xattrat.c
+
+diff --git a/configure.ac b/configure.ac
+index 96fd96a..22d5084 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,6 +34,13 @@ AC_SYS_LARGEFILE
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
+ dnl Minimal version supporting AM_GNU_GETTEXT_REQUIRE_VERSION.
+ AM_GNU_GETTEXT_VERSION([0.19.6])
+ dnl Require at least the following version, but use the latest available one.
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index dd95135..47b1c26 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -4,7 +4,8 @@ noinst_HEADERS += \
+ 	include/acl_ea.h \
+ 	include/misc.h \
+ 	include/visibility-hidden.h \
+-	include/walk_tree.h
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
+index 2bb7bf0..6826a35 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -7,3 +7,8 @@ libmisc_la_SOURCES = \
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
+index 0000000..6740a39
+--- /dev/null
++++ b/libmisc/xattrat.c
+@@ -0,0 +1,85 @@
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
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch
new file mode 100644
index 00000000000..b5ca98d4648
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch
@@ -0,0 +1,712 @@
+From 28b1bde001c4566023a76db90692ad8ad32378de Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=ea0b56cdd9b3d537da2366dacbbfc93fefce152a]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit ea0b56cdd9b3d537da2366dacbbfc93fefce152a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
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
+index 47b1c26..36fc1c3 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -5,7 +5,8 @@ noinst_HEADERS += \
+ 	include/misc.h \
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
+index 6826a35..4099098 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -1,10 +1,18 @@
+ noinst_LTLIBRARIES += libmisc.la
+ 
++noinst_HEADERS += \
++	libmisc/proc-self-fd.h
++
+ libmisc_la_SOURCES = \
+ 	libmisc/uid_gid_lookup.c \
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
+index 0000000..1de1114
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
++			errno = EBADF;
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
+index 0000000..311d3d6
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
++			errno = EBADF;
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
+index 0000000..888b268
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
++			errno = EBADF;
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
+index 0000000..dfe367f
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
++			errno = EBADF;
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
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch b/meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch
new file mode 100644
index 00000000000..87b640ee2cc
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch
@@ -0,0 +1,719 @@
+From 20f5c4a6c6cc580c892e9076d457b2d92b5d5c61 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Wed, 3 Jun 2026 00:53:04 +0200
+Subject: [PATCH] Add libacl _at function variants
+
+Add new libacl functions acl_get_file_at(), acl_set_file_at(),
+acl_delete_def_file_at(), and acl_extended_file_at() that take a directory file
+descriptor and an AT_* flags argument, similar to fstatat(2).
+
+The AT_* flags argument supports the AT_SYMLINK_NOFOLLOW and AT_EMPTY_PATH flags.
+
+Bump LT_CURRENT and LT_AGE to indicate a backwards-compatible change.
+
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=5906d2868ec8d3b08be556153696e6b1122eeeda]
+
+Backport Changes:
+- Replace ACL 2.3.2's legacy file implementations with _at wrappers.
+- Remove obsolete byteorder includes when adopting the wrappers.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 5906d2868ec8d3b08be556153696e6b1122eeeda)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ exports                             |   9 +++
+ include/acl.h                       |   4 ++
+ include/libacl.h                    |   1 +
+ libacl/Makemodule.am                |  14 ++--
+ libacl/__acl_extended_file.c        |  49 -------------
+ libacl/__acl_extended_file.h        |   3 -
+ libacl/acl_delete_def_file_at.c     |  45 ++++++++++++
+ libacl/acl_extended_file.c          |   7 +-
+ libacl/acl_extended_file_at.c       |  53 ++++++++++++++
+ libacl/acl_extended_file_nofollow.c |   7 +-
+ libacl/acl_get_file.c               |  63 +---------------
+ libacl/acl_get_file_at.c            | 107 ++++++++++++++++++++++++++++
+ libacl/acl_set_file.c               |  40 +----------
+ libacl/acl_set_file_at.c            |  71 ++++++++++++++++++
+ 14 files changed, 308 insertions(+), 165 deletions(-)
+ delete mode 100644 libacl/__acl_extended_file.c
+ delete mode 100644 libacl/__acl_extended_file.h
+ create mode 100644 libacl/acl_delete_def_file_at.c
+ create mode 100644 libacl/acl_extended_file_at.c
+ create mode 100644 libacl/acl_get_file_at.c
+ create mode 100644 libacl/acl_set_file_at.c
+
+diff --git a/exports b/exports
+index 67a2163..2435358 100644
+--- a/exports
++++ b/exports
+@@ -75,3 +75,12 @@ ACL_1.2 {
+ 	# Linux specific extensions
+ 	acl_extended_file_nofollow;
+ } ACL_1.1;
++
++ACL_1.3 {
++    global:
++	# Linux specific extensions
++	acl_delete_def_file_at;
++	acl_extended_file_at;
++	acl_get_file_at;
++	acl_set_file_at;
++} ACL_1.2;
+diff --git a/include/acl.h b/include/acl.h
+index 710bf31..8863e27 100644
+--- a/include/acl.h
++++ b/include/acl.h
+@@ -114,10 +114,14 @@ EXPORT char *acl_to_text(acl_t acl, ssize_t *len_p);
+ /*=== Object manipulation ===*/
+ 
+ EXPORT int acl_delete_def_file(const char *path_p);
++EXPORT int acl_delete_def_file_at(int dirfd, const char *path_p, int at_flags);
+ EXPORT acl_t acl_get_fd(int fd);
+ EXPORT acl_t acl_get_file(const char *path_p, acl_type_t type);
++EXPORT acl_t acl_get_file_at(int dirfd, const char *path_p, int at_flags, acl_type_t type);
+ EXPORT int acl_set_fd(int fd, acl_t acl);
+ EXPORT int acl_set_file(const char *path_p, acl_type_t type, acl_t acl);
++EXPORT int acl_set_file_at(int dirfd, const char *path_p, int at_flags, acl_type_t type,
++			   acl_t acl);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/include/libacl.h b/include/libacl.h
+index b1f3bcf..e778a81 100644
+--- a/include/libacl.h
++++ b/include/libacl.h
+@@ -60,6 +60,7 @@ EXPORT acl_t acl_from_mode(mode_t mode);
+ EXPORT int acl_equiv_mode(acl_t acl, mode_t *mode_p);
+ EXPORT int acl_extended_file(const char *path_p);
+ EXPORT int acl_extended_file_nofollow(const char *path_p);
++EXPORT int acl_extended_file_at(int dirfd, const char *path_p, int at_flags);
+ EXPORT int acl_extended_fd(int fd);
+ EXPORT int acl_entries(acl_t acl);
+ EXPORT const char *acl_error(int code);
+diff --git a/libacl/Makemodule.am b/libacl/Makemodule.am
+index 604f829..eda6a93 100644
+--- a/libacl/Makemodule.am
++++ b/libacl/Makemodule.am
+@@ -2,10 +2,10 @@ lib_LTLIBRARIES += libacl.la
+ 
+ # No other library exports version info, otherwise we'd have to add
+ # "libacl_" prefix to all these variables.
+-LT_CURRENT = 2
++LT_CURRENT = 3
+ # The configure script will set this for us automatically.
+ #LT_REVISION =
+-LT_AGE = 1
++LT_AGE = 2
+ LTVERSION = $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)
+ 
+ CFILES = $(POSIX_CFILES) $(LIBACL_CFILES) $(INTERNAL_CFILES) \
+@@ -17,8 +17,7 @@ HFILES = \
+ 	libacl/byteorder.h \
+ 	libacl/__acl_from_xattr.h \
+ 	libacl/__acl_to_xattr.h \
+-	libacl/perm_copy.h \
+-	libacl/__acl_extended_file.h
++	libacl/perm_copy.h
+ 
+ POSIX_CFILES = \
+ 	libacl/acl_add_perm.c \
+@@ -29,6 +28,7 @@ POSIX_CFILES = \
+ 	libacl/acl_copy_int.c \
+ 	libacl/acl_create_entry.c \
+ 	libacl/acl_delete_def_file.c \
++	libacl/acl_delete_def_file_at.c \
+ 	libacl/acl_delete_entry.c \
+ 	libacl/acl_delete_perm.c \
+ 	libacl/acl_dup.c \
+@@ -37,6 +37,7 @@ POSIX_CFILES = \
+ 	libacl/acl_get_entry.c \
+ 	libacl/acl_get_fd.c \
+ 	libacl/acl_get_file.c \
++	libacl/acl_get_file_at.c \
+ 	libacl/acl_get_perm.c \
+ 	libacl/acl_get_permset.c \
+ 	libacl/acl_get_qualifier.c \
+@@ -44,6 +45,7 @@ POSIX_CFILES = \
+ 	libacl/acl_init.c \
+ 	libacl/acl_set_fd.c \
+ 	libacl/acl_set_file.c \
++	libacl/acl_set_file_at.c \
+ 	libacl/acl_set_permset.c \
+ 	libacl/acl_set_qualifier.c \
+ 	libacl/acl_set_tag_type.c \
+@@ -59,10 +61,10 @@ LIBACL_CFILES = \
+ 	libacl/acl_error.c \
+ 	libacl/acl_extended_fd.c \
+ 	libacl/acl_extended_file.c \
++	libacl/acl_extended_file_at.c \
+ 	libacl/acl_extended_file_nofollow.c \
+ 	libacl/acl_from_mode.c \
+-	libacl/acl_to_any_text.c \
+-	libacl/__acl_extended_file.c
++	libacl/acl_to_any_text.c
+ 
+ INTERNAL_CFILES = \
+ 	libacl/__acl_from_xattr.c \
+diff --git a/libacl/__acl_extended_file.c b/libacl/__acl_extended_file.c
+deleted file mode 100644
+index f366621..0000000
+--- a/libacl/__acl_extended_file.c
++++ /dev/null
+@@ -1,49 +0,0 @@
+-/*
+-  File: __acl_extended_file.c
+-
+-  Copyright (C) 2000, 2011
+-  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
+-
+-  This library is free software; you can redistribute it and/or
+-  modify it under the terms of the GNU Lesser General Public
+-  License as published by the Free Software Foundation; either
+-  version 2.1 of the License, or (at your option) any later version.
+-
+-  This library is distributed in the hope that it will be useful,
+-  but WITHOUT ANY WARRANTY; without even the implied warranty of
+-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-  Lesser General Public License for more details.
+-
+-  You should have received a copy of the GNU Lesser General Public
+-  License along with this library; if not, see <https://www.gnu.org/licenses/>.
+-*/
+-
+-#include "config.h"
+-#include <unistd.h>
+-#include <sys/xattr.h>
+-#include "libacl.h"
+-
+-#include "byteorder.h"
+-#include "acl_ea.h"
+-#include "__acl_extended_file.h"
+-
+-int
+-__acl_extended_file(const char *path_p,
+-		    ssize_t (*fun)(const char *, const char *,
+-				   void *, size_t))
+-{
+-	int base_size = sizeof(acl_ea_header) + 3 * sizeof(acl_ea_entry);
+-	int retval;
+-
+-	retval = fun(path_p, ACL_EA_ACCESS, NULL, 0);
+-	if (retval < 0 && errno != ENOATTR && errno != ENODATA)
+-		return -1;
+-	if (retval > base_size)
+-		return 1;
+-	retval = fun(path_p, ACL_EA_DEFAULT, NULL, 0);
+-	if (retval < 0 && errno != ENOATTR && errno != ENODATA)
+-		return -1;
+-	if (retval >= base_size)
+-		return 1;
+-	return 0;
+-}
+diff --git a/libacl/__acl_extended_file.h b/libacl/__acl_extended_file.h
+deleted file mode 100644
+index 0b0da9e..0000000
+--- a/libacl/__acl_extended_file.h
++++ /dev/null
+@@ -1,3 +0,0 @@
+-int __acl_extended_file(const char *path_p,
+-			ssize_t (*)(const char *, const char *,
+-				    void *, size_t));
+diff --git a/libacl/acl_delete_def_file_at.c b/libacl/acl_delete_def_file_at.c
+new file mode 100644
+index 0000000..74815c7
+--- /dev/null
++++ b/libacl/acl_delete_def_file_at.c
+@@ -0,0 +1,45 @@
++/*
++  File: acl_delete_def_file_at.c
++
++  Copyright (C) 1999, 2000
++  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
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
++#include <sys/types.h>
++#include <sys/xattr.h>
++#include <fcntl.h>
++#include "acl_ea.h"
++#include "xattrat_compat.h"
++#include "libacl.h"
++
++int
++acl_delete_def_file_at(int dirfd, const char *path_p, int at_flags)
++{
++	int error;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	error = removexattrat(dirfd, path_p, at_flags, ACL_EA_DEFAULT);
++	if (error < 0 && errno != ENOATTR && errno != ENODATA)
++		return -1;
++	return 0;
++}
++
+diff --git a/libacl/acl_extended_file.c b/libacl/acl_extended_file.c
+index bb0f1e8..d427a16 100644
+--- a/libacl/acl_extended_file.c
++++ b/libacl/acl_extended_file.c
+@@ -19,16 +19,13 @@
+ */
+ 
+ #include "config.h"
+-#include <unistd.h>
+-#include <sys/xattr.h>
++#include <fcntl.h>
+ #include "libacl.h"
+ 
+-#include "__acl_extended_file.h"
+-
+ 
+ int
+ acl_extended_file(const char *path_p)
+ {
+-	return __acl_extended_file(path_p, getxattr);
++	return acl_extended_file_at(AT_FDCWD, path_p, 0);
+ }
+ 
+diff --git a/libacl/acl_extended_file_at.c b/libacl/acl_extended_file_at.c
+new file mode 100644
+index 0000000..ac46bb4
+--- /dev/null
++++ b/libacl/acl_extended_file_at.c
+@@ -0,0 +1,53 @@
++/*
++  File: acl_extended_file_at.c
++
++  Copyright (C) 2000, 2011
++  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
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
++#include <sys/xattr.h>
++#include <fcntl.h>
++#include "libacl.h"
++#include "xattrat_compat.h"
++#include "acl_ea.h"
++
++
++int
++acl_extended_file_at(int dirfd, const char *path_p, int at_flags)
++{
++	int base_size = sizeof(acl_ea_header) + 3 * sizeof(acl_ea_entry);
++	int retval;
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	retval = getxattrat(dirfd, path_p, at_flags, ACL_EA_ACCESS, NULL, 0);
++	if (retval < 0 && errno != ENOATTR && errno != ENODATA)
++		return -1;
++	if (retval > base_size)
++		return 1;
++	retval = getxattrat(dirfd, path_p, at_flags, ACL_EA_DEFAULT, NULL, 0);
++	if (retval < 0 && errno != ENOATTR && errno != ENODATA)
++		return -1;
++	if (retval >= base_size)
++		return 1;
++	return 0;
++}
+diff --git a/libacl/acl_extended_file_nofollow.c b/libacl/acl_extended_file_nofollow.c
+index 7f622dd..e2b7e26 100644
+--- a/libacl/acl_extended_file_nofollow.c
++++ b/libacl/acl_extended_file_nofollow.c
+@@ -19,15 +19,12 @@
+ */
+ 
+ #include "config.h"
+-#include <unistd.h>
+-#include <sys/xattr.h>
++#include <fcntl.h>
+ #include "libacl.h"
+ 
+-#include "__acl_extended_file.h"
+-
+ 
+ int
+ acl_extended_file_nofollow(const char *path_p)
+ {
+-	return __acl_extended_file(path_p, lgetxattr);
++	return acl_extended_file_at(AT_FDCWD, path_p, AT_SYMLINK_NOFOLLOW);
+ }
+diff --git a/libacl/acl_get_file.c b/libacl/acl_get_file.c
+index 4a86d1a..7a37b35 100644
+--- a/libacl/acl_get_file.c
++++ b/libacl/acl_get_file.c
+@@ -1,8 +1,7 @@
+ /*
+   File: acl_get_file.c
+ 
+-  Copyright (C) 1999, 2000
+-  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ 
+   This library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+@@ -19,69 +18,13 @@
+ */
+ 
+ #include "config.h"
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <unistd.h>
+-#include <stdio.h>
+-#include <sys/xattr.h>
++#include <fcntl.h>
+ #include "libacl.h"
+-#include "__acl_from_xattr.h"
+-
+-#include "byteorder.h"
+-#include "acl_ea.h"
+ 
+ /* 23.4.16 */
+ acl_t
+ acl_get_file(const char *path_p, acl_type_t type)
+ {
+-	const size_t size_guess = acl_ea_size(16);
+-	char *ext_acl_p = alloca(size_guess);
+-	const char *name;
+-	int retval;
+-
+-	switch(type) {
+-		case ACL_TYPE_ACCESS:
+-			name = ACL_EA_ACCESS;
+-			break;
+-		case ACL_TYPE_DEFAULT:
+-			name = ACL_EA_DEFAULT;
+-			break;
+-		default:
+-			errno = EINVAL;
+-			return NULL;
+-	}
+-
+-	if (!ext_acl_p)
+-		return NULL;
+-	retval = getxattr(path_p, name, ext_acl_p, size_guess);
+-	if (retval == -1 && errno == ERANGE) {
+-		retval = getxattr(path_p, name, NULL, 0);
+-		if (retval > 0) {
+-			ext_acl_p = alloca(retval);
+-			if (!ext_acl_p)
+-				return NULL;
+-			retval = getxattr(path_p, name, ext_acl_p, retval);
+-		}
+-	}
+-	if (retval > 0) {
+-		acl_t acl = __acl_from_xattr(ext_acl_p, retval);
+-		return acl;
+-	} else if (retval == 0 || errno == ENOATTR || errno == ENODATA) {
+-		struct stat st;
+-
+-		if (stat(path_p, &st) != 0)
+-			return NULL;
+-
+-		if (type == ACL_TYPE_DEFAULT) {
+-			if (S_ISDIR(st.st_mode))
+-				return acl_init(0);
+-			else {
+-				errno = EACCES;
+-				return NULL;
+-			}
+-		} else
+-			return acl_from_mode(st.st_mode);
+-	} else
+-		return NULL;
++	return acl_get_file_at(AT_FDCWD, path_p, 0, type);
+ }
+ 
+diff --git a/libacl/acl_get_file_at.c b/libacl/acl_get_file_at.c
+new file mode 100644
+index 0000000..8d00c1c
+--- /dev/null
++++ b/libacl/acl_get_file_at.c
+@@ -0,0 +1,107 @@
++/*
++  File: acl_get_file_at.c
++
++  Copyright (C) 1999, 2000
++  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
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
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++#include <stdio.h>
++#include <sys/xattr.h>
++#include <fcntl.h>
++#include "libacl.h"
++#include "xattrat_compat.h"
++#include "__acl_from_xattr.h"
++#include "acl_ea.h"
++
++acl_t
++acl_get_file_at(int dirfd, const char *path_p, int at_flags, acl_type_t type)
++{
++	size_t size_guess = acl_ea_size(16);
++	char *onstack_buffer = alloca(size_guess);
++	char *ext_acl_p = onstack_buffer;
++	const char *name;
++	acl_t acl = NULL;
++	int retries = 0;
++	int retval;
++
++	switch(type) {
++		case ACL_TYPE_ACCESS:
++			name = ACL_EA_ACCESS;
++			break;
++		case ACL_TYPE_DEFAULT:
++			name = ACL_EA_DEFAULT;
++			break;
++		default:
++			errno = EINVAL;
++			goto out;
++	}
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		goto out;
++	}
++
++	for (;;) {
++		retval = getxattrat(dirfd, path_p, at_flags, name, ext_acl_p,
++				    size_guess);
++		if (retval != -1 || errno != ERANGE)
++			break;
++		if (++retries >= 8)
++			break;
++
++		retval = getxattrat(dirfd, path_p, at_flags, name, NULL, 0);
++		if (retval <= 0)
++			break;
++		size_guess = retval;
++
++		if (ext_acl_p != onstack_buffer)
++			free(ext_acl_p);
++		ext_acl_p = malloc(size_guess);
++		if (!ext_acl_p)
++                       goto out;
++	}
++	if (retval > 0) {
++		acl = __acl_from_xattr(ext_acl_p, retval);
++	} else if (retval == 0 || errno == ENOATTR || errno == ENODATA) {
++		struct stat st;
++
++		if (fstatat(dirfd, path_p, &st, at_flags) != 0)
++			goto out;
++
++		if (S_ISLNK(st.st_mode)) {
++			errno = ENOTSUP;
++			goto out;
++		}
++		if (type == ACL_TYPE_DEFAULT) {
++			if (S_ISDIR(st.st_mode))
++				acl = acl_init(0);
++			else
++				errno = EACCES;
++		} else
++			acl = acl_from_mode(st.st_mode);
++	}
++
++out:
++	if (ext_acl_p != onstack_buffer)
++		free(ext_acl_p);
++	return acl;
++}
++
+diff --git a/libacl/acl_set_file.c b/libacl/acl_set_file.c
+index 185b1bd..d276942 100644
+--- a/libacl/acl_set_file.c
++++ b/libacl/acl_set_file.c
+@@ -1,8 +1,7 @@
+ /*
+   File: acl_set_file.c
+ 
+-  Copyright (C) 1999, 2000
+-  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ 
+   This library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+@@ -19,46 +18,13 @@
+ */
+ 
+ #include "config.h"
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <unistd.h>
+-#include <sys/xattr.h>
++#include <fcntl.h>
+ #include "libacl.h"
+-#include "__acl_to_xattr.h"
+-
+-#include "byteorder.h"
+-#include "acl_ea.h"
+-
+ 
+ /* 23.4.22 */
+ int
+ acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
+ {
+-	acl_obj *acl_obj_p = ext2int(acl, acl);
+-	char *ext_acl_p;
+-	const char *name;
+-	size_t size;
+-	int error;
+-
+-	if (!acl_obj_p)
+-		return -1;
+-	switch (type) {
+-		case ACL_TYPE_ACCESS:
+-			name = ACL_EA_ACCESS;
+-			break;
+-		case ACL_TYPE_DEFAULT:
+-			name = ACL_EA_DEFAULT;
+-			break;
+-		default:
+-			errno = EINVAL;
+-			return -1;
+-	}
+-
+-	ext_acl_p = __acl_to_xattr(acl_obj_p, &size);
+-	if (!ext_acl_p)
+-		return -1;
+-	error = setxattr(path_p, name, (char *)ext_acl_p, size, 0);
+-	free(ext_acl_p);
+-	return error;
++	return acl_set_file_at(AT_FDCWD, path_p, 0, type, acl);
+ }
+ 
+diff --git a/libacl/acl_set_file_at.c b/libacl/acl_set_file_at.c
+new file mode 100644
+index 0000000..40f83d1
+--- /dev/null
++++ b/libacl/acl_set_file_at.c
+@@ -0,0 +1,71 @@
++/*
++  File: acl_set_file_at.c
++
++  Copyright (C) 1999, 2000
++  Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
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
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++#include <sys/xattr.h>
++#include <fcntl.h>
++#include "libacl.h"
++#include "xattrat_compat.h"
++#include "__acl_to_xattr.h"
++#include "acl_ea.h"
++
++
++int
++acl_set_file_at(int dirfd, const char *path_p, int at_flags, acl_type_t type,
++		acl_t acl)
++{
++	acl_obj *acl_obj_p = ext2int(acl, acl);
++	char *ext_acl_p;
++	const char *name;
++	size_t size;
++	int error;
++
++	if (!acl_obj_p)
++		return -1;
++	switch (type) {
++		case ACL_TYPE_ACCESS:
++			name = ACL_EA_ACCESS;
++			break;
++		case ACL_TYPE_DEFAULT:
++			name = ACL_EA_DEFAULT;
++			break;
++		default:
++			errno = EINVAL;
++			return -1;
++	}
++
++	if (at_flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW)) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	ext_acl_p = __acl_to_xattr(acl_obj_p, &size);
++	if (!ext_acl_p)
++		return -1;
++	error = setxattrat(dirfd, path_p, at_flags, name, (char *)ext_acl_p,
++			   size, 0);
++	free(ext_acl_p);
++	return error;
++}
++
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch b/meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch
new file mode 100644
index 00000000000..8a9ad982c82
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch
@@ -0,0 +1,957 @@
+From dd8f9c772a4ba53225baf7f54fc7fa7859004aa8 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 5 Jun 2026 06:21:41 +0200
+Subject: [PATCH] Add libacl _at function documentation
+
+Add man page documentation for acl_delete_def_file_at(), and
+acl_extended_file_at(), acl_get_file_at(), and acl_set_file_at().
+
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=0071c6d1fea0a8a6270333baa85fb609be325c26]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 0071c6d1fea0a8a6270333baa85fb609be325c26)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ man/man3/Makemodule.am            |   4 +
+ man/man3/acl_delete_def_file.3    | 113 +++++++++++++++++++++--
+ man/man3/acl_delete_def_file_at.3 |   1 +
+ man/man3/acl_extended_file.3      | 132 +++++++++++++++++++++++----
+ man/man3/acl_extended_file_at.3   |   1 +
+ man/man3/acl_get_file.3           | 137 +++++++++++++++++++++++++---
+ man/man3/acl_get_file_at.3        |   1 +
+ man/man3/acl_set_file.3           | 147 +++++++++++++++++++++++++++---
+ man/man3/acl_set_file_at.3        |   1 +
+ man/man5/acl.5                    |   8 +-
+ 10 files changed, 493 insertions(+), 52 deletions(-)
+ create mode 100644 man/man3/acl_delete_def_file_at.3
+ create mode 100644 man/man3/acl_extended_file_at.3
+ create mode 100644 man/man3/acl_get_file_at.3
+ create mode 100644 man/man3/acl_set_file_at.3
+
+diff --git a/man/man3/Makemodule.am b/man/man3/Makemodule.am
+index c0c4825..4d6d0e1 100644
+--- a/man/man3/Makemodule.am
++++ b/man/man3/Makemodule.am
+@@ -9,6 +9,7 @@ dist_man_MANS += \
+ 	man/man3/acl_copy_int.3 \
+ 	man/man3/acl_create_entry.3 \
+ 	man/man3/acl_delete_def_file.3 \
++	man/man3/acl_delete_def_file_at.3 \
+ 	man/man3/acl_delete_entry.3 \
+ 	man/man3/acl_delete_perm.3 \
+ 	man/man3/acl_dup.3 \
+@@ -17,6 +18,7 @@ dist_man_MANS += \
+ 	man/man3/acl_error.3 \
+ 	man/man3/acl_extended_fd.3 \
+ 	man/man3/acl_extended_file.3 \
++	man/man3/acl_extended_file_at.3 \
+ 	man/man3/acl_extended_file_nofollow.3 \
+ 	man/man3/acl_free.3 \
+ 	man/man3/acl_from_mode.3 \
+@@ -24,6 +26,7 @@ dist_man_MANS += \
+ 	man/man3/acl_get_entry.3 \
+ 	man/man3/acl_get_fd.3 \
+ 	man/man3/acl_get_file.3 \
++	man/man3/acl_get_file_at.3 \
+ 	man/man3/acl_get_perm.3 \
+ 	man/man3/acl_get_permset.3 \
+ 	man/man3/acl_get_qualifier.3 \
+@@ -31,6 +34,7 @@ dist_man_MANS += \
+ 	man/man3/acl_init.3 \
+ 	man/man3/acl_set_fd.3 \
+ 	man/man3/acl_set_file.3 \
++	man/man3/acl_set_file_at.3 \
+ 	man/man3/acl_set_permset.3 \
+ 	man/man3/acl_set_qualifier.3 \
+ 	man/man3/acl_set_tag_type.3 \
+diff --git a/man/man3/acl_delete_def_file.3 b/man/man3/acl_delete_def_file.3
+index 8448666..059aa8f 100644
+--- a/man/man3/acl_delete_def_file.3
++++ b/man/man3/acl_delete_def_file.3
+@@ -1,6 +1,6 @@
+ .\" Access Control Lists manual pages
+ .\"
+-.\" (C) 2002 Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++.\" (C) 2002-2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ .\"
+ .\" This is free documentation; you can redistribute it and/or
+ .\" modify it under the terms of the GNU General Public License as
+@@ -21,11 +21,12 @@
+ .\" License along with this manual.  If not, see
+ .\" <http://www.gnu.org/licenses/>.
+ .\"
+-.Dd March 23, 2002
++.Dd June 5, 2026
+ .Dt ACL_DELETE_DEF_FILE 3
+ .Os "Linux ACL"
+ .Sh NAME
+-.Nm acl_delete_def_file
++.Nm acl_delete_def_file ,
++.Nm acl_delete_def_file_at
+ .Nd delete a default ACL by filename
+ .Sh LIBRARY
+ Linux Access Control Lists library (libacl, \-lacl).
+@@ -33,7 +34,15 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .In sys/types.h
+ .In sys/acl.h
+ .Ft int
+-.Fn acl_delete_def_file "const char *path_p"
++.Fo acl_delete_def_file
++.Fa "const char *path_p"
++.Fc
++.Ft int
++.Fo acl_delete_def_file_at
++.Fa "int dirfd"
++.Fa "const char *path_p"
++.Fa "int at_flags"
++.Fc
+ .Sh DESCRIPTION
+ The
+ .Fn acl_delete_def_file
+@@ -49,22 +58,108 @@ If the argument
+ is not a directory, then the function fails. It is no error if the directory whose pathname is pointed to by the argument
+ .Va path_p
+ does not have a default ACL.
++.Ss Fn acl_delete_def_file_at
++The
++.Fn acl_delete_def_file_at
++function operates in exactly the same way as
++.Fn acl_delete_def_file ,
++except for the differences described here.
++.Pp
++If the pathname given in
++.Va path_p
++is relative, then it is interpreted relative to the directory referred to by the file descriptor
++.Va dirfd
++(rather than relative to the current working directory of the calling process, as is done by
++.Fn acl_delete_def_file ) .
++.Pp
++If
++.Va path_p
++is relative and
++.Va dirfd
++is the special value
++.Dv AT_FDCWD ,
++then
++.Va path_p
++is interpreted relative to the current working directory of the calling process (like
++.Fn acl_delete_def_file ) .
++.Pp
++If
++.Va path_p
++is absolute, then
++.Va dirfd
++is ignored.
++.Pp
++The
++.Va at_flags
++argument can either be 0, or include one or more of the following flags ORed:
++.Bl -tag
++.It Dv AT_EMPTY_PATH
++If
++.Va path_p
++is an empty string, operate on the file referred to by
++.Va dirfd
++(which may have been obtained using the
++.Xr open 2
++.Dv O_PATH
++flag). In this case,
++.Va dirfd
++can refer to any type of file, not just a directory.
++.It Dv AT_SYMLINK_NOFOLLOW
++If
++.Va path_p
++refers to a symbolic link, do not dereference it: instead, fail the operation
++and set the global variable
++.Va errno
++to
++.Er ENOTSUP .
++This indicates that the symbolic link cannot have ACLs.
++.El
+ .Sh RETURN VALUE
+-.Rv -std acl_delete_def_file
++.Rv -std acl_delete_def_file acl_delete_def_file_at
+ .Sh ERRORS
+ If any of the following conditions occur, the
+ .Fn acl_delete_def_file
+-function returns the value
++and
++.Fn acl_delete_def_file_at
++functions return the value
+ .Li -1
+-and and sets
++and set
+ .Va errno
+ to the corresponding value:
+ .Bl -tag -width Er
++.It Bq Er EBADF
++The argument
++.Va path_p
++is relative but the argument
++.Va dirfd
++is neither
++.Dv AT_FDCWD
++nor a valid file descriptor.
+ .It Bq Er EINVAL
+ The file referred to by
+ .Va path_p
+ is not a directory.
++.Pp
++An invalid flag was specified in the
++.Va at_flags
++argument.
++.It Bq Er ENOTDIR
++A component of the path prefix is not a directory.
++.Pp
++The argument
++.Va path_p
++is relative and the argument
++.Va dirfd
++is a file descriptor referring to a file other than a directory.
+ .It Bq Er ENOTSUP
++The argument
++.Va at_flags
++includes the flag
++.Dv AT_SYMLINK_NOFOLLOW
++and
++.Va path_p
++is a symbolic link.
++.Pp
+ The file system on which the file identified by
+ .Va path_p
+ is located does not support ACLs, or ACLs are disabled.
+@@ -75,6 +170,10 @@ This function requires modification of a file system which is currently read-onl
+ .El
+ .Sh STANDARDS
+ IEEE Std 1003.1e draft 17 (\(lqPOSIX.1e\(rq, abandoned)
++.Pp
++Function
++.Fn acl_delete_def_file_at
++is a Linux specific extension.
+ .Sh SEE ALSO
+ .Xr acl_get_file 3 ,
+ .Xr acl_set_file 3 ,
+diff --git a/man/man3/acl_delete_def_file_at.3 b/man/man3/acl_delete_def_file_at.3
+new file mode 100644
+index 0000000..73411a2
+--- /dev/null
++++ b/man/man3/acl_delete_def_file_at.3
+@@ -0,0 +1 @@
++.so man3/acl_delete_def_file.3
+diff --git a/man/man3/acl_extended_file.3 b/man/man3/acl_extended_file.3
+index c4e1354..3a659f7 100644
+--- a/man/man3/acl_extended_file.3
++++ b/man/man3/acl_extended_file.3
+@@ -1,6 +1,6 @@
+ .\" Access Control Lists manual pages
+ .\"
+-.\" (C) 2002 Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++.\" (C) 2002-2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ .\"
+ .\" This is free documentation; you can redistribute it and/or
+ .\" modify it under the terms of the GNU General Public License as
+@@ -21,11 +21,13 @@
+ .\" License along with this manual.  If not, see
+ .\" <http://www.gnu.org/licenses/>.
+ .\"
+-.Dd March 23, 2002
++.Dd June 5, 2026
+ .Dt ACL_EXTENDED_FILE 3
+ .Os "Linux ACL"
+ .Sh NAME
+-.Nm acl_extended_file, acl_extended_file_nofollow
++.Nm acl_extended_file ,
++.Nm acl_extended_file_at ,
++.Nm acl_extended_file_nofollow
+ .Nd test for information in ACLs by file name
+ .Sh LIBRARY
+ Linux Access Control Lists library (libacl, \-lacl).
+@@ -33,9 +35,19 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .In sys/types.h
+ .In acl/libacl.h
+ .Ft int
+-.Fn acl_extended_file "const char *path_p"
++.Fo acl_extended_file
++.Fa "const char *path_p"
++.Fc
+ .Ft int
+-.Fn acl_extended_file_nofollow "const char *path_p"
++.Fo acl_extended_file_at
++.Fa "int dirfd"
++.Fa "const char *path_p"
++.Fa "int at_flags"
++.Fc
++.Ft int
++.Fo acl_extended_file_nofollow
++.Fa "const char *path_p"
++.Fc
+ .Sh DESCRIPTION
+ The
+ .Fn acl_extended_file
+@@ -63,17 +75,77 @@ mechanisms, such as Mandatory Access Control schemes. The
+ .Xr access 2
+ system call can be used to check whether a given type of access to a file
+ object would be granted.
+-.Pp
+-.Fn acl_extended_file_nofollow
+-is identical to
++.Ss Fn acl_extended_file_at
++The
++.Fn acl_extended_file_at
++function operates in exactly the same way as
+ .Fn acl_extended_file ,
+-except in the case of a symbolic link, where the link itself is interrogated,
+-not the file that it refers to.  Since symbolic links have no ACL themselves,
+-the operation is supposed to fail on them.
+-.Sh RETURN VALUE
+-If successful, the
++except for the differences described here.
++.Pp
++If the pathname given in
++.Va path_p
++is relative, then it is interpreted relative to the directory referred to by the file descriptor
++.Va dirfd
++(rather than relative to the current working directory of the calling process, as is done by
++.Fn acl_extended_file ) .
++.Pp
++If
++.Va path_p
++is relative and
++.Va dirfd
++is the special value
++.Dv AT_FDCWD ,
++then
++.Va path_p
++is interpreted relative to the current working directory of the calling process (like
++.Fn acl_extended_file ) .
++.Pp
++If
++.Va path_p
++is absolute, then
++.Va dirfd
++is ignored.
++.Pp
++The
++.Va at_flags
++argument can either be 0, or include one or more of the following flags ORed:
++.Bl -tag
++.It Dv AT_EMPTY_PATH
++If
++.Va path_p
++is an empty string, operate on the file referred to by
++.Va dirfd
++(which may have been obtained using the
++.Xr open 2
++.Dv O_PATH
++flag). In this case,
++.Va dirfd
++can refer to any type of file, not just a directory.
++.It Dv AT_SYMLINK_NOFOLLOW
++If
++.Va path_p
++refers to a symbolic link, do not dereference it: instead, fail the operation
++and set the global variable
++.Va errno
++to
++.Er ENOTSUP .
++This indicates that the symbolic link cannot have ACLs.
++.El
++.Ss Fn acl_extended_nofollow
++The
++.Fn acl_extended_file_at
++function operates in exactly the same way as
+ .Fn acl_extended_file
+-function returns
++with a
++.Va dirfd
++value of
++.Dv AT_FDCWD
++and an
++.Va at_flags
++value of
++.Dv AT_SYMLINK_NOFOLLOW .
++.Sh RETURN VALUE
++If successful, these functions return
+ .Li 1
+ if the file object referred to by
+ .Va path_p
+@@ -87,16 +159,26 @@ is returned and the global variable
+ .Va errno
+ is set to indicate the error.
+ .Sh ERRORS
+-If any of the following conditions occur, the
+-.Fn acl_extended_file
+-function returns
++If any of the following conditions occur, these functions return
+ .Li -1
+-and sets
++and set
+ .Va errno
+ to the corresponding value:
+ .Bl -tag -width Er
+ .It Bq Er EACCES
+ Search permission is denied for a component of the path prefix.
++.It Bq Er EBADF
++The argument
++.Va path_p
++is relative but the argument
++.Va dirfd
++is neither
++.Dv AT_FDCWD
++nor a valid file descriptor.
++.It Bq Er EINVAL
++An invalid flag was specified in the
++.Va at_flags
++argument.
+ .It Bq Er ENAMETOOLONG
+ The length of the argument
+ .Va path_p
+@@ -107,7 +189,21 @@ The named object does not exist or the argument
+ points to an empty string.
+ .It Bq Er ENOTDIR
+ A component of the path prefix is not a directory.
++.Pp
++The argument
++.Va path_p
++is relative and the argument
++.Va dirfd
++is a file descriptor referring to a file other than a directory.
+ .It Bq Er ENOTSUP
++The argument
++.Va at_flags
++includes the flag
++.Dv AT_SYMLINK_NOFOLLOW
++and
++.Va path_p
++is a symbolic link.
++.Pp
+ The file system on which the file identified by
+ .Va path_p
+ is located does not support ACLs, or ACLs are disabled.
+diff --git a/man/man3/acl_extended_file_at.3 b/man/man3/acl_extended_file_at.3
+new file mode 100644
+index 0000000..ff80220
+--- /dev/null
++++ b/man/man3/acl_extended_file_at.3
+@@ -0,0 +1 @@
++.so man3/acl_extended_file.3
+\ No newline at end of file
+diff --git a/man/man3/acl_get_file.3 b/man/man3/acl_get_file.3
+index f76c911..cd65c36 100644
+--- a/man/man3/acl_get_file.3
++++ b/man/man3/acl_get_file.3
+@@ -1,6 +1,6 @@
+ .\" Access Control Lists manual pages
+ .\"
+-.\" (C) 2002 Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++.\" (C) 2002-2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ .\"
+ .\" This is free documentation; you can redistribute it and/or
+ .\" modify it under the terms of the GNU General Public License as
+@@ -21,11 +21,12 @@
+ .\" License along with this manual.  If not, see
+ .\" <http://www.gnu.org/licenses/>.
+ .\"
+-.Dd March 23, 2002
++.Dd June 5, 2026
+ .Dt ACL_GET_FILE 3
+ .Os "Linux ACL"
+ .Sh NAME
+-.Nm acl_get_file
++.Nm acl_get_file ,
++.Nm acl_get_file_at
+ .Nd get an ACL by filename
+ .Sh LIBRARY
+ Linux Access Control Lists library (libacl, \-lacl).
+@@ -33,7 +34,17 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .In sys/types.h
+ .In sys/acl.h
+ .Ft acl_t
+-.Fn acl_get_file "const char *path_p" "acl_type_t type"
++.Fo acl_get_file
++.Fa "const char *path_p"
++.Fa "acl_type_t type"
++.Fc
++.Ft acl_t
++.Fo acl_get_file_at
++.Fa "int dirfd"
++.Fa "const char *path_p"
++.Fa "int at_flags"
++.Fa "acl_type_t type"
++.Fc
+ .Sh DESCRIPTION
+ The
+ .Fn acl_get_file
+@@ -52,15 +63,21 @@ is used to indicate whether the access ACL or the default ACL associated with
+ .Va path_p
+ is returned. If
+ .Va type
+-is ACL_TYPE_ACCESS, the access ACL of
++is
++.Dv ACL_TYPE_ACCESS ,
++the access ACL of
+ .Va path_p
+ is returned. If
+ .Va type
+-is ACL_TYPE_DEFAULT, the default ACL of
++is
++.Dv ACL_TYPE_DEFAULT ,
++the default ACL of
+ .Va path_p
+ is returned. If
+ .Va type
+-is ACL_TYPE_DEFAULT and no default ACL is associated with the directory
++is
++.Dv ACL_TYPE_DEFAULT
++and no default ACL is associated with the directory
+ .Va path_p ,
+ then an ACL containing zero ACL entries is returned. If
+ .Va type
+@@ -76,8 +93,71 @@ with the
+ returned by
+ .Fn acl_get_file
+ as an argument.
++.Ss Fn acl_get_file_at
++The
++.Fn acl_get_file_at
++function operates in exactly the same way as
++.Fn acl_get_file ,
++except for the differences described here.
++.Pp
++If the pathname given in
++.Va path_p
++is relative, then it is interpreted relative to the directory referred to by the file descriptor
++.Va dirfd
++(rather than relative to the current working directory of the calling process, as is done by
++.Fn acl_get_file ) .
++.Pp
++If
++.Va path_p
++is relative and
++.Va dirfd
++is the special value
++.Dv AT_FDCWD ,
++then
++.Va path_p
++is interpreted relative to the current working directory of the calling process (like
++.Fn acl_get_file ) .
++.Pp
++If
++.Va path_p
++is absolute, then
++.Va dirfd
++is ignored.
++.Pp
++The
++.Va at_flags
++argument can either be 0, or include one or more of the following flags ORed:
++.Bl -tag
++.It Dv AT_EMPTY_PATH
++If
++.Va path_p
++is an empty string, operate on the file referred to by
++.Va dirfd
++(which may have been obtained using the
++.Xr open 2
++.Dv O_PATH
++flag). In this case,
++.Va dirfd
++can refer to any type of file, not just a directory, and the behavior of
++.Fn acl_get_file_at
++is similar to that of
++.Fn acl_get_fd .
++.It Dv AT_SYMLINK_NOFOLLOW
++If
++.Va path_p
++refers to a symbolic link, do not dereference it: instead, fail the operation
++and set the global variable
++.Va errno
++to
++.Er ENOTSUP .
++This indicates that the symbolic link cannot have ACLs.
++.El
+ .Sh RETURN VALUE
+-On success, this function returns a pointer to the
++On success, the
++.Fn acl_get_file
++and
++.Fn acl_get_file_at
++functions return a pointer to the
+ working storage.  On error, a value of
+ .Li (acl_t)NULL
+ is returned, and
+@@ -86,9 +166,11 @@ is set appropriately.
+ .Sh ERRORS
+ If any of the following conditions occur, the
+ .Fn acl_get_file
+-function returns a value of
++and
++.Fn acl_get_file_at
++functions return a value of
+ .Li (acl_t)NULL
+-and sets
++and set
+ .Va errno
+ to the corresponding value:
+ .Bl -tag -width Er
+@@ -100,10 +182,25 @@ Argument
+ .Va type
+ specifies a type of ACL that cannot be associated with
+ .Va path_p .
++.It Bq Er EBADF
++The argument
++.Va path_p
++is relative but the argument
++.Va dirfd
++is neither
++.Dv AT_FDCWD
++nor a valid file descriptor.
+ .It Bq Er EINVAL
+ The argument
+ .Va type
+-is not ACL_TYPE_ACCESS or ACL_TYPE_DEFAULT.
++is not
++.Dv ACL_TYPE_ACCESS
++or
++.Dv ACL_TYPE_DEFAULT .
++.Pp
++An invalid flag was specified in the
++.Va at_flags
++argument.
+ .It Bq Er ENAMETOOLONG
+ The length of the argument
+ .Va path_p
+@@ -116,13 +213,31 @@ points to an empty string.
+ The ACL working storage requires more memory than is allowed by the hardware or system-imposed memory management constraints.
+ .It Bq Er ENOTDIR
+ A component of the path prefix is not a directory.
++.Pp
++The argument
++.Va path_p
++is relative and the argument
++.Va dirfd
++is a file descriptor referring to a file other than a directory.
+ .It Bq Er ENOTSUP
++The argument
++.Va at_flags
++includes the flag
++.Dv AT_SYMLINK_NOFOLLOW
++and
++.Va path_p
++is a symbolic link.
++.Pp
+ The file system on which the file identified by
+ .Va path_p
+ is located does not support ACLs, or ACLs are disabled.
+ .El
+ .Sh STANDARDS
+ IEEE Std 1003.1e draft 17 (\(lqPOSIX.1e\(rq, abandoned)
++.Pp
++Function
++.Fn acl_get_file_at
++is a Linux specific extension.
+ .Sh SEE ALSO
+ .Xr acl_free 3 ,
+ .Xr acl_get_entry 3 ,
+diff --git a/man/man3/acl_get_file_at.3 b/man/man3/acl_get_file_at.3
+new file mode 100644
+index 0000000..76ca2b0
+--- /dev/null
++++ b/man/man3/acl_get_file_at.3
+@@ -0,0 +1 @@
++.so man3/acl_get_file.3
+diff --git a/man/man3/acl_set_file.3 b/man/man3/acl_set_file.3
+index 9ff96f1..c2b8b58 100644
+--- a/man/man3/acl_set_file.3
++++ b/man/man3/acl_set_file.3
+@@ -1,6 +1,6 @@
+ .\" Access Control Lists manual pages
+ .\"
+-.\" (C) 2002 Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++.\" (C) 2002-2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+ .\"
+ .\" This is free documentation; you can redistribute it and/or
+ .\" modify it under the terms of the GNU General Public License as
+@@ -21,11 +21,12 @@
+ .\" License along with this manual.  If not, see
+ .\" <http://www.gnu.org/licenses/>.
+ .\"
+-.Dd March 23, 2002
++.Dd June 5, 2026
+ .Dt ACL_SET_FILE 3
+ .Os "Linux ACL"
+ .Sh NAME
+-.Nm acl_set_file
++.Nm acl_set_file ,
++.Nm acl_set_file_at
+ .Nd set an ACL by filename
+ .Sh LIBRARY
+ Linux Access Control Lists library (libacl, \-lacl).
+@@ -33,7 +34,19 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .In sys/types.h
+ .In sys/acl.h
+ .Ft int
+-.Fn acl_set_file "const char *path_p" "acl_type_t type" "acl_t acl"
++.Fo acl_set_file
++.Fa "const char *path_p"
++.Fa "acl_type_t type"
++.Fa "acl_t acl"
++.Fc
++.Ft int
++.Fo acl_set_file_at
++.Fa "int dirfd"
++.Fa "const char *path_p"
++.Fa "int at_flags"
++.Fa "acl_type_t type"
++.Fa "acl_t acl"
++.Fc
+ .Sh DESCRIPTION
+ The
+ .Fn acl_set_file
+@@ -53,11 +66,15 @@ with
+ .Va path_p
+ is being set. If the
+ .Va type
+-parameter is ACL_TYPE_ACCESS, the access ACL of
++parameter is
++.Dv ACL_TYPE_ACCESS ,
++the access ACL of
+ .Va path_p
+ shall be set. If the
+ .Va type
+-parameter is ACL_TYPE_DEFAULT, the default ACL of
++parameter is
++.Dv ACL_TYPE_DEFAULT ,
++the default ACL of
+ .Va path_p
+ shall be set. If the argument
+ .Va type
+@@ -71,9 +88,13 @@ parameter must reference a valid ACL according to the rules described on the
+ .Xr acl_valid 3
+ manual page if the
+ .Va type
+-parameter is ACL_TYPE_ACCESS, and must either reference a valid ACL or an ACL with zero ACL entries if the
++parameter is
++.Dv ACL_TYPE_ACCESS ,
++and must either reference a valid ACL or an ACL with zero ACL entries if the
+ .Va type
+-parameter is ACL_TYPE_DEFAULT. If the
++parameter is
++.Dv ACL_TYPE_DEFAULT .
++If the
+ .Va acl
+ parameter references an empty ACL, then the
+ .Fn acl_set_file
+@@ -81,14 +102,75 @@ function removes any default ACL associated with the directory referred to
+ by the
+ .Va path_p
+ parameter.
++.Ss Fn acl_set_file_at
++The
++.Fn acl_set_file_at
++function operates in exactly the same way as
++.Fn acl_set_file ,
++except for the differences described here.
++.Pp
++If the pathname given in
++.Va path_p
++is relative, then it is interpreted relative to the directory referred to by the file descriptor
++.Va dirfd
++(rather than relative to the current working directory of the calling process, as is done by
++.Fn acl_set_file ) .
++.Pp
++If
++.Va path_p
++is relative and
++.Va dirfd
++is the special value
++.Dv AT_FDCWD ,
++then
++.Va path_p
++is interpreted relative to the current working directory of the calling process (like
++.Fn acl_set_file ) .
++.Pp
++If
++.Va path_p
++is absolute, then
++.Va dirfd
++is ignored.
++.Pp
++The
++.Va at_flags
++argument can either be 0, or include one or more of the following flags ORed:
++.Bl -tag
++.It Dv AT_EMPTY_PATH
++If
++.Va path_p
++is an empty string, operate on the file referred to by
++.Va dirfd
++(which may have been obtained using the
++.Xr open 2
++.Dv O_PATH
++flag). In this case,
++.Va dirfd
++can refer to any type of file, not just a directory, and the behavior of
++.Fn acl_set_file_at
++is similar to that of
++.Fn acl_set_fd .
++.It Dv AT_SYMLINK_NOFOLLOW
++If
++.Va path_p
++refers to a symbolic link, do not dereference it: instead, fail the operation
++and set the global variable
++.Va errno
++to
++.Er ENOTSUP .
++This indicates that the symbolic link cannot have ACLs.
++.El
+ .Sh RETURN VALUE
+-.Rv -std acl_set_file
++.Rv -std acl_set_file acl_set_file_at
+ .Sh ERRORS
+ If any of the following conditions occur, the
+ .Fn acl_set_file
+-function returns
++and
++.Fn acl_set_file_at
++functions return
+ .Li -1
+-and sets
++and set
+ .Va errno
+ to the corresponding value:
+ .Bl -tag -width Er
+@@ -100,6 +182,14 @@ Argument
+ .Va type
+ specifies a type of ACL that cannot be associated with
+ .Va path_p .
++.It Bq Er EBADF
++The argument
++.Va path_p
++is relative but the argument
++.Va dirfd
++is neither
++.Dv AT_FDCWD
++nor a valid file descriptor.
+ .It Bq Er EINVAL
+ The argument
+ .Va acl
+@@ -111,13 +201,22 @@ can obtain.
+ .Pp
+ The
+ .Va type
+-parameter is not ACL_TYPE_ACCESS or ACL_TYPE_DEFAULT.
++parameter is not
++.Dv ACL_TYPE_ACCESS
++or
++.Dv ACL_TYPE_DEFAULT .
+ .Pp
+ The
+ .Va type
+-parameter is ACL_TYPE_DEFAULT, but the file referred to by
++parameter is
++.Dv ACL_TYPE_DEFAULT ,
++but the file referred to by
+ .Va path_p
+ is not a directory.
++.Pp
++An invalid flag was specified in the
++.Va at_flags
++argument.
+ .It Bq Er ENAMETOOLONG
+ The length of the argument
+ .Va path_p
+@@ -130,7 +229,21 @@ points to an empty string.
+ The directory or file system that would contain the new ACL cannot be extended or the file system is out of file allocation resources.
+ .It Bq Er ENOTDIR
+ A component of the path prefix is not a directory.
++.Pp
++The argument
++.Va path_p
++is relative and the argument
++.Va dirfd
++is a file descriptor referring to a file other than a directory.
+ .It Bq Er ENOTSUP
++The argument
++.Va at_flags
++includes the flag
++.Dv AT_SYMLINK_NOFOLLOW
++and
++.Va path_p
++is a symbolic link.
++.Pp
+ The file identified by
+ .Va path_p 
+ cannot be associated with the ACL because the file system on which the file
+@@ -149,12 +262,18 @@ when the
+ .Va acl
+ parameter refers to an empty ACL and the
+ .Va type
+-parameter is ACL_TYPE_DEFAULT is an extension in the Linux implementation, in order that all values returned by
++parameter is
++.Dv ACL_TYPE_DEFAULT
++is an extension in the Linux implementation, in order that all values returned by
+ .Fn acl_get_file
+ can be passed to
+ .Fn acl_set_file .
+ The POSIX.1e function for removing a default ACL is
+ .Fn acl_delete_def_file .
++.Pp
++Function
++.Fn acl_get_file_at
++is a Linux specific extension.
+ .Sh SEE ALSO
+ .Xr acl_delete_def_file 3 ,
+ .Xr acl_get_file 3 ,
+diff --git a/man/man3/acl_set_file_at.3 b/man/man3/acl_set_file_at.3
+new file mode 100644
+index 0000000..acb33f9
+--- /dev/null
++++ b/man/man3/acl_set_file_at.3
+@@ -0,0 +1 @@
++.so man3/acl_set_file.3
+diff --git a/man/man5/acl.5 b/man/man5/acl.5
+index 396370b..b88c379 100644
+--- a/man/man5/acl.5
++++ b/man/man5/acl.5
+@@ -21,7 +21,7 @@
+ .\" License along with this manual.  If not, see
+ .\" <http://www.gnu.org/licenses/>.
+ .\"
+-.Dd March 23, 2002
++.Dd June 5, 2026
+ .Dt ACL 5
+ .Os "Linux ACL"
+ .Sh NAME
+@@ -462,7 +462,7 @@ For further details, see
+ .Ss POSIX 1003.1e FUNCTIONS BY AVAILABILITY
+ The first group of functions is supported on most systems with POSIX-like
+ access control lists, while the second group is supported on fewer systems.
+-For applications that will be ported the second group is best avoided.
++For applications that will be ported, the second group is best avoided.
+ .Pp
+ .Xr acl_delete_def_file 3 ,
+ .Xr acl_dup 3 ,
+@@ -498,14 +498,18 @@ These non-portable extensions are available on Linux systems.
+ .Pp
+ .Xr acl_check 3 ,
+ .Xr acl_cmp 3 ,
++.Xr acl_delete_def_file_at 3 ,
+ .Xr acl_entries 3 ,
+ .Xr acl_equiv_mode 3 ,
+ .Xr acl_error 3 ,
+ .Xr acl_extended_fd 3 ,
+ .Xr acl_extended_file 3 ,
++.Xr acl_extended_file_at 3 ,
+ .Xr acl_extended_file_nofollow 3 ,
+ .Xr acl_from_mode 3 ,
++.Xr acl_get_file_at 3 ,
+ .Xr acl_get_perm 3 ,
++.Xr acl_set_file_at 3 ,
+ .Xr acl_to_any_text 3
+ .Sh AUTHOR
+ Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch b/meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch
new file mode 100644
index 00000000000..3fbc80bc0c7
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch
@@ -0,0 +1,109 @@
+From 705f229b08f5bc3e7df4cda21ba7cf3aad103f37 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Wed, 17 Jun 2026 17:16:26 +0200
+Subject: [PATCH] man pages: Clarify symlink following behavior
+
+In the acl_delete_def_file(), acl_extended_file(), acl_get_file(), and
+acl_set_file() manual pages, clarify that those functions follow symlinks;
+before this change, that wasn't very obvious.
+
+CVE: CVE-2026-54369
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=170dbd3beff9bd5bdab3f72db1a04bf282f6087c]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 170dbd3beff9bd5bdab3f72db1a04bf282f6087c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ man/man3/acl_delete_def_file.3 |  7 ++++++-
+ man/man3/acl_extended_file.3   |  7 ++++++-
+ man/man3/acl_get_file.3        | 10 +++++++++-
+ man/man3/acl_set_file.3        |  7 ++++++-
+ 4 files changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/man/man3/acl_delete_def_file.3 b/man/man3/acl_delete_def_file.3
+index 059aa8f..0bb48d0 100644
+--- a/man/man3/acl_delete_def_file.3
++++ b/man/man3/acl_delete_def_file.3
+@@ -46,8 +46,13 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .Sh DESCRIPTION
+ The
+ .Fn acl_delete_def_file
+-function deletes a default ACL from the directory whose pathname is pointed to by the argument
++function deletes a default ACL from the directory whose pathname is given in
+ .Va path_p .
++If
++.Va path_p
++is a symbolic link,
++.Fn acl_delete_def_file
++operates on the directory the link refers to.
+ .Pp
+ The effective user ID of the process must match the owner of the file or
+ directory or the process must have the CAP_FOWNER capability for the
+diff --git a/man/man3/acl_extended_file.3 b/man/man3/acl_extended_file.3
+index 3a659f7..b3b3dbc 100644
+--- a/man/man3/acl_extended_file.3
++++ b/man/man3/acl_extended_file.3
+@@ -53,13 +53,18 @@ The
+ .Fn acl_extended_file
+ function returns
+ .Li 1
+-if the file or directory referred to by the argument
++if the file or directory whose pathname is given in
+ .Va path_p
+ is associated with an extended access ACL, or if the directory referred to by
+ .Va path_p
+ is associated with a default ACL. The function returns
+ .Li 0
+ if the file has neither an extended access ACL nor a default ACL.
++If
++.Va path_p
++is a symbolic link,
++.Fn acl_extended_file
++returns information about the file or directory the link refers to.
+ .Pp
+ An extended ACL is an ACL that contains entries other than the three
+ required entries of tag types ACL_USER_OBJ, ACL_GROUP_OBJ and ACL_OTHER.
+diff --git a/man/man3/acl_get_file.3 b/man/man3/acl_get_file.3
+index cd65c36..15e561f 100644
+--- a/man/man3/acl_get_file.3
++++ b/man/man3/acl_get_file.3
+@@ -48,8 +48,16 @@ Linux Access Control Lists library (libacl, \-lacl).
+ .Sh DESCRIPTION
+ The
+ .Fn acl_get_file
+-function retrieves the access ACL associated with a file or directory, or the default ACL associated with a directory. The pathname for the file or directory is pointed to by the argument
++function retrieves the access ACL associated with a file or directory, or the
++default ACL associated with a directory. The pathname for the file or directory
++is given in the argument
+ .Va path_p .
++If
++.Va path_p
++is a symbolic link,
++.Fn acl_get_file
++returns information about the file or directory the link refers to.
++.Pp
+ The ACL is placed into working storage and
+ .Fn acl_get_file
+ returns a pointer to that storage.
+diff --git a/man/man3/acl_set_file.3 b/man/man3/acl_set_file.3
+index c2b8b58..05d7da4 100644
+--- a/man/man3/acl_set_file.3
++++ b/man/man3/acl_set_file.3
+@@ -52,8 +52,13 @@ The
+ .Fn acl_set_file
+ function associates an access ACL with a file or directory, or
+ associates a default ACL with a directory. The pathname for the file or
+-directory is pointed to by the argument
++directory is given in the argument
+ .Va path_p .
++If
++.Va path_p
++is a symbolic link,
++.Fn acl_set_file
++operates on the file or directory the link refers to.
+ .Pp
+ The effective user ID of the process must match the owner of the file or
+ directory or the process must have the CAP_FOWNER capability for the
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692e..28c587a0e08 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -18,6 +18,12 @@ DEPENDS = "attr"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch \
            file://0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch \
+           file://CVE-2026-54369-dependent_p1.patch \
+           file://CVE-2026-54369-dependent_p2.patch \
+           file://CVE-2026-54369-dependent_p3.patch \
+           file://CVE-2026-54369_p1.patch \
+           file://CVE-2026-54369_p2.patch \
+           file://CVE-2026-54369_p3.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
-- 
2.35.6
