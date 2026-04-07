Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1542FEEF40
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:16:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81105.1775567778718687073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 06:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N9Yl3Xlv;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a29e6110so31294605e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775567777; x=1776172577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tII4YvBqUvio4LATO8Omot4iJVR6CgbJDFIIiNz1Jfw=;
        b=N9Yl3XlvvNtTKkW6Ip3btGK00RUgYLXnE765pjs4KGSTx/a8n1rq1BPwsjOJBUnvEg
         r80E4LYxU2yG1TeFQ2qHNQ5V64UNV7PgfZP0rgZLf7/mARi6lbXFkgYk/zzhF1OoWwKq
         +ijKvlRCJglsvdpd8jxErGIom/3cT+ibTmCC7bEmzFfdqN5fxWygwOPFWRBMSnf81j1S
         V+cwdkoSvS336RjfYJPdVNK7RjTffDEyNATWRdG8/4nh6Wa4ARytU3Re4lZ/eV2ATfsc
         wuO8RSHS5QCAJ4B1B6OWNgnlQ2V4lFeZ5aue/SxDEXP2yFWw9ERuY9moCHtQHuTq/DyJ
         djtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567777; x=1776172577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tII4YvBqUvio4LATO8Omot4iJVR6CgbJDFIIiNz1Jfw=;
        b=M9w/HsQmYBcJD/qkwhNrohMabqyD12n2svCvNXHGCQQBY6rCNwHO8OnUfciiKG2LzF
         6i0xKsNDbGLzA/w2jU9unrzcpqlK9OnfVEqOny+Yd12I9DabEb8RN+XHFK9NR7RV3LAd
         6xlqwxrQSjwgJ0ayLiXblmiZptBjIfrAA0ypAoRa6cchJEJGT41b1x5/sekcitJhbwO1
         yaHSobMrNzi/i5xM7BUwmM4KUQ1ZHITElapaERMIUZjr7nmIRUu5NuEnQ0EAjAGYRNpT
         KP9FmNncNkrf0Jd5KlBUS7LDUlYp3G4mrt0QfSp6JuaqLywtHbW2qxe49LgtXt/Qqwh6
         Mfww==
X-Gm-Message-State: AOJu0YwiFcp4AcYIZKvJIClvAOQGlPUTv2OYD8RzTpqN6VR4b8TebjqO
	pw3AcF1uYuSmrCOVk4OigXhu0xv318ipCnKrcc+zw9Avf9CloA4iNkcf/TP6IA==
X-Gm-Gg: AeBDieshpc6gRcfI04gjF5Yp6sKQqPqax9BdSgQ4VCor/bWlem12c4AsZUHMgKPvsIa
	Y8scj1k9kGXFYRebKkzBvd6GjtlayvhSWr3fROfm8l1wH0u25z8AaW4bZRwhBBBcVyOG+SCNvWU
	pLVS+PTKp7/G4zqps7ax8e747dymmpnWdWcSCZZKg5UXRURroyJYRoGobOJcAyDzbDYe4Gmw8MN
	pKxZNc+l6bNoonsGO66XapmSoEaOwjImpW+KXa64hLpMxm9oEH/OIoNMe6WCp8uXd6Rd+EnZEtB
	W+x8Zj8Ih9MvxtRysl82jNKRlI43NZIaE0xTOVAyy6Nr413G9vg8mEyUkxpxe+3n8JhjF9Ex90R
	KWuJ9+NbQVnOQfDcwaIwHqESlrCs6EsluGEJIyqKmVip1/o7s7UvPiYFgnz9mW0PUoxpdSaxBeO
	TiAwK6d0wBerId
X-Received: by 2002:a05:600c:8b32:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488996afe1cmr230687715e9.3.1775567776632;
        Tue, 07 Apr 2026 06:16:16 -0700 (PDT)
Received: from term011.lan (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fd5f3csm186082715e9.2.2026.04.07.06.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:16:16 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [whinlatter][PATCH 1/2] binutils: Fix build with GLIBC 2.43 on the host
Date: Tue,  7 Apr 2026 15:15:54 +0200
Message-ID: <20260407131555.838073-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234732

Added a patch to fix a build error in the CALL_UTIL() macro
when built against GLIBC 2.43 on Fedora 44. This fixes
binutils-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5..666b588062 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -46,4 +46,5 @@ SRC_URI = "\
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
      file://0020-CVE-2025-11840.patch \
+     file://0001-gprofng-protect-against-standard-library-macros.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..034b252821
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,33 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.53.0
+
-- 
2.53.0


