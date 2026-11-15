Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4335.1794732579154568516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BPhV2K1f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so12444515e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732577; x=1795337377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYnurFPZO8lOfyrEZx6HUhkzrAkGA8RwTsGNgeoaDds=;
        b=BPhV2K1f+bSfiFIhPYfQDr5ytYYLGYNZqSl9HPRHMM0f4eqWAZmA7QRtWTj6D8GJ3y
         MHI7cLncMJxB0Sqfh2kDt8MeebAik7LFEem6aNCKxGtxq6eTlmc1vFYrka8nQw0AwrWr
         mnfv96PjfOhkKbEqkV2lRU0PgEgG9GHYoYRv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732577; x=1795337377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IYnurFPZO8lOfyrEZx6HUhkzrAkGA8RwTsGNgeoaDds=;
        b=zI++h/69KVcglik0MQXNtDj6l3Mjl4yuby4KvLat5IJ+FEqnkxy7rRfi+XER6uw7Nb
         K2v5D1Z7uuDtj6QRMymfNutHUiomVY9KnoN/iv3JjOKIh4qofG6n7khBeB5vgdRwSkTQ
         XpUx+gtHHzn7qtqP4+TG/VZjpG7dfvuEpHdYiSZRmtnnUhYc6kiM9jdzcVyoXQTF6Ksj
         VI8YHQVnflZO19lubPIkjEZEDjwDklRemTvlLgP7Id4QQ9jjEXs4NdFIReCaR9x2pp+D
         jyhNg/gpB6ABTkHo50kDW7UsaPEo7yQBvgKI0F4lUXzNQht9Qk2+mbrnbGq19vDLT1c2
         mrLA==
X-Gm-Message-State: APuU4Z95p1HvBiYLgW5JtN5Alnw8ljjZspkefP5FxRo4THNjJTCVuMcI
	0sVDxfQXbtUHDrTzvrWyg/pa4FTDW7eifki02M+JejQ0Qt/85Jv6i58D3fdP47/NJJuyFNy4o+Z
	uH/MwDkU=
X-Gm-Gg: AYBFou1vaTg5bFdPgRdRnVkF4N/XYp1eRvXzefZkHZDuzZn80p/5BonGCuotFu2E9p2
	8MFEmhNBepL+JmArGydd5hC+LOjOGoEf59UJ5TF02Vx97V4Xpznq0sDJGNpSk2MBVp2qjhev523
	lL3TazY7Vz9nbaT6+x7KOxmZi6569bVBCwvLPvJway6LW7XaNrqVQC3zXyPLeumMtLjgZ81i7+g
	sewikYNxu6jspPuParCGpmyDIEX2fLWQvnzhSEmDvp8nvGEUiZwsRMHN374mHXG+wjFC2bbtLMV
	b7/eliME4EukBO9KSDZQi4QRQWqN9eZ3aQ2j7xAwl7Z0mhxZ5aH7nz/pdC0FbDePU8npPMjuHw7
	Dk0lHnLh/wO3UHdY7ZxiCVSQl2WrlPuanRiCxYAzBNAl72eGoA5VToSjTGCdcfmFNNdfF/9StFg
	LFX5LYuC0GmqLOCyboCMTOSYMUdD3nXGSA9gWoB9/xqwLbnR1yn7KV+d73n5e0CSysYwBXXJzRt
	sAtm4OXGi2f8NOUx+RTMwXb6sIBMjHwehj7ao/iR1EIP2IK+cbmopQKn0YKRvZn5E4oMQ5CpqSG
	HA1oqm/L+EVkFXbvFJbO1TzvtBN3K03/H+6CwV1PNXJlTSqxf8llbmo+Ew==
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr118169905e9.17.1794732577251;
        Sun, 15 Nov 2026 00:49:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/41] oeqa/core/runner: Report the status of tests with failing subtests
Date: Sun, 15 Nov 2026 08:48:33 +0000
Message-ID: <20261115084845.701136-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250261
Content-Type: text/plain; charset="utf-8"

unittest records subtest failures against a subtest object rather than
the test case, so the result lookups never matched them. Tests with
failing subtests were reported as UNKNOWN in the results and their
failure messages weren't shown as the test finished. Match subtests to
their test case and add a test.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py              |  9 +++++++--
 meta/lib/oeqa/core/tests/cases/subtest.py | 19 +++++++++++++++++++
 meta/lib/oeqa/core/tests/test_runner.py   | 13 +++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/subtest.py

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 9164ee6bcca..a9b416f7cd7 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -15,6 +15,11 @@ import sys
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
 
+def _case_id(case):
+    # Failures in subtests are recorded against a subtest object, use the
+    # id of the test case it belongs to
+    return getattr(case, 'test_case', case).id()
+
 class OEStreamLogger:
     def __init__(self, logger):
         self.logger = logger
@@ -73,7 +78,7 @@ class OETestResult(_TestResult):
         # to wait until selftest finishes to see them.
         for t in ['failures', 'errors', 'skipped', 'expectedFailures']:
             for (scase, msg) in getattr(self, t):
-                if test.id() == scase.id():
+                if test.id() == _case_id(scase):
                     self.tc.logger.info(str(msg))
                     self.shownmsg.append(test.id())
                     break
@@ -109,7 +114,7 @@ class OETestResult(_TestResult):
                     scase, msg = resultclass
                 else:
                     scase, msg = resultclass, None
-                if case.id() == scase.id():
+                if case.id() == _case_id(scase):
                     found = True
                     break
                 scase_str = str(scase.id())
diff --git a/meta/lib/oeqa/core/tests/cases/subtest.py b/meta/lib/oeqa/core/tests/cases/subtest.py
new file mode 100644
index 00000000000..d24135f7c98
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/subtest.py
@@ -0,0 +1,19 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+
+class SubTestTest(OETestCase):
+
+    def testSubTestFail(self):
+        for i in range(2):
+            with self.subTest(i=i):
+                self.assertEqual(i, 0)
+
+    def testSubTestPass(self):
+        for i in range(2):
+            with self.subTest(i=i):
+                self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
index 205464cfae9..ce7be7b14e3 100755
--- a/meta/lib/oeqa/core/tests/test_runner.py
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -36,5 +36,18 @@ class TestRunner(TestBase):
 
         fp.close()
 
+class TestResultStatus(TestBase):
+    def _statuses(self, modules):
+        tc = self._testLoader(modules=modules)
+        result = tc.runTests()
+        return {case_id: result._getTestResultDetails(case)[0]
+                for case_id, case in tc._registry['cases'].items()}
+
+    def test_subtest_status(self):
+        self.assertEqual(self._statuses(['subtest']), {
+            'subtest.SubTestTest.testSubTestFail': 'FAILED',
+            'subtest.SubTestTest.testSubTestPass': 'PASSED',
+        })
+
 if __name__ == '__main__':
     unittest.main()
