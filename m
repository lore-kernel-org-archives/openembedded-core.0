Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFE5CD5BC0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 06:53:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10929.1779692033139995728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2026 23:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Min4YUIQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2be75f658f3so43285575ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 23:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779692032; x=1780296832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o14j/Fo9mUoBM3aeEd5YaF45y7Sznv4XXNbkTz/VSVM=;
        b=Min4YUIQ4rAAI1NYSpbMtIcAsGu2IRINgf3PzE2jO16A8h37rymQ3rbSHoG8qHMtJ/
         00f76Sgc5NDikYh2wY7A97XcmarxGboEA3ebtfislpG+OWMEqDqlFIvsWY4/AaT3A3iY
         R1b2/O5PlbK1aKLFGp33cXrQOFPmFrSPdyj71ACECRip9VnT4JfyVcwjb5zcrIgt6gqK
         gQo36wPmORDHPJOCR7EtQObsBj61IAzCuTdhnfjpmlgqOIWIbX1Qa1ImoCX34ycDUKlJ
         lQ7U+g+gS69MDKlLGmvdsY9PXnp+jr3pLTGwhn03/mLBsi/IOdWblVZm9E9R0fLv21UV
         OWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692032; x=1780296832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o14j/Fo9mUoBM3aeEd5YaF45y7Sznv4XXNbkTz/VSVM=;
        b=i+FCpCx6vLQ2IvDnjk7HdyD1Ye0MNw7opPWxfYDJu00N2dMXySJWxwvKP4MtDd3GFG
         8A1otDIQZRI4IkL0yoYaqUQtzoL5Hv6Sqx8jKrtZgkHXEm/j6CClr46kIBTdkIKZ+kZV
         UVGz4/n3qnlnuLVkJLmiOGG3+soKzV6G1924Gpinu51dpVnF5SiBN8gxNlwcitGEFkBn
         MekGLluAk+4wCWY2ffTPOuxa2SjZ8KQ7OYtYFyozY+8YsHhhnQ1CyWRPKfaeU/Pvbr2t
         C692ei2yeEtR5Sfu681fECLd700f3bf5EV3Yq7OSQkExiMg0RPzl9mGREe1Vg0sLGtH2
         7dww==
X-Gm-Message-State: AOJu0YykWOur+QlLq235IcKS+yMSyWkY/Lmr+ZqRHMe2GgOpz2MjidXj
	kpFQ5CSXRxhEdDU6q2PXt3r6X1zauotBay5TXIHqYI/fCC3Yfh+9ThPpF4zXJnr4
X-Gm-Gg: Acq92OF4bN1zXfgS2RGmpuR5A7nH7dQ35Ls0P3CCHyUDNsqTmvmikB2AdYyY1mjHD2o
	u6AsvS/o5oXt7GeDKg7oCxeWPMZ+HVyzmCdZJsuqgrQStsfy0DkWLfuSvVAJ3elQ/dIYLtsVzkx
	ESbMwQ64FpKrbaMC7hvjzCV4Vl/blB6pSwbCrhPMtfPdTyhcXf9kQYNZjjvaG3RQSzzgcyMKVWz
	FIahi+Bb0AgJE290te8cbpIFkg2gsOx1RPRngozrudZs3E36CHJXhGumk1yZA/+uq91IPMYRy9m
	Mg3VYZsdl7FPlDAMQag6xYwQRy5O//lQV+p/37ODQJi5qxkByyU+R/arjSW7hL4/LDYVcBT5X5f
	Y/FkGhJDqm7SLRFi4Op0R6FovTcXF0g41vQ4Li1DPRiNWC3+1cGbbLfRYg89g/FLvkd7wfoflII
	3AEs2Bfqfp+sE54DjupHRg+xgdj9pJeB+0Fse7m0gbkrueGww=
X-Received: by 2002:a17:902:e74f:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2beb07da2dcmr133587145ad.36.1779692032381;
        Sun, 24 May 2026 23:53:52 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([157.50.165.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b51aesm108167535ad.19.2026.05.24.23.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:53:51 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	tgamblin@baylibre.com,
	joaomarcos.costa@bootlin.com,
	richard.purdie@linuxfoundation.org,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH] python3: Fix ThreadingMock call_count race condition
Date: Mon, 25 May 2026 12:23:41 +0530
Message-Id: <20260525065341.1301832-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 06:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237568

ThreadingMock._increment_mock_call() was not thread-safe causing
intermittent ptest failures on qemuarm64:

  FAIL: test_call_count_thread_safe
  AssertionError: 983 != 1000

Each time a mock is called, Python reads the call_count, adds 1,
and writes it back. When multiple threads do this simultaneously,
some increments get lost because two threads can read the same
value before either writes back.

The fix adds a lock around this operation in ThreadingMock so
only one thread can update call_count at a time.

Reproduction and testing:
- x86 stress test (50 threads x 10000 calls x 30 runs):
    Before fix: 23/30 failures, missing up to 42095 calls
    After fix:  0/30 failures
- qemuarm64 (10 threads x 100 calls x 20 runs):
    Before fix: 3/20 failures, missing up to 49 calls
    After fix:  0/20 failures
- All 19 existing ThreadingMock tests pass

Upstream fix merged into CPython main:
https://github.com/python/cpython/pull/150176

Fixes [YOCTO #16213]

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 ...eadingMock-call-count-race-condition.patch | 37 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.4.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
new file mode 100644
index 0000000000..aba3188a59
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
@@ -0,0 +1,37 @@
+From 388e023fe1197c1ffed374520ed45df4ac72b8f5 Mon Sep 17 00:00:00 2001
+From: Sai Sneha <saisneha196@gmail.com>
+Date: Thu, 21 May 2026 13:08:07 +0530
+Subject: [PATCH] Fix ThreadingMock call_count race condition
+
+ThreadingMock._increment_mock_call() was not thread-safe.
+Multiple threads calling the mock simultaneously could lose
+increments due to race conditions on call_count and other
+attributes.
+
+Fix by overriding _increment_mock_call in ThreadingMixin
+and wrapping it with the existing _mock_calls_events_lock.
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/150176]
+
+Signed-off-by: Sai Sneha <saisneha196@gmail.com>
+---
+ Lib/unittest/mock.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Lib/unittest/mock.py b/Lib/unittest/mock.py
+index 16f3699e89..56cdc37942 100644
+--- a/Lib/unittest/mock.py
++++ b/Lib/unittest/mock.py
+@@ -3113,6 +3113,10 @@ def _mock_call(self, *args, **kwargs):
+ 
+         return ret_value
+ 
++    def _increment_mock_call(self, /, *args, **kwargs):
++        with self._mock_calls_events_lock:
++            super()._increment_mock_call(*args, **kwargs)
++
+     def wait_until_called(self, *, timeout=_timeout_unset):
+         """Wait until the mock object is called.
+ 
+-- 
+2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-devtools/python/python3_3.14.4.bb
index 71f590f630..f46fe86d44 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
+           file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.34.1


