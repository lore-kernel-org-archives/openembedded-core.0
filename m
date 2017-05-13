Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA6377CE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:59:43 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id e64so38106717pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 19:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KpmZIvC4ELjGm9lb1GmoBv9xPz3qKYlijPXYwZoM4QQ=;
	b=gzRmq/+Dk4VEMIRVk/7ehCYJqD99BiZVgB6d9oksUyB/F+IsDfhZ0OuCYaHM2M6Yk7
	UOuO8S1KYhQGADMAYwGRiSGGS0h7Y2tdrzmUcTUGmWxiyPe7EYFszs3h5O6dgiIKBhRI
	pgkiOzeog1m659oLcnArZvFphU4GA3I5d8oQq5TZDTov4aBXlvWU4ydyaOC6z7Aj2zZz
	/+NZxgVa+J6e6UhmThip1vuiGvTZhuglK3JshiDyHzJk34l1SdzU2753oj6/eXQXaKUf
	ODLMIQGeq3TAdRuiE3f9hWStt0cRTUiQ38Dm5tB0hQ0Pnhq1vbhYGLG2eSfaBlUwhzNT
	jBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KpmZIvC4ELjGm9lb1GmoBv9xPz3qKYlijPXYwZoM4QQ=;
	b=uKPBK5z/miiUwpeIxEmfRlZs08Ng4GSZOu6gnkMv/hj9l9wYqBpG5QL0lBGymlQOSu
	10yL3nbgSMtv/4S3v2ySzpKJ2NzddIOLzU2equmL4fggisXvGJFdNo013NQQT8lDXc4o
	lLwtOOEpxqaAeCcTj6/Rl8rOCabw0lGEA2ma0WGv6YwN4bBgvudXQQjdUdBDoKGjkC0V
	ZYswyGm2S1/+QOBnc3JqTq6h0UvIvlGuZ6VLKdY2f0sIedRcSLKs4H6qyGehFUgYKSfI
	fXBY/yFJ/pe9bS4NgGHR87zsEwLD3nOhgitLTFeF5jPMKcQUVR8fOSUkdTUPx0c3I+UG
	CsZQ==
X-Gm-Message-State: AODbwcDZxl6tn7KyN5mvTBme0OuEWl5edbA7N26U47AbzjyILvr9/8l0
	25eICnGBLAYcKA==
X-Received: by 10.84.224.70 with SMTP id a6mr10029287plt.38.1494644384619;
	Fri, 12 May 2017 19:59:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id q4sm4541134pgf.9.2017.05.12.19.59.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 19:59:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 19:59:27 -0700
Message-Id: <20170513025932.26254-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170513025932.26254-1-raj.khem@gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
Subject: [PATCH 2/7] libnsl2: Add recipe
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
X-List-Received-Date: Sat, 13 May 2017 02:59:44 -0000

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


