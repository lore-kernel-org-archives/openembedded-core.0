Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 487B771D87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:00:56 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e193so70350081pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KpmZIvC4ELjGm9lb1GmoBv9xPz3qKYlijPXYwZoM4QQ=;
	b=I39nhFxyqgili2tJvqjuNsriQ37VM3+ZwQvV4rdcMQ4slH+z7fiRfxxKkZV2Pb/3Gi
	WDJlQgsPUTJhxMoIUp+bsGgOyBikeZUsGG/GHCu4oyrNbicJtOXsdyAm1qMd3EzfJzwz
	Fw4HQ+RRAeAlCIBCSK0gqiED5WIxgWP3+En+FRFomdnk8HDeryOdgkytP0i/Gx9AoMsd
	9RncLi2jabVhvqXd2ByNDD+LLfm5hPdz9V6QShCYoxT9QFKgUoDpr6+JKEs2hz8NlCqG
	34wt1vBEcJQfaz4cv9tGimw01ycGxT78qgJzL2SZ5q+W8hsNQldg7hEmc2EAeMn0u4LR
	dgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KpmZIvC4ELjGm9lb1GmoBv9xPz3qKYlijPXYwZoM4QQ=;
	b=TB9ZqHAFBLQsEa10UsTWRMhDyTER/f+0mLvwctphXw5+GrwrBoMcunDZfaGtNIEEUL
	Mfmh9rQpmGYjHUoIOf4+78Ob2afMxKS9lySD86QLPHuYktbo7qwEibCcv3ZYSCrkH2tF
	695mdmFFcjmxDpL3L5C1iwsTX2Blk3nNOBGqLXYDkOwGD+wZesIblmOobHcpK9KV34Cs
	VwNP3mwJG7B2yoPhHOaaqPcwOFsX23vMIJtseKaQi6GXS7KbgTCVyRTehIO/cs7Dj4I3
	htcKrE0JzufgHkeNXUS2qzarqbeigSz+4m7ZmfbsEwdozp6XX81Bw/iIo6jnXhBRhA07
	+1uw==
X-Gm-Message-State: AODbwcAchfpCZWYf/9SASHxep+8NXF1+wCi3lf3kY8FWurmPUybZLytP
	hzVOYNrWhhGKz7cf
X-Received: by 10.98.59.2 with SMTP id i2mr23158709pfa.50.1495429257805;
	Sun, 21 May 2017 22:00:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.00.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:00:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:29 -0700
Message-Id: <20170522050042.42403-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 02/15] libnsl2: Add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 May 2017 05:00:59 -0000

NIS functionality has been split out into independent
library from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-sys-cdefs.h-explicitly.patch      | 68 ++++++++++++++++++++++
 .../0002-Define-glibc-specific-macros.patch        | 57 ++++++++++++++++++
 meta/recipes-extended/libnsl/libnsl2_git.bb        | 35 +++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
 create mode 100644 meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
 create mode 100644 meta/recipes-extended/libnsl/libnsl2_git.bb

diff --git a/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch b/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
new file mode 100644
index 0000000000..c6c259adb8
--- /dev/null
+++ b/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
@@ -0,0 +1,68 @@
+From 508a0ff690dfebc17c4f55a5f81824ed549bed66 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Apr 2017 09:13:33 -0700
+Subject: [PATCH 1/2] include sys/cdefs.h explicitly
+
+glibc includes this header indirectly but not musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream_status: Pending
+
+ src/rpcsvc/nis.h    | 1 +
+ src/rpcsvc/nislib.h | 1 +
+ src/rpcsvc/ypclnt.h | 1 +
+ src/rpcsvc/ypupd.h  | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/rpcsvc/nis.h b/src/rpcsvc/nis.h
+index 933c4d9..88cbca0 100644
+--- a/src/rpcsvc/nis.h
++++ b/src/rpcsvc/nis.h
+@@ -32,6 +32,7 @@
+ #ifndef _RPCSVC_NIS_H
+ #define _RPCSVC_NIS_H 1
+ 
++#include <sys/cdefs.h>
+ #include <features.h>
+ #include <rpc/rpc.h>
+ #include <rpcsvc/nis_tags.h>
+diff --git a/src/rpcsvc/nislib.h b/src/rpcsvc/nislib.h
+index a59c19b..a53fab3 100644
+--- a/src/rpcsvc/nislib.h
++++ b/src/rpcsvc/nislib.h
+@@ -19,6 +19,7 @@
+ #ifndef	__RPCSVC_NISLIB_H__
+ #define	__RPCSVC_NISLIB_H__
+ 
++#include <sys/cdefs.h>
+ #include <features.h>
+ 
+ __BEGIN_DECLS
+diff --git a/src/rpcsvc/ypclnt.h b/src/rpcsvc/ypclnt.h
+index fe43fd4..a686b61 100644
+--- a/src/rpcsvc/ypclnt.h
++++ b/src/rpcsvc/ypclnt.h
+@@ -20,6 +20,7 @@
+ #ifndef	__RPCSVC_YPCLNT_H__
+ #define	__RPCSVC_YPCLNT_H__
+ 
++#include <sys/cdefs.h>
+ #include <features.h>
+ 
+ /* Some defines */
+diff --git a/src/rpcsvc/ypupd.h b/src/rpcsvc/ypupd.h
+index d07fd4d..2c57301 100644
+--- a/src/rpcsvc/ypupd.h
++++ b/src/rpcsvc/ypupd.h
+@@ -33,6 +33,7 @@
+ #ifndef __RPCSVC_YPUPD_H__
+ #define __RPCSVC_YPUPD_H__
+ 
++#include <sys/cdefs.h>
+ #include <features.h>
+ 
+ #include <rpc/rpc.h>
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch b/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
new file mode 100644
index 0000000000..68d819c42c
--- /dev/null
+++ b/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
@@ -0,0 +1,57 @@
+From 60282514ea01af004d7f9e66dd3929223b7d2e7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Apr 2017 09:16:12 -0700
+Subject: [PATCH 2/2] Define glibc specific macros
+
+Check and define
+rawmemchr, __asprintf, __mempcpy, __strtok_r
+__always_inline, TEMP_FAILURE_RETRY
+
+if not existing. Helps compiling with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream_status: Pending
+
+diff --git a/src/rpcsvc/nis.h b/src/rpcsvc/nis.h
+index 88cbca0..23fc20c 100644
+--- a/src/rpcsvc/nis.h
++++ b/src/rpcsvc/nis.h
+@@ -57,6 +57,34 @@ __BEGIN_DECLS
+  *                                              <kukuk@suse.de>
+  */
+ 
++#ifndef rawmemchr
++#define rawmemchr(s,c) memchr((s),(size_t)-1,(c))
++#endif
++
++#ifndef __asprintf
++#define __asprintf asprintf
++#endif
++
++#ifndef __mempcpy
++#define __mempcpy mempcpy
++#endif
++
++#ifndef __strtok_r
++#define __strtok_r strtok_r
++#endif
++
++#ifndef __always_inline
++#define __always_inline __attribute__((__always_inline__))
++#endif
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(exp) ({ \
++typeof (exp) _rc; \
++ do { \
++  _rc = (exp); \
++ } while (_rc == -1 && errno == EINTR); \
++ _rc; })
++#endif
+ 
+ #ifndef __nis_object_h
+ #define __nis_object_h
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
new file mode 100644
index 0000000000..1698f69edb
--- /dev/null
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -0,0 +1,35 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Library containing NIS functions using TI-RPC (IPv6 enabled)"
+DESCRIPTION = "This library contains the public client interface for NIS(YP) and NIS+\
+               it was part of glibc and now is standalone packages. it also supports IPv6"
+HOMEPAGE = "https://github.com/thkukuk/libnsl"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+DEPENDS = "libtirpc"
+DEPENDS_append_libc-musl = " bsd-headers"
+
+PV = "1.0.5+git${SRCPV}"
+
+SRCREV = "dfa2f313524aff9243c4d8ce1bace73786478356"
+
+SRC_URI = "git://github.com/thkukuk/libnsl \
+           file://0001-include-sys-cdefs.h-explicitly.patch \
+           file://0002-Define-glibc-specific-macros.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig gettext
+
+EXTRA_OECONF += "--libdir=${libdir}/nsl --includedir=${includedir}/nsl"
+
+do_install_append() {
+	install -d ${D}${libdir}
+	mv ${D}${libdir}/nsl/pkgconfig ${D}${libdir}
+}
+
+FILES_${PN} += "${libdir}/nsl/*.so.*"
+FILES_${PN}-dev += "${includedir}/nsl ${libdir}/nsl/*.so"
-- 
2.13.0


