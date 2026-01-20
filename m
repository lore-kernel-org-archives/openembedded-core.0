Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58C6D2ECF9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:25:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1632.1768893934088430651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H7k2bDEW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1FA0C4E421A5
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:25:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA0F1606AB
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:25:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BADA910B6B2B8;
	Tue, 20 Jan 2026 08:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768893931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7/FV+1GsfHuyShx2xNEjA3qKi4LoQm9ashS62dT1Wg8=;
	b=H7k2bDEWRvhecb14o13l1HhvMy+LPRIP9EFZwEHguoDwK1DEj2dJCCWZBAFVRKVcfvE68K
	xVWUib4afxA9xWUxZxMrMeH6QT8IiLQFD/2Yl4oXbn7s40PQEykHPwCE5oFVdJdaV8koP9
	KV+b31Qt1PuFxX/17N0heixzVDwfJJILFdW+rB+0uUdVoedo75YbN7Js5i91Z31LWQ8nPj
	PB835p9SS0pHayS9SZhHJn8HJxcqio9UFnzVz4zUTt0nDCOncFTCFl+3Cy7n6i3E1sE8St
	F1DcxJzSb6JDtNqZ1b1E6uuULNbWBkMW67ygy+JItTBCE3WdxqBPdaJSHn/vXQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 08:25:25 +0100
Subject: [PATCH v2] python3: skip flaky test_default_timeout test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-skip-python3-test-default-timeout-v2-1-b8cdd417fcb6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOQtb2kC/5WOQQ6CMBBFr0K6dgwFKdWV9zAsaBlkFChpByIh3
 F3AE7h8yct/fxEBPWEQt2gRHicK5PoNklMkbFP2TwSqNhZJnKhYyiuENw0wzNy4PgXGwFBhXY4
 tA1OHbmTQqc51kikjrRLbzuCxps/ReBQ/DqN5oeV9eDcaCuz8fJyY5O7905skSECZ1RYv1miV3
 41z3FJ/tq4TxbquXzSZBD/mAAAA
X-Change-ID: 20260119-skip-python3-test-default-timeout-83878256b1c6
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4418;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4uOLqk93MP0f7cEVQ4uPQgNA8qposAGr3EceNXfG+Sc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpby3q5R7m+JiZRw/6L2W4Q0p0pBsbc5sM8mVc2
 8ZCI8y9kfCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW8t6gAKCRDRgEFAKaOo
 NpMwD/wI7ZXxC0OAtnH/smKNtGz+Bfl6bNX9uBseD2/BlvLo17xT8vFbzRC0jQZ80GRkQADJBr+
 hmyKCJ0++Q+wguKQxoByVZXafQfN/+xT1P0UibM+1YjLDxLUyuuWCoJsYApM68y9kCFPvw4mHtI
 FKlYacDeP4Tkvda4mInHT+ETJ0EYnY91ALu/fad64I7jTd97TJcJeeEqrGLb8PmnfjPEzrYBP/C
 kMOlzC4oFppgsTCjuB2CyETvBMawLQVI2B97aEUCSR54MhA1O+Z89AZbhRMmmTmB3X1SDvynOFY
 z2C26tFeeTAEpG94a2lmZwJGGe0uae8m4eYMMjtHFLi5TH0412VK5rYjNu4LaT3DfN5/AhrYJg/
 ikPpm25ouWIhRm98eHJm7Cmw92f42uXOCjTAars983YJn0MVEbJTXWiKQ6OvktAJaiBFIJXuduJ
 fneE+uLBM7PRlmnmQ4uVl1hHgOp75RcgMYy/eAvzJ37UBHvTQqnH6L5396o1SgxzL7R8hjA92Hb
 umoNGdhZRqJfWliy6QqtZgSQPECpjCBrTjwvDE5ImC+rq8MHSge1x3QZG8f0GsoVAlORilnXtM4
 9Pxla1th3cGzdcjORp0OpwERhSAF54uZ+MJmCvkWPNwoPAyVu30TwCBMIM6YLW3wgF9wJR2yV8U
 xx4jF3Ett+cVveA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229644

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
Changes in v2:
- Rebased on master-next, applies to Python 3.14.
- Link to v1: https://patch.msgid.link/20260119-skip-python3-test-default-timeout-v1-1-e15fce4cb867@bootlin.com
---
 ...001-Skip-flaky-test_default_timeout-tests.patch | 49 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.14.2.bb     |  1 +
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
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 61ab10a710..7481e70e13 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_cmd-skip-bang-completion-test.patch \
 	   file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
 	   file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
+           file://0001-Skip-flaky-test_default_timeout-tests.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

---
base-commit: 77a73237876b0c8e1fe349f5b03e04b4c237269e
change-id: 20260119-skip-python3-test-default-timeout-83878256b1c6


