Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4369.1794732537003152915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A50gPLo+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso2510712f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732535; x=1795337335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fDafWhfS57IN6BUVA9DgO9lUiAM9f0P3+K7c+7r6TW0=;
        b=A50gPLo+iEH+KdlJvQFDbR/djtYFVjgFkCYGr+Zr8fI7bkL/ddzTWNS4P1x+DrWkT8
         UcbGGynt4Qm1MtYTvRfhcPxHUGjVywFtKcBK1UtulzhWzPEB52Ce60EyqgaWPkU69h9G
         K6Zrfux8URcm9eoslqXkYLeIqUf5lumJfqZgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732535; x=1795337335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fDafWhfS57IN6BUVA9DgO9lUiAM9f0P3+K7c+7r6TW0=;
        b=Jt4er9A9MX5fbzPyeDLn91O/wpdhvCFD3CVaWRdLyCFtK0oRI+HRhMdJ1hJ7rdZtN/
         wd/9lqkM3M4LlwS3xhre2q9dCxReFLIME0sRCz5zegERM3rdtDAldzD9j7uVDfnY+gb8
         RQ3oNbeEgwHQuYoR7pRLNNn7lP+epBJU6yTyORNIhA7lZZtuqKuE5PnCobogjMCSOvqP
         0zyjMk27Ve4DPMVZnrSn953twJ9GBsAcNVLWRt/CQDDLATrSBNp8nmoZIWNkBeP+PfF8
         0lD5bV2VYtfSaoKslUq+UT4WfDG1Oo9nyAHsihQZgBjWGqjeUEdBepG/2TpbHhXLGlP9
         SLhg==
X-Gm-Message-State: APuU4Z/vCFtv0RWIEIxEQ6zbb/RR2brESJMGina3uVv7yRQMCAQTULI8
	n9ewyhWsGQXgVYJmPWcOb2xwpPYRMz7FifCI3ULBkylsvn6CdvZWhzrYfAaigZOoLWfYvK3ouAg
	k9uESHWY=
X-Gm-Gg: AYBFou2JFmlcwqBHaJPVkOTWgCJfblB+/8s40TYfrW49AVZONYxLy/x08Si+pvnXrgW
	Gc5AnQcatidF0M4CQnGm/SggAoDfBzyu75Ax05RZ4eFxkn5ONskra4OrzvvS3GU1Il0MhpdPqWj
	pCT6KgNOqu5vo+i4NeLwdR3GjPQ3kTN+LaV6yfogTvkhGmXNPeohKOaQkPSjPPx37QztHJzRJG2
	4TbtKOQcwMf6E1wpik7AT4ze8Tli11j3iQqcPAXeyugwdaEwwcnf/5t6fH3OVygl+pTBmvm0HB3
	6LgqpzitmRaPIoW/0/pyOHacL/A4yOHUEsF9dWErn92Dy59gBYaOhi3Fm4lfvJ7QAJoF67+DlHq
	Tu9QIsViuVEEl8NWzjYZeBKAfHFN5KpbzhBuIDYhrEMebzoxg47jXF+JvUrFu0afv54naAIkurC
	dwFifSoAyAyVKdkIl1bFOVqHgeUySgCN9BMRdDyiUcIwLdE/9OBGv1uywkRgLN4FaZq7BAaTmoB
	LXTUnNL5aTWOg+zJBwleNfVNZpsbTdH3Wvnjy/onKbIwP4yEd5XGYPjn1bZBk7QvLTVjhvlhgr0
	6mA5LFSL8fWdhl4hzTdpNcz26qDQ0n0AlafNcrSlkDtsI3TXLAlHYbnoIA==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15967021f8f.29.1794732535196;
        Sun, 15 Nov 2026 00:48:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/41] oeqa/core/utils/concurrencytest: Fix losing results after class setup failures
Date: Sun, 15 Nov 2026 08:48:07 +0000
Message-ID: <20261115084845.701136-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250235
Content-Type: text/plain; charset="utf-8"

When setUpClass() or setUpModule() fails or skips in a test process,
the result is reported outside of any test. The subunit parser patches
which handle this reported the outcome and the stopTest() which follows
it without a startTest(). testtools tracks per test state between those
calls, so this broke its forwarding result and the thread reading that
process' results crashed on the next test, losing the results of all the
remaining tests in the process. These were then reported as UNKNOWN.

Start the placeholder test before reporting its outcome, as the parser
does for normal tests, and add a test comparing results from a
concurrent run with a normal run. The test is skipped if testtools,
subunit or bitbake aren't available.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/test_concurrency.py | 42 ++++++++++++++++++++
 meta/lib/oeqa/core/utils/concurrencytest.py  |  6 +++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/lib/oeqa/core/tests/test_concurrency.py

diff --git a/meta/lib/oeqa/core/tests/test_concurrency.py b/meta/lib/oeqa/core/tests/test_concurrency.py
new file mode 100644
index 00000000000..16e6619ad7f
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/test_concurrency.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import unittest
+from unittest import mock
+
+from common import setup_sys_path, TestBase
+setup_sys_path()
+
+try:
+    from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
+except ImportError:
+    ConcurrentTestSuite = None
+
+@unittest.skipIf(ConcurrentTestSuite is None, "concurrencytest needs testtools, subunit and bitbake")
+class TestConcurrency(TestBase):
+    def _statuses(self, modules, processes=None):
+        tc = self._testLoader(modules=modules)
+        if processes:
+            setup = lambda suffix, selftestdir, suite: (None, None)
+            tc.prepareSuite = lambda suites, processes: ConcurrentTestSuite(suites, processes, setup, None, {'BBLAYERS': ''})
+        # fork_for_tests() only looks up the selftest layer with BUILDDIR set
+        with mock.patch.dict(os.environ, {'BUILDDIR': '/nonexistent'}):
+            result = tc.runTests(processes=processes)
+        return {case_id: result._getTestResultDetails(case)[0]
+                for case_id, case in tc._registry['cases'].items()}
+
+    def test_concurrent_status(self):
+        # Class and module setup failures must not stop the results of the
+        # other tests run by the same process being reported
+        modules = ['results', 'resultsmodule', 'subtest']
+        sequential = self._statuses(modules)
+        self.assertNotIn('UNKNOWN', sequential.values())
+        self.assertEqual(self._statuses(modules, processes=1), sequential)
+
+if __name__ == '__main__':
+    unittest.main()
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 5a760c620b2..09d621446ee 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -156,6 +156,9 @@ def outSideTestaddError(self, offset, line):
     test_name = line[offset:-1].decode('utf8')
     self.parser._current_test = subunit.RemotedTestCase(test_name)
     self.parser.current_test_description = test_name
+    # The outcome is followed by stopTest(), which testtools needs to match
+    # a startTest() or it loses track and breaks on the following tests
+    self.parser.client.startTest(self.parser._current_test)
     self.parser._state = self.parser._reading_error_details
     self.parser._reading_error_details.set_simple()
     self.parser.subunitLineReceived(line)
@@ -171,6 +174,9 @@ def outSideTestaddSkip(self, offset, line):
     test_name = line[offset:-1].decode('utf8')
     self.parser._current_test = subunit.RemotedTestCase(test_name)
     self.parser.current_test_description = test_name
+    # The outcome is followed by stopTest(), which testtools needs to match
+    # a startTest() or it loses track and breaks on the following tests
+    self.parser.client.startTest(self.parser._current_test)
     self.parser._state = self.parser._reading_skip_details
     self.parser._reading_skip_details.set_simple()
     self.parser.subunitLineReceived(line)
