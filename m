Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4370.1794732539412952440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DN3n3sIu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2732462f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732538; x=1795337338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gwd1OUgyMi0hEupha6o7tQatB0OzSUbwfZIqDMfM9zk=;
        b=DN3n3sIuZiCtu14lQBPEXhGRxOZY5gSmq3Ywk3zZvoOixAqx92/rhVQaxUkXjlkmcJ
         qjlju0fYnS2c2TZa1KhLKzRIAACzbC3GRL2HIbtaFHhm/1MOEwgEEHsAMgKekUaFdDQA
         2YpCm1OdMVT3Q1BfXCy3Rs3LMX3SGStdjIasA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732538; x=1795337338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gwd1OUgyMi0hEupha6o7tQatB0OzSUbwfZIqDMfM9zk=;
        b=qZJKguz/DhEju8UTBeJhP9pYQDzAUdrjdoXI0jlyTOvHJI2jsJk+j+RK0kx2xoUfMH
         CvS6ek9TgKBW/NyabQ8oc+UyGhd3z+IlF85B8aX3xMAmVlhGs2XAlcYfy501JR9Jn8mO
         ItINHQ6oCR6J4yatcYXdhtJMml9TNOsu7vMJRIlwTJP/x3kh3dQFn+tZNd0MJnPt3B+p
         9ZzwpjeaYf2aP3YOpfbO/umz2HEjIUf4Xt6HWpl8Nwgf7mJJTuDp6TNLip5OwX8d7BM9
         MyvnFdLyRxSR5bd6QvuiO9gpkK5aBxjqBoA8o9d8Q++eDumt+i8VL5BZJlTBfuS0bZW/
         Q8Qw==
X-Gm-Message-State: APuU4Z92AsWU3Ie74WsJ62PXMw8Q/lRNzVCwRPYzakSBWKmcN9eXe+E4
	qJ5tAYPRhn1wIvOK8LG4aS96PD87ZaiEXHv/b0pGirtdtKRT7bockYa6ltJFNVtgt2i8MwslPzo
	iBWyBmUk=
X-Gm-Gg: AYBFou0iCVOnbr9vQMR7jVjEx6BvqAOJez7FAis3axOtgdXucRDBMFPBIBppaaSi59L
	iYyvuOBUoAYnqo5UWxux9LdsJozL6HNAhJopN8lfsQtuuKR5vxHzkCvZeXngzNR5M14Y4fbr+Du
	hZy+baiYYmsKFuWqRpofpAqeBOVvfNJ8nh1oXTmgAm90D6RdixGSf7otruV2Te9FY6Mwy5AMMg7
	o/MaqXBl8PSkoaYhmDS0xUAyyEzGJtmhXEzyB2Dt2J0s6zzkZ3ZnFilfa1bM9Ds3R39NMYsyhkV
	nLyOkvj07llaU5sIh6b0dpWU+j3rBR3qg7a8EfEnVsivMPhuFRX0r4lOs3haaCVKNTZ0XtMcY5F
	vB/yp6zxGUkaFWcdeZ4J1f5MSWl8+xOAbI5yLJjwFhxVfDCqtdEHJui9uOcfF9jOCC7mQXKehn+
	FAacn47WhfDHd67YVkCe2zGJwfzLJ7txuAWqujfuc0/QHvgDkYIGX9n0hyhn2JQWoX2UtL5BO4u
	6frDnGziDkjAgzpZ4MmY6KTYD3D9/1VQv/5zHqM+w0pksB2azrmah0kWFyqcu4QaTeKNPnJ1ecI
	mOyg9sa9Zo5x7eXRu9B3/80ZM0+2LiSmBm0zUgArs29DWW6Z4eemhTziiQ==
X-Received: by 2002:a05:6000:22c6:b0:492:3982:a80c with SMTP id ffacd0b85a97d-49c712ac755mr16316462f8f.29.1794732537591;
        Sun, 15 Nov 2026 00:48:57 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/41] oeqa/core/utils/concurrencytest: Only show each test's own output
Date: Sun, 15 Nov 2026 08:48:08 +0000
Message-ID: <20261115084845.701136-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250236
Content-Type: text/plain; charset="utf-8"

When tests run in separate processes, each process' output is collected
in a buffer as it arrives. Each result was given the whole buffer as
its output, so a failing test showed the output of every earlier test
run by the same process, as did the stdout/stderr saved in the results.

Each process runs its tests one at a time, so only give a result the
output received since the previous one, and add a test. stdout and
stderr still share a pipe and are reported together as stderr.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/cases/streams.py    | 24 ++++++++++++++++++++
 meta/lib/oeqa/core/tests/test_concurrency.py | 17 +++++++++++++-
 meta/lib/oeqa/core/utils/concurrencytest.py  | 10 +++++++-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/streams.py

diff --git a/meta/lib/oeqa/core/tests/cases/streams.py b/meta/lib/oeqa/core/tests/cases/streams.py
new file mode 100644
index 00000000000..f165e7124a1
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/streams.py
@@ -0,0 +1,24 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import sys
+
+from oeqa.core.case import OETestCase
+
+class StreamsTest(OETestCase):
+
+    def testStreams1(self):
+        print("Output from testStreams1")
+        sys.stderr.write("Error output from testStreams1\n")
+
+    def testStreams2(self):
+        print("Output from testStreams2")
+        sys.stderr.write("Error output from testStreams2\n")
+        self.fail("Failed on purpose")
+
+    def testStreams3(self):
+        print("Output from testStreams3")
+        self.fail("Failed on purpose")
diff --git a/meta/lib/oeqa/core/tests/test_concurrency.py b/meta/lib/oeqa/core/tests/test_concurrency.py
index 16e6619ad7f..b44c006d532 100644
--- a/meta/lib/oeqa/core/tests/test_concurrency.py
+++ b/meta/lib/oeqa/core/tests/test_concurrency.py
@@ -19,7 +19,7 @@ except ImportError:
 
 @unittest.skipIf(ConcurrentTestSuite is None, "concurrencytest needs testtools, subunit and bitbake")
 class TestConcurrency(TestBase):
-    def _statuses(self, modules, processes=None):
+    def _run(self, modules, processes=None):
         tc = self._testLoader(modules=modules)
         if processes:
             setup = lambda suffix, selftestdir, suite: (None, None)
@@ -27,6 +27,10 @@ class TestConcurrency(TestBase):
         # fork_for_tests() only looks up the selftest layer with BUILDDIR set
         with mock.patch.dict(os.environ, {'BUILDDIR': '/nonexistent'}):
             result = tc.runTests(processes=processes)
+        return tc, result
+
+    def _statuses(self, modules, processes=None):
+        tc, result = self._run(modules, processes)
         return {case_id: result._getTestResultDetails(case)[0]
                 for case_id, case in tc._registry['cases'].items()}
 
@@ -38,5 +42,16 @@ class TestConcurrency(TestBase):
         self.assertNotIn('UNKNOWN', sequential.values())
         self.assertEqual(self._statuses(modules, processes=1), sequential)
 
+    def test_concurrent_output(self):
+        # Each test's results must only have the output from that test, not
+        # everything its process has output so far
+        tc, result = self._run(['streams'], processes=1)
+        for n in (1, 2, 3):
+            stdout, stderr = result.logged_output['streams.StreamsTest.testStreams%d' % n]
+            output = stdout + stderr
+            self.assertIn("Output from testStreams%d" % n, output)
+            for other in {1, 2, 3} - {n}:
+                self.assertNotIn("testStreams%d" % other, output)
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 09d621446ee..455b70faff2 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -57,6 +57,9 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.totaltests = totaltests
         self.buffer = True
         self.outputbuf = output
+        # The process' output accumulates in outputbuf; this is how much of
+        # it was given to earlier results
+        self.outputoffset = 0
         self.finalresult = finalresult
         self.finalresult.buffer = True
         self.target = target
@@ -79,8 +82,13 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                     test.id())
         finally:
             self.semaphore.release()
-        self.finalresult._stderr_buffer = io.StringIO(initial_value=self.outputbuf.getvalue().decode("utf-8"))
+        # The process runs its tests one at a time, so the output since the
+        # previous result is this test's. stdout and stderr share one pipe so
+        # it is all given as stderr.
+        output = self.outputbuf.getvalue()
+        self.finalresult._stderr_buffer = io.StringIO(initial_value=output[self.outputoffset:].decode("utf-8"))
         self.finalresult._stdout_buffer = io.StringIO()
+        self.outputoffset = len(output)
         super()._add_result_with_semaphore(method, test, *args, **kwargs)
 
 class ProxyTestResult:
