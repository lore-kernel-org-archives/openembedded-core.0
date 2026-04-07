Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1135CFEEF44
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:35:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81517.1775568930069667499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 06:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZizSfqCf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so33200885e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775568928; x=1776173728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1oRaBl2EE2srAz4p8WcVi9VRaf1DpdmbS7I8tT/Sgls=;
        b=ZizSfqCfE+KFLpFXg0+ylq5qvwAXrx3UqCGyFutA//IXTMBg+Ufi8MDJkQZv8NpgFM
         C8BNmNMwa5RCs5umC0zsVyvOWJCM42Fv+69jSrPSZiJ+7k9Bl4FF1GcLPHfhk4PjB4O5
         23zVxor+P/cUEwGWQiZHbgE0Q4LM8MJ+RxOJjIR/UNIF7lfuTukxTyzLx9W0Aq4ZxNeu
         H5kftiWVu82F07AAJAhM5ooh8TYv9tRqGI7wR+r/87MrUmlemiPO3mXSJEq20uweY5cK
         dvkOk0uzvIqIJse84MiNhg5Zg0Q3GQD/rEKGi4XrOgQQQIFtPT4NSdw8x3N6uD+sMUgD
         e9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568928; x=1776173728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oRaBl2EE2srAz4p8WcVi9VRaf1DpdmbS7I8tT/Sgls=;
        b=lNdmYO+2QgMo8TYPmmiFL2C0GxYV3Ai5lFJDWecH6Y9SyNVGJhbRRRa45+YNR4f4YM
         W+2n18cNJ8hqHn6bk9bHtnww3uiSdBjzAq4dTgtVvVj6FdpWSj0uXwX9/KlMBqH8eeF5
         aOQNlVj7/2bNUtOu6DNYIrLbzbxSS90F+M8IebiD8ioV/q6vej3K94sTA4hrhc4FS9Op
         ATnoxmchrOcdxo6BpwdVETcIWLW7Y0Ne99eSIPmS2ipYHCUxJW5CGZ1F8iGH5PGjp8NX
         fQ4kKDYI+PRSUc7dkZRwUiL0Zu/Fg1iWyxcaVbNtKKitxfOWAnPX71KjNN7eoTWkw0Sc
         0fFA==
X-Gm-Message-State: AOJu0Yy6Wng2+9uiaREiqYX2OpT+LavuL0IrtyuT8v1sz14nZZVgPsH6
	W0xMoswuf2sjIbaQJZIIYn3ftaP58cTThWYJ55qMjVj18TWvNQ3sTlw4+HGUJA==
X-Gm-Gg: AeBDieuelhqq/ayAuTrz+/o9UiqPqwz14wn4IIpAwGUBjXrYvMKTHWpZFy3cVOYjr91
	Mros0hrhFWM5R/hOea5+jyeezbrr5caYLmNZSQf3scTtNsmmt7l+RMxiXkZtq7Q6goP4w2qFjr8
	EenWgABIUv5JreMBSfOXMImbJW73p59aPsW6GQbZ1/JZ4ppq4Uhkjfss6q/prgjY3x3ck9OK119
	qUrCeGjC7YBrWPwXU3IUdtGub4Tvrpe8uynbVfhjSqgSl4Nog0n88rwWYNvlCVgWQ2NVSrr3za7
	ui842eNd8ls1QOcjO63a0IVQ2J6l87g0Kp8x9wKc49uMH/lviQAydkzvgB+SwNzi0vwuQCUufaP
	CufyVISo0/HBclW89i0jV5E+5bG+r+ErfmyDV6no0eaCRaJFFfw6W3J8MHFDUw0spJ+qnd1SiNn
	q9+vXkmcD+Uu1a
X-Received: by 2002:a05:600d:8448:b0:488:ae6c:42c0 with SMTP id 5b1f17b1804b1-488ae6c4432mr104410725e9.7.1775568928014;
        Tue, 07 Apr 2026 06:35:28 -0700 (PDT)
Received: from term011.lan (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm50563486f8f.23.2026.04.07.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [whinlatter][PATCH v2 1/2] binutils: Fix build with GLIBC 2.43 on the host
Date: Tue,  7 Apr 2026 15:35:20 +0200
Message-ID: <20260407133521.840916-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234736

Added a patch to fix a build error in the CALL_UTIL() macro
when built against GLIBC 2.43 on Fedora 44. This fixes
binutils-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 0000000000..b626c51b6c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,34 @@
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
+Signed-off-by: Andreas Schwab <schwab@suse.de>
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


