Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4395.1794732590604514838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iEiNUP2P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so1131410f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732589; x=1795337389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wmLcBVUkMm6vSNtCN4x8U7mNWh31QOkztROT2aMVp/k=;
        b=iEiNUP2PHdwhqe9JqQFaBEg/GYaB8rIXZU1JArGJSNQyRLCOY1/xEWYbGlA27K+F1T
         vglUfNUca+kPXr5bcx7PWuGmTrbzCxtzFpHR/ayyUZ92Z5esluzqC7ezF+Q/uTqMeIhH
         KuRxNrSVXOATGZGMEZNIF3T4zA+1haTJuDUQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732589; x=1795337389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wmLcBVUkMm6vSNtCN4x8U7mNWh31QOkztROT2aMVp/k=;
        b=SzOADL7s1aBkg5KOeNLwmMKbJlWktJORd3qw9l90i4M8RlV2e7cCxOebRCjyaTz+Vx
         s75p/TIE8W4V/0dQ/It3JGKE7Of+vKqAMacQDxS0gJE+rsk1nryZSWfx++WD0549oyfR
         uP5/xI5SMebCa8a1nV2uTkXotpUbrBjirLHQVElhDC5tPWgC5tb4uOjP0VaR/EeLMXOl
         OMjvPDTIpE2fvdf+04uuA9IoWY/4BL73RELIwP3foGhwF7B7o6o/kZCG5EVgSzbd1Tw7
         AGp53+jiod9bK5Jfhkjkf32AUlqQ1DOXD660nAKB3Ihtloidg0b/aaIGV+Sh3ES7jvQZ
         hwsQ==
X-Gm-Message-State: APuU4Z9rnOHoFTwP0r089EETc5DkvdeEy4kkAeHNt73Uk3o9lcFgjbCs
	j11Z5eQMApbLUMfqnlysvovtsOFtUOrhEozTDDYP00VKJr//XaBXvr2wHBPnqoMeI+ciHUPOZUw
	uKgzZ1ok=
X-Gm-Gg: AYBFou3WLTmqdBDb0c0x1O+wwwS1PSKKEomzICmLjR1CbfEvWvf9q/DICstF37krF9i
	YFQYFaBh8zFRzpB5aDbo3V6VTE+R8UXBSUUSVKHUMPLHw+5ks/V9a0Ony499pMpH4Y82yj+57DE
	n4L64S0cwW4ccQt079d/Qp6rYYspymEkHncBN7A7xlyq5wr2BjkKAWul6iAPyUklR2WJOBB8CAQ
	4PXGEEAhFqPoXAsQWOcZwH3x69rZQWG6nJVBlBJbitjiy5Zht4wwiMnWCK7RDpRTNvM/e178PMJ
	AbSACHaz1wTaKTgc5UEoVCRHfxkNoHQ0OnkpkziDg9G1uFbW4l000zJnMXzWafYOxnaloZ3TJ3v
	RjM/UQ/idtRhYjgaaE1ARTh/Vntv4BN9R52vp+kt4QrdPFx3/iHiZamJFIgVJRDJOvUSMpIjLux
	0eQc8nd1AooKnYwvpzBZfi3EYUzEhM+TjISJhZkStp+jjPc5AM4NUcjcQV9zM2NQudJcXymbbcz
	ACsFKFI5mI0e+x2e11o4KSq72P+1FpQLpQnxoQVh6yh9lODLD0JSdjs5QXERixMs9RHTTCQCRAZ
	1OXXYDWOem8z3eQINjtbSzfX9D6LTbwSAyee9Y+kDV+sjJdrMqN+1ZEcew==
X-Received: by 2002:a05:6000:200a:b0:48f:bf71:2ad9 with SMTP id ffacd0b85a97d-49c727d1f2dmr17248226f8f.41.1794732588784;
        Sun, 15 Nov 2026 00:49:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/41] oeqa/core/tests: Add tests for skipping tests and td_vars checks
Date: Sun, 15 Nov 2026 08:48:39 +0000
Message-ID: <20261115084845.701136-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250267
Content-Type: text/plain; charset="utf-8"

Check that tests and whole classes can be skipped by id and that a
skipped class doesn't run its setUpClass(), and that a missing td_vars
variable is reported, ahead of reworking how test setup is hooked.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/tests/cases/skips.py  | 24 ++++++++++++++++++++++++
 meta/lib/oeqa/core/tests/cases/tdvars.py | 13 +++++++++++++
 meta/lib/oeqa/core/tests/test_runner.py  | 21 +++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/lib/oeqa/core/tests/cases/skips.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/tdvars.py

diff --git a/meta/lib/oeqa/core/tests/cases/skips.py b/meta/lib/oeqa/core/tests/cases/skips.py
new file mode 100644
index 00000000000..a24ee8d1c04
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/skips.py
@@ -0,0 +1,24 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+
+class SkipsClassTest(OETestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        raise Exception("setUpClass of a skipped class shouldn't run")
+
+    def testSkipsClass(self):
+        pass
+
+class SkipsTest(OETestCase):
+
+    def testSkipsSkipped(self):
+        self.fail("Skipped test shouldn't run")
+
+    def testSkipsRun(self):
+        pass
diff --git a/meta/lib/oeqa/core/tests/cases/tdvars.py b/meta/lib/oeqa/core/tests/cases/tdvars.py
new file mode 100644
index 00000000000..60313600754
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/tdvars.py
@@ -0,0 +1,13 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+
+class TdVarsMissingTest(OETestCase):
+    td_vars = ['NOT_IN_TD']
+
+    def testTdVarsMissing(self):
+        pass
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
index a9aac5ddf66..70107d1e25d 100755
--- a/meta/lib/oeqa/core/tests/test_runner.py
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -56,6 +56,27 @@ class TestResultStatus(TestBase):
             'resultsmodule.ResultsModuleTest.testModuleError': 'ERROR',
         })
 
+    def test_skip_tests(self):
+        # Tests and classes can be skipped by id prefix; a skipped class must
+        # not run its setUpClass()
+        tc = self._testLoader(modules=['skips'])
+        result = tc.runTests(skips=['skips.SkipsClassTest', 'skips.SkipsTest.testSkipsSkipped'])
+        statuses = {case_id: result._getTestResultDetails(case)[0]
+                    for case_id, case in tc._registry['cases'].items()}
+        self.assertEqual(statuses, {
+            'skips.SkipsClassTest.testSkipsClass': 'SKIPPED',
+            'skips.SkipsTest.testSkipsSkipped': 'SKIPPED',
+            'skips.SkipsTest.testSkipsRun': 'PASSED',
+        })
+
+    def test_td_vars(self):
+        tc = self._testLoader(modules=['tdvars'])
+        result = tc.runTests()
+        statuses = {case_id: result._getTestResultDetails(case)[0]
+                    for case_id, case in tc._registry['cases'].items()}
+        self.assertEqual(statuses, {'tdvars.TdVarsMissingTest.testTdVarsMissing': 'ERROR'})
+        self.assertIn("OEQAMissingVariable", result.errors[0][1])
+
     def test_subtest_status(self):
         self.assertEqual(self._statuses(['subtest']), {
             'subtest.SubTestTest.testSubTestFail': 'FAILED',
