Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4392.1794732582541667277
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PK2Yige1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-497614c95f0so1030116f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732581; x=1795337381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+ds/RwkFf771kp7kv26RHNc3l0PJgggB/S5yCP9tDs=;
        b=PK2Yige1R0K5f7bVxmkg2rVoI+L95Yyo278J36AHy/se40Qo3AnMRR69TE3VTfN9nz
         nKY962Q9AJGwEyIqgpgNoFqzmXvbt1cGfmDLDCasj6c4ncnMMIl+wSn0tZX1SEaRhI5I
         JMq3n5XsiqFvRVZsHZ44yOiTt3B+cLkuvrB+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732581; x=1795337381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+ds/RwkFf771kp7kv26RHNc3l0PJgggB/S5yCP9tDs=;
        b=Qv4bLcZqgFea7jTbdOYC/sf2SlQbtKV7bGoUo87M669Z3AqTjq62/8EGnJz14FGf/R
         m5N/irxabguEu75rUWy3cGw6H0j2V1djPyt4URhWoKRxAGuK9S+QpBlcmsTpAqDX7mxA
         sEpm7YePC1RfNJznPavZ9EDNoyILiUakBiVEfh2gQkqwySwggdsNDmY4WDpwM+NyNEdL
         3v0HP11C7p2SDuLChQjqFtxpHF6rC9KqJBLd8hy27YvcgF4ONgI6qg7NuqbW/TI3WCcA
         2rwp4IQSJkBkYoKGNQyiW+K3bC7U7kz8u1Y1lymeSokroDp0oHX8HbmcIz5ADLHl+J08
         bG7A==
X-Gm-Message-State: APuU4Z8hge34CugjS4jVwuu8HUt41VRnHluiEy/Uplfd7ulBdGFFvHLP
	Fc9ypItOSbemj07P++UTiNLj3PSEADphHN3ERzTWU60/b6FxSxZXs9eqicZL9PwflpztDS1rPEy
	SBEM5S2w=
X-Gm-Gg: AYBFou0ZM3asDWF7fI3JRvXhw3M5KmSS8TIfzoIEChit1h2QQg9lGe9R7Tp5RRm8DFd
	K5f4cy8t8rCZaWwfweZmNsx9aUOuC9fPiSz/4Vod5vtXVpo8nJ3c0EWgt7yaDoWmsOC98amjKTD
	ihOfAUnfKawc2xoNy6l82NWvuAUv+DVnQrtGHfD61MCdlBTY17wyqe/rI18YlpogN5q17/B7r0d
	+xp0bH1aIjURJMPHKiet4cClviCnWsuLrs6aWvKzXUGuuG5LWSfzEMijNBQtD37hS7PnPsfeIbn
	o9wEDbnfMK40tobeCxgzZH+UMo+Co+FPGVetFjuR68eyc9rcwHmEbyt04CLgRWgo1Hc2DJZZNhM
	lSLNKv3ERSrjnHhTAnngSYiVNfbenzGQDmuBZ8pVmfaqquvRkmlHWoirKzrRVxOo6mwZUgNL4VU
	wgfJJmYsAmvCiRwRKRgK7nZxsg4YO4UtRsNQ/D1x2k/UH59COoWVMQBlHjw6UxoNVODAwDhZzB5
	waxk6ByTkHtl1St3S7i0bu0WtHWbD6xT8m0/HkI0RgWNRNuSr4DtVM6Uq9wGWHz38BBM5jghDb4
	hAOz78OU6yNAjNFLz88hMpUGK+dN/9D0J1TbNTvlhT5o2UMdFKzNReOTkxbqwadKVDb9LbGg8Zd
	OSpY=
X-Received: by 2002:a05:6000:161d:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-49c74d2daa2mr11192729f8f.55.1794732580733;
        Sun, 15 Nov 2026 00:49:40 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/41] oeqa/core/tests: Add tests for the reported test result status
Date: Sun, 15 Nov 2026 08:48:35 +0000
Message-ID: <20261115084845.701136-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250263
Content-Type: text/plain; charset="utf-8"

Check the status OETestResult reports for each kind of test outcome,
including setUpClass and setUpModule errors and skips, ahead of
reworking how results are tracked.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/cases/results.py     | 49 +++++++++++++++++++
 .../oeqa/core/tests/cases/resultsmodule.py    | 15 ++++++
 meta/lib/oeqa/core/tests/test_runner.py       | 13 +++++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/lib/oeqa/core/tests/cases/results.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/resultsmodule.py

diff --git a/meta/lib/oeqa/core/tests/cases/results.py b/meta/lib/oeqa/core/tests/cases/results.py
new file mode 100644
index 00000000000..363f3cd85fb
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/results.py
@@ -0,0 +1,49 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import unittest
+
+from oeqa.core.case import OETestCase
+
+class ResultsTest(OETestCase):
+
+    def testPass(self):
+        pass
+
+    def testFail(self):
+        self.fail("Failed on purpose")
+
+    def testError(self):
+        raise Exception("Error on purpose")
+
+    def testSkip(self):
+        self.skipTest("Skipped on purpose")
+
+    @unittest.expectedFailure
+    def testExpectedFailure(self):
+        self.fail("Failed on purpose")
+
+    @unittest.expectedFailure
+    def testUnexpectedSuccess(self):
+        pass
+
+class ResultsClassErrorTest(OETestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        raise Exception("Error on purpose")
+
+    def testClassError(self):
+        pass
+
+class ResultsClassSkipTest(OETestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        raise unittest.SkipTest("Skipped on purpose")
+
+    def testClassSkip(self):
+        pass
diff --git a/meta/lib/oeqa/core/tests/cases/resultsmodule.py b/meta/lib/oeqa/core/tests/cases/resultsmodule.py
new file mode 100644
index 00000000000..7579e86b934
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/resultsmodule.py
@@ -0,0 +1,15 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+
+def setUpModule():
+    raise Exception("Error on purpose")
+
+class ResultsModuleTest(OETestCase):
+
+    def testModuleError(self):
+        pass
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
index ce7be7b14e3..a9aac5ddf66 100755
--- a/meta/lib/oeqa/core/tests/test_runner.py
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -43,6 +43,19 @@ class TestResultStatus(TestBase):
         return {case_id: result._getTestResultDetails(case)[0]
                 for case_id, case in tc._registry['cases'].items()}
 
+    def test_result_status(self):
+        self.assertEqual(self._statuses(['results', 'resultsmodule']), {
+            'results.ResultsTest.testPass': 'PASSED',
+            'results.ResultsTest.testFail': 'FAILED',
+            'results.ResultsTest.testError': 'ERROR',
+            'results.ResultsTest.testSkip': 'SKIPPED',
+            'results.ResultsTest.testExpectedFailure': 'EXPECTEDFAIL',
+            'results.ResultsTest.testUnexpectedSuccess': 'PASSED',
+            'results.ResultsClassErrorTest.testClassError': 'ERROR',
+            'results.ResultsClassSkipTest.testClassSkip': 'SKIPPED',
+            'resultsmodule.ResultsModuleTest.testModuleError': 'ERROR',
+        })
+
     def test_subtest_status(self):
         self.assertEqual(self._statuses(['subtest']), {
             'subtest.SubTestTest.testSubTestFail': 'FAILED',
