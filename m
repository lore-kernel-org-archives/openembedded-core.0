Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4317.1794732542599677645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D9oaigPX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4919a880834so1131241f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732541; x=1795337341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F1Snosp2f5pkLWMwju8gqBtnrHiAsADjotrnsEEm4+M=;
        b=D9oaigPX1qzVhPaMbBnwK+GV2g/3OjhE++z3PXCvvuNbtpPR66lN4GjfNEgaBQuMRV
         fOwTnJT7w/ldpyUka6hMfiRKhB4Z1Iao0FwEJClO6r3pCQlPItOI/J2vocp0ONaF86x/
         rymrSdKNoPM+S7cQo7hpjB+EiaCt1/e5Fsi1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732541; x=1795337341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F1Snosp2f5pkLWMwju8gqBtnrHiAsADjotrnsEEm4+M=;
        b=yh4FJMzzHETcWNu8VPFHNyTe34kZKewCv44rcU2qkSQ36peUuAk5tHhAVDddylvswO
         e5QYSS22V5dLG8bGVXiSlqwFRQaT6nmIwgwVr4NE+7OwKyhYQsrhHHpkvMcfffKapgq+
         SI/tw8D5N3rFtTDxQEMRvT5K4xI6NXrKxBfJwmCVkpeosgwoTKcOtbwyuX8ebxQC0Ynj
         cLmtDRMHhLG5BunbNJZgSy+cBt4ReOhb+7gqeNzrDvq0PkyTNuI+VfTWiKDA8p8UB1M6
         Yz6xRgHeefFeYptHJ4jwCz23TD4EhSUtYTseJbOEGIUTgihcnRoFtYnD/ecjRwsaPXA2
         UdiQ==
X-Gm-Message-State: APuU4Z+gBxEZ0yEQKi0sDAw4tureyGlFSCZNztk77WZjAcgVTABr24in
	A+JBEToNCIuaMlnDr7aXwD5mVYTAOup/lsv6UWckX3WkJY0N7bj7kHX2ixcoMUJXGuSyFKGSTU1
	d/DeOV0o=
X-Gm-Gg: AYBFou0nwcWjPKZYWT6PfXK6xgmT+2nq9JAHnQguX44FgpT6r3hYvwjKgzd5IFdK6vZ
	+h7JW/SzggcV+L4w9pLpGSQUaSeDIFN0AAlk1TwgVl9bsudDkrmLj6ArmTTXAfYF3rJOdvSP2JJ
	/rWBVSGqvsuphTS0HYZopKJA/jZ0FYQPeTXIQo/rXK95jR8ySmnM9+DQ5wQ1jJnZ8+Gq41hljnT
	mtVDxzO06QLY7Khd1gOJKY/AJt2pRz5eAw5P9/1ZoZoWyuk4iYnos9dq/dGph95KSeX6EvuPt8Y
	S6EvhSc4uPzPNgDi3yObYGV/A6+0z6c+M0LOn8XyGyFORGM5+Z/umDk7NnQ0vTaYZF3oSgrcm+O
	lO3W6uAoVKyB1OJqqM0O/MueLPXxpItcw+c4t02LjAvJOMtcc67/IZGOh9CPotGMxg60nxt9RE5
	Dg81vTLgIOVTdDm0nYkUq8Ica+dNuEkxNYdiCan+quCZRZpj+hHX/YXheC7gWkBmzPNRXfY5noz
	JdPi7yytESTe07jkWZ6lIpn6/jNp02r6K1WsF6c/f/XTNu1zcJwp4hYa6WX+NTGcNxnGFZCknoA
	7GtWP+g6lUoRQpMGVGMjrBdq5/lu5oy8jhtVRjrQpsCVDNt6SNZPvolTmVq1cdoXv3oEqm9em/C
	OtQY=
X-Received: by 2002:a05:6000:26ce:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-49c71b5bfbemr14575708f8f.30.1794732540734;
        Sun, 15 Nov 2026 00:49:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/41] oeqa/core/utils/concurrencytest: Fix the failed count in the test progress
Date: Sun, 15 Nov 2026 08:48:10 +0000
Message-ID: <20261115084845.701136-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250238
Content-Type: text/plain; charset="utf-8"

The "(N failed)" count shown in the progress line for each test when
running tests concurrently came from the result proxy for the process
which ran the test. It was only that process' count, was read before the
current test's result was counted, and counted each failure twice since
testtools first passes a failure with details, which OETestResult
rejects, and then retries without.

Count the failing tests across all processes on the final result in
_add_result_with_semaphore(), which is called once per result under the
semaphore shared by the reader threads, before the progress line is
formatted. Add a test which checks the count in each progress line.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/cases/failures.py   | 29 ++++++++++++++++++++
 meta/lib/oeqa/core/tests/test_concurrency.py | 16 +++++++++++
 meta/lib/oeqa/core/utils/concurrencytest.py  |  8 +++++-
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/failures.py

diff --git a/meta/lib/oeqa/core/tests/cases/failures.py b/meta/lib/oeqa/core/tests/cases/failures.py
new file mode 100644
index 00000000000..371a277537a
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/failures.py
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+
+class FailuresATest(OETestCase):
+
+    def testFailuresA1(self):
+        self.fail("Failed on purpose")
+
+    def testFailuresA2(self):
+        pass
+
+    def testFailuresA3(self):
+        raise Exception("Error on purpose")
+
+class FailuresBTest(OETestCase):
+
+    def testFailuresB1(self):
+        pass
+
+    def testFailuresB2(self):
+        self.fail("Failed on purpose")
+
+    def testFailuresB3(self):
+        self.fail("Failed on purpose")
diff --git a/meta/lib/oeqa/core/tests/test_concurrency.py b/meta/lib/oeqa/core/tests/test_concurrency.py
index f7b1f554c96..0f382308b2f 100644
--- a/meta/lib/oeqa/core/tests/test_concurrency.py
+++ b/meta/lib/oeqa/core/tests/test_concurrency.py
@@ -6,6 +6,7 @@
 #
 
 import os
+import re
 import sys
 import unittest
 from unittest import mock
@@ -64,5 +65,20 @@ class TestConcurrency(TestBase):
             self.assertIs(sys.stdout, stdout)
             self.assertIs(sys.stderr, stderr)
 
+    def test_concurrent_failed_count(self):
+        # The failed count in the progress shown for each test must be the
+        # number of tests which failed so far in all processes
+        tc, result = self._run(['failures'], processes=2)
+        failed = {test.id() for test, _ in result.failures + result.errors}
+        self.assertEqual(len(failed), 4)
+        # progressinfo is in the order the results were received
+        seen = set()
+        for test_id, progress in result.progressinfo.items():
+            if test_id in failed:
+                seen.add(test_id)
+            count = int(re.search(r"\((\d+) failed\)", progress).group(1))
+            self.assertEqual(count, len(seen), msg=progress)
+        self.assertEqual(seen, failed)
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 24b391cdb96..9da0c5e661e 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -70,6 +70,11 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.semaphore.acquire()
         try:
             if self._test_start:
+                # Count failing tests across all the processes. This is called
+                # once per result, unlike the add* methods of the target which
+                # testtools may call twice.
+                if method.__name__ in ('addError', 'addFailure'):
+                    self.finalresult.failedtests.add(test.id())
                 self.result.starttime[test.id()] = self._test_start.timestamp()
                 self.result.threadprogress[self.threadnum].append(test.id())
                 totalprogress = sum(len(x) for x in self.result.threadprogress.values())
@@ -80,7 +85,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                     totalprogress,
                     self.totaltests,
                     "{0:.2f}".format(time.time()-self._test_start.timestamp()),
-                    self.target.failed_tests,
+                    len(self.finalresult.failedtests),
                     test.id())
         finally:
             self.semaphore.release()
@@ -223,6 +228,7 @@ class ConcurrentTestSuite(unittest.TestSuite):
             queue = Queue()
             semaphore = threading.Semaphore(1)
             result.threadprogress = {}
+            result.failedtests = set()
             for i, (testserver, testnum, output) in enumerate(testservers):
                 result.threadprogress[i] = []
                 process_result = BBThreadsafeForwardingResult(
