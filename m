Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4337.1794732592688410454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UDrnfiiU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17943385e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732591; x=1795337391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jn79lalBbqwt28qSle040LD3UaScOJl7zKBnXJOGcBs=;
        b=UDrnfiiU3t7B06q4jOMf+it2Zz64Fyt0ItuKZFTg0v6oQZUqn8d2iqFDI/EU0+GHA+
         e35Z3UEELIy1qGAHHVyLCyZz/i6KTF/s8Q0eYB4+Oj5NmvZTI6ZkI9C1T4DJq0oq9HQX
         tK7u+KdrGkaNp9q5tkv8AYvaB3dCHwYLrGMNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732591; x=1795337391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jn79lalBbqwt28qSle040LD3UaScOJl7zKBnXJOGcBs=;
        b=h8vjsx/xQLqTlnu8DnjlUQsLOiIM3JxZLZ3PcpicA5wCtbklwkrTDUi32WjY4upH0Z
         dNTD0h79UucxYfIBZRHArNKD7lOSyzLthnmKzg6e/TIXcg4Clb/JgP4MhA/Mt6p48blc
         iXd21JEHI6YUIaEWWFO+rKZlsXp4N8DxboYrbC5y8BIQIVvEE0EO+YjgtirokBI/23V0
         WICqSta8jPwXN7uectSIxhgpVvewdZ0mFsVAhukxl24+zTf5ziD/pC7wruwgZyAI29W3
         u4l8coeRIBBKesSF/vwOrPBiS0BpBZM1OpiSaoEyO3CPyhWkvMep5zv7UL2CKXRybJ4u
         X7kQ==
X-Gm-Message-State: APuU4Z/KDAVm6LeSa29j2S1VCXSoaoJvEA6FTYSKU6uBOPa0NRs6sqnA
	5dSnK42B//+bBsB9VbVIcBK4KtsCfXHHJVeuoqpCtRRrkDcZL0pZiwpxP/l1saA8qMGPiD5cvYT
	M07gSo9s=
X-Gm-Gg: AYBFou3RKAIkpWeMJPHhhyhuilF7He++W0IPE2lDT1PlGeDl3roRP7M6YxzItFjuFXT
	WSs60rh77jOnfNjgEO23D+fWPUlbkC83intbF2wjY7/KoYChvSsEjfJ2VsfolqSmys06EsmtogP
	PaG+7R5S7pKY29Sa2amiYtpr7eAf16YTTWoYP8kKgQpA2NK0bc9G5vC1o0qABZGvXMG6TthyaI6
	Kd2DgJ2UCUzQO6zgdzkW5EQP48AhnaxvKRHfUnQQaINBrBzM/ipOg5AOibKT6/MVSzWtTNfUPrc
	hXyZUEfJk9aTP2OnHPrZBUzYz/ahOzqPE/OcmWdK6HWSRATiTvgGToW0kWmu4XC6yievNHbiPm2
	yKSjSC6e5FO7RRsJwIBFTrGntGW+tc75FuX5VpQrTb3KnHhUXcwuXxGbB2cmiA/e3Akn404NOlM
	pgpi6XLZVO3iMbkSrNJo0ub4FwKLG6ijYyxyWkW8TecEJGQNspQKxuftzzNuR6POIO2FyerBqar
	a27M7jqBeYuOxbeIQBC59eaLwcLsUX4EavaMGS+i0uApJPCQOj/bjS2hFkjm7FskHea5a2qJTxs
	c+Zzt3kQQ/mhoCm3GapIWLSjrDZ3RfjUimX7Oya2DTAh8Ko2M4Uz9v4UJQ==
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr21988935e9.29.1794732590860;
        Sun, 15 Nov 2026 00:49:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/41] oeqa/core/loader: Always return a flat test suite
Date: Sun, 15 Nov 2026 08:48:41 +0000
Message-ID: <20261115084845.701136-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250269
Content-Type: text/plain; charset="utf-8"

OETestLoader.discover() returned a flat suite of the loaded tests only
when a discovery decorator class was registered, which happens as a side
effect of some loaded module importing oeqa.core.decorator.depends.
Otherwise it returned unittest's nested per module suites. skipTests()
expects a flat suite, so with no module importing OETestDepends, as for
the oe-core selftests on their own, --skip-tests failed with:

  AttributeError: 'TestSuite' object has no attribute 'id'

Always return a flat suite, using the registered test cases in the order
they were loaded when no discovery decorator reorders them, and add a
test which runs without OETestDepends registered.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py            |  4 ++--
 meta/lib/oeqa/core/tests/test_loader.py | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index d4f330dafc3..9ff91e792aa 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -237,7 +237,7 @@ class OETestLoader(unittest.TestLoader):
                     pattern='*.py', top_level_dir=path)
             big_suite.addTests(suite)
 
-        cases = None
+        cases = list(self.tc._registry['cases'].values())
         discover_classes = [clss for clss in decoratorClasses
                             if issubclass(clss, OETestDiscover)]
         for clss in discover_classes:
@@ -246,7 +246,7 @@ class OETestLoader(unittest.TestLoader):
         if self.modules_required:
             self._required_modules_validation()
 
-        return self.suiteClass(cases) if cases else big_suite
+        return self.suiteClass(cases)
 
     def _filterModule(self, module):
         if module.__name__ in sys.builtin_module_names:
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index cb38ac845e3..f4ab4c5b414 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -6,6 +6,9 @@
 #
 
 import os
+import subprocess
+import sys
+import textwrap
 import unittest
 
 from common import setup_sys_path, TestBase
@@ -59,5 +62,25 @@ class TestLoader(TestBase):
         msg = 'Expected modules from two different paths'
         self.assertEqual(modules, expected_modules, msg=msg)
 
+    def test_flat_suite(self):
+        # The loaded suite must be a flat list of tests, which skipTests()
+        # relies on, even if no module registers a discovery decorator such as
+        # OETestDepends. Registering one is global so use a new process.
+        oeqa_lib = os.path.realpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '../../../'))
+        cases_path = os.path.join(self.cases_path, 'loader', 'valid')
+        script = textwrap.dedent("""
+            import logging, sys, unittest
+            sys.path.insert(0, %r)
+            from oeqa.core.context import OETestContext
+            from oeqa.core.decorator import decoratorClasses
+            tc = OETestContext({}, logging.getLogger('flat'))
+            tc.loadTests(%r)
+            assert not [c for c in decoratorClasses if c.__name__ == 'OETestDepends']
+            tc.skipTests(['another.AnotherTest.testAnother'])
+            print(' '.join(type(t).__name__ for t in tc.suites))
+        """) % (oeqa_lib, cases_path)
+        output = subprocess.check_output([sys.executable, '-c', script], text=True)
+        self.assertEqual(output.split(), ['AnotherTest'])
+
 if __name__ == '__main__':
     unittest.main()
