Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72AFC74D40
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j11-v6so16456727pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2bPRJcZIlKFvDF1OnT5ZG6LP5ZKdlq4/cHfpS1ectak=;
	b=ZIKVRY1mVdj5BGPeXSD9L6TULFEW0tXVbZLD3s1UuAkPytMbc0wXMmPl86BbBKAIW8
	HSxosFb+ZJphLE7NmoG0GKIpFlEzziL0KLBpsW4IUZRB1SjdL4ywBQntDMilw4DkrFJd
	1JiXioJ4CY91R9KwubWfkDBkdOUhvZ39OxnD16XxwDKn3ZdXIxiDYKtl4afCcceQnz/S
	9mlc6c4p0zNHJ9Yxn+kR7IiffD9/C9IXDSLTDp/119pqBQY+40V2irmpNDUsCTFGIX1i
	6TsLYENI0OXlSWLYOruFA05D8CYesHAXO44vHA6qm2W2amVen96EapGlgHzWIXz3rlTC
	hfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2bPRJcZIlKFvDF1OnT5ZG6LP5ZKdlq4/cHfpS1ectak=;
	b=IkCevIvELnWJDPDcAUvthr5EkmxsdWBd7ORPvz/qnX/8NLH6RcvEHj9ZqCIPrqqad3
	W/qLi3U4g+/WyebPZB95nfA4TR3Kslp3ICrYX6gmabqXzSICVYQM+85VZeJ3s1YyyQBF
	xPx+DoRSRB19h03Ta9s5NDn3JKVdmosC4dfXO9Z1u8Ic2jfDPP4ktjK2OHwtYpoO5q2s
	4p5UHNA42vT/1QyS5CX9yU2UurqQY8gi6LGbnVfoJvRw97z9nQ8M23ykirHwJGRqJjbp
	QCjX3r3g7mNSywAjLalA7g7uvVSRy4nuA6SSCbCBpkwjBVlj+FBHM9PCPT+72GCYns01
	GpMg==
X-Gm-Message-State: ALQs6tDqwm1BGLDWwwllvqJUX7BRskkH47ZXPCGrLyWtB1tQksfJFMaT
	N8744+kcKdb8OvF1Dpeo0E2R4Q==
X-Google-Smtp-Source: AB8JxZpBMM1Rmicfd7AgXIPlgtzop7UvsZavkPCgWBEi0ZycTuWrjGH+cKr3thFGp0GaxKuMOiWOZg==
X-Received: by 2002:a65:6188:: with SMTP id
	c8-v6mr23946586pgv.131.1525479278171; 
	Fri, 04 May 2018 17:14:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:07 -0700
Message-Id: <b17fdf8ff4f2a9d7a1cfabc3d17e9177d7f7e4b3.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 13/27] libnsl: Upgrade to tip beyond 1.2.0 release
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
X-List-Received-Date: Sat, 05 May 2018 00:14:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-sys-cdefs.h-explicitly.patch | 68 -------------------
 ...de-stdint.h-for-uintptr_t-definition.patch | 27 --------
 .../0002-Define-glibc-specific-macros.patch   | 57 ----------------
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  8 +--
 4 files changed, 2 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch

diff --git a/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch b/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
deleted file mode 100644
index bd647ac55e..0000000000
--- a/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 508a0ff690dfebc17c4f55a5f81824ed549bed66 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Apr 2017 09:13:33 -0700
-Subject: [PATCH 1/2] include sys/cdefs.h explicitly
-
-glibc includes this header indirectly but not musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/rpcsvc/nis.h    | 1 +
- src/rpcsvc/nislib.h | 1 +
- src/rpcsvc/ypclnt.h | 1 +
- src/rpcsvc/ypupd.h  | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/src/rpcsvc/nis.h b/src/rpcsvc/nis.h
-index 933c4d9..88cbca0 100644
---- a/src/rpcsvc/nis.h
-+++ b/src/rpcsvc/nis.h
-@@ -32,6 +32,7 @@
- #ifndef _RPCSVC_NIS_H
- #define _RPCSVC_NIS_H 1
- 
-+#include <sys/cdefs.h>
- #include <features.h>
- #include <rpc/rpc.h>
- #include <rpcsvc/nis_tags.h>
-diff --git a/src/rpcsvc/nislib.h b/src/rpcsvc/nislib.h
-index a59c19b..a53fab3 100644
---- a/src/rpcsvc/nislib.h
-+++ b/src/rpcsvc/nislib.h
-@@ -19,6 +19,7 @@
- #ifndef	__RPCSVC_NISLIB_H__
- #define	__RPCSVC_NISLIB_H__
- 
-+#include <sys/cdefs.h>
- #include <features.h>
- 
- __BEGIN_DECLS
-diff --git a/src/rpcsvc/ypclnt.h b/src/rpcsvc/ypclnt.h
-index fe43fd4..a686b61 100644
---- a/src/rpcsvc/ypclnt.h
-+++ b/src/rpcsvc/ypclnt.h
-@@ -20,6 +20,7 @@
- #ifndef	__RPCSVC_YPCLNT_H__
- #define	__RPCSVC_YPCLNT_H__
- 
-+#include <sys/cdefs.h>
- #include <features.h>
- 
- /* Some defines */
-diff --git a/src/rpcsvc/ypupd.h b/src/rpcsvc/ypupd.h
-index d07fd4d..2c57301 100644
---- a/src/rpcsvc/ypupd.h
-+++ b/src/rpcsvc/ypupd.h
-@@ -33,6 +33,7 @@
- #ifndef __RPCSVC_YPUPD_H__
- #define __RPCSVC_YPUPD_H__
- 
-+#include <sys/cdefs.h>
- #include <features.h>
- 
- #include <rpc/rpc.h>
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch b/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
deleted file mode 100644
index e9ae517107..0000000000
--- a/meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d71cbeb3b76e54778a4d5eec6d387cce653537ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 9 Jun 2017 09:49:35 -0700
-Subject: [PATCH] nis_call.c: Include stdint.h for uintptr_t definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/nisplus/nis_call.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/nisplus/nis_call.c b/src/nisplus/nis_call.c
-index 1a2b90c..1dc982d 100644
---- a/src/nisplus/nis_call.c
-+++ b/src/nisplus/nis_call.c
-@@ -23,6 +23,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <string.h>
-+#include <stdint.h>
- #include <libintl.h>
- #include <rpc/rpc.h>
- #include <rpc/auth.h>
--- 
-2.13.1
-
diff --git a/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch b/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
deleted file mode 100644
index 75fda4b0f0..0000000000
--- a/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 60282514ea01af004d7f9e66dd3929223b7d2e7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Apr 2017 09:16:12 -0700
-Subject: [PATCH 2/2] Define glibc specific macros
-
-Check and define
-rawmemchr, __asprintf, __mempcpy, __strtok_r
-__always_inline, TEMP_FAILURE_RETRY
-
-if not existing. Helps compiling with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
-diff --git a/src/rpcsvc/nis.h b/src/rpcsvc/nis.h
-index 88cbca0..23fc20c 100644
---- a/src/rpcsvc/nis.h
-+++ b/src/rpcsvc/nis.h
-@@ -57,6 +57,34 @@ __BEGIN_DECLS
-  *                                              <kukuk@suse.de>
-  */
- 
-+#ifndef rawmemchr
-+#define rawmemchr(s,c) memchr((s),(size_t)-1,(c))
-+#endif
-+
-+#ifndef __asprintf
-+#define __asprintf asprintf
-+#endif
-+
-+#ifndef __mempcpy
-+#define __mempcpy mempcpy
-+#endif
-+
-+#ifndef __strtok_r
-+#define __strtok_r strtok_r
-+#endif
-+
-+#ifndef __always_inline
-+#define __always_inline __attribute__((__always_inline__))
-+#endif
-+
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(exp) ({ \
-+typeof (exp) _rc; \
-+ do { \
-+  _rc = (exp); \
-+ } while (_rc == -1 && errno == EINTR); \
-+ _rc; })
-+#endif
- 
- #ifndef __nis_object_h
- #define __nis_object_h
--- 
-2.12.2
-
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index a539148caf..c6ba80c943 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -9,16 +9,12 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
-DEPENDS_append_libc-musl = " bsd-headers"
 
-PV = "1.0.5+git${SRCPV}"
+PV = "1.2.0+git${SRCPV}"
 
-SRCREV = "dfa2f313524aff9243c4d8ce1bace73786478356"
+SRCREV = "37c5ffe3038d42e9fa9ed232ad2cbca4d8f14681"
 
 SRC_URI = "git://github.com/thkukuk/libnsl \
-           file://0001-include-sys-cdefs.h-explicitly.patch \
-           file://0002-Define-glibc-specific-macros.patch \
-           file://0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


