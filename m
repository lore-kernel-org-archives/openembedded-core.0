Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C655D29C2E
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:22:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35611.1768832513928336088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 06:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C6JbdLDZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E18E81A2958
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:21:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B74C960731
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:21:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DC8610B6B06E;
	Mon, 19 Jan 2026 15:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768832511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yrWU+tSdQLnPaSdeIZE5s89BejqcT0GqXaNsxUtpmD8=;
	b=C6JbdLDZxD4gGtMIA3utAdN1yTKVqEZuWg+gZyDkkP3SuNvVYnaxzfPKuEU2WvbKT1dn4k
	lRq5CYsMlZ2F/VtsJo69tC6w42fYR2wa0jYPr6DQpa1dN9QVL3HDc3cMCAZiGoQ6O5Wh0w
	RSv1nDCaKGIPnN9ENlSrLUQ7IDtmpmiGU95S/xMew4RbXozifuaLomMSYdZPz9904CYAMH
	2+091zTlvaz1/TyQRCWc9LurHN0F9t2abfddLGCsyFxhqboo8CFJ7+Znr8QK53wnvmexxL
	C1GfZdPNXCNYtQnnM53dGpKg2xPnxgO32hZiuwfuRhlFgtpaQ+0PQkSc/Vvb1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 19 Jan 2026 15:21:43 +0100
Subject: [PATCH] python3: skip flaky test_default_timeout test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-skip-python3-test-default-timeout-v1-1-e15fce4cb867@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPY9bmkC/yXNTQ7CIBBA4as0s3aSQiOiVzFdtHRqxx8gMBhN0
 7uLuvw2762QKTFlODUrJHpy5uAr1K4Btwz+QshTNehWm1apI+YbR4xvWYLvUCgLTjQP5S4o/KB
 QBG1nD1bvzaicgdqJiWZ+/R7n/u9cxis5+YZh2z4imzxThQAAAA==
X-Change-ID: 20260119-skip-python3-test-default-timeout-83878256b1c6
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4246;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EmLFqfPsBSUb0nDD6+EFrKwmGT02X7kWt6sKkeYDjWw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpbj3+VXwOHWU+a462f9zav4O1lX08JuVDExWzk
 Y+gMPKC+XKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW49/gAKCRDRgEFAKaOo
 NjKbD/0f0ltN9oRdvc+p3OcndIgzhluHsTPYtMjlAnMYCGGsoDuukevgiG4e6UMJ4+F5wDSj4H0
 FFxfPSa4dHDw8bBRBtQdRYtYg2H8noMUA+oefNfbLnKLzlFAFXOHcl1C896iZvQedcggT6A9BFL
 dT+kLScih3i1c4Y0V9a6RKcZM5NWGXATzn7sHYbdNfRt+ntlL35agU3/rfCOY+FlYlK20fLKr1q
 Z0BHcYfUDvGvjfvAQ2mLwFMrc7R+llkfN6VlbrWcTuqAvl9XWq1HSrEwQ/yy19+9akatp2rxyGY
 PkXHo9WvW2raXfLJCRyse0eXRUDoGy8k1y/+4nMj33Znwi3A9rwnrxlTiflG1pseN4AqwZNep0H
 nZ13XMax4HrTleekKhCFeDUzUHB0yZprNKKG5ypyDBV2HFSwm80FRsI8XKvgzOeXWHZI2sgiW5E
 J4plTOnW1Gh2sSveVhELfM1/ibqmbXAwe0w+TkJJuP09SGYWPVe+bGeH0gLls8AZ2gXXGgHFK2X
 jhUns4dJW88yvDF9MSMYcbSv7vLzJdV/q9HB5HHg2bhYJy8X1G2E6XFg6JOuRV9zx6ZcUBVZq7Z
 hZf3ytZwzC4ukYX/lFCdCS5+JoiD35R3U+zpQOJhhhmNLEa2Blx3J6thVKkNTMS0OfhMKuWOlhL
 8zIf6MU6xJFs8dA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229621

We have been observing intermittent issues with this test on the Autobuilder:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15885

This is probably due to the Autobuilder being heavily loaded at the time
of the test.

The logs on the ticket above do not allow us to know which of the two
"test_default_timeout" tests is failing, so disable both with
self.skipTest().

Excerpt from `ptest-runner python3`:

  test_default_timeout (test.test_multiprocessing_fork.test_manager.WithManagerTestBarrier.test_default_timeout)
  SKIP: Test the barrier's default timeout 'skip flaky timeout test'

[YOCTO #15885]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 ...001-Skip-flaky-test_default_timeout-tests.patch | 49 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.13.11.bb    |  1 +
 2 files changed, 50 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
new file mode 100644
index 0000000000..4e1bd833b4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
@@ -0,0 +1,49 @@
+From baf2dda48e51fcb17a716e52cc5c4e162a6bb7d3 Mon Sep 17 00:00:00 2001
+From: Antonin Godard <antonin.godard@bootlin.com>
+Date: Mon, 19 Jan 2026 11:38:36 +0100
+Subject: [PATCH] Skip flaky test_default_timeout tests
+
+We have been observing issues with this test on the Autobuilder:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=15885
+
+The logs on the ticket above do not allow us to know which of the two
+"test_default_timeout" tests is failing, so disable both with
+self.skipTest().
+
+Excerpt from `ptest-runner python3`:
+
+  test_default_timeout (test.test_multiprocessing_fork.test_manager.WithManagerTestBarrier.test_default_timeout)
+  SKIP: Test the barrier's default timeout 'skip flaky timeout test'
+
+Upstream-Status: Inappropriate [OE specific, but might be related to https://github.com/python/cpython/issues/129266#issuecomment-2613058866]
+
+Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
+---
+ Lib/test/_test_multiprocessing.py | 1 +
+ Lib/test/lock_tests.py            | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
+index e8064e7..9ab1f9e 100644
+--- a/Lib/test/_test_multiprocessing.py
++++ b/Lib/test/_test_multiprocessing.py
+@@ -2259,6 +2259,7 @@ class _TestBarrier(BaseTestCase):
+         """
+         Test the barrier's default timeout
+         """
++        self.skipTest('skip flaky timeout test')
+         barrier = self.Barrier(self.N, timeout=0.5)
+         results = self.DummyList()
+         self.run_threads(self._test_default_timeout_f, (barrier, results))
+diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
+index 8c8f890..43e9b90 100644
+--- a/Lib/test/lock_tests.py
++++ b/Lib/test/lock_tests.py
+@@ -1165,6 +1165,7 @@ class BarrierTests(BaseTestCase):
+         """
+         Test the barrier's default timeout
+         """
++        self.skipTest('skip flaky timeout test')
+         timeout = 0.100
+         barrier = self.barriertype(2, timeout=timeout)
+         def f():
diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.11.bb
index 2fcfd4aba1..2bc2389b7e 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.11.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
+           file://0001-Skip-flaky-test_default_timeout-tests.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

---
base-commit: 5b2365406fa35f8be345cfb05768ccb41faf4882
change-id: 20260119-skip-python3-test-default-timeout-83878256b1c6


