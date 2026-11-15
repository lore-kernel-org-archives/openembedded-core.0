Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4396.1794732591685414621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W4/7EK9K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so1022852f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732590; x=1795337390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0upI0JkeOtdlV3/K9FWBma6qnIg4K4SSiqU5bydGtmo=;
        b=W4/7EK9KNV7pi5rd5iChDZDbFvTqVoMpAmUQ7Wa4ivsRbvesL0M68VYLenXrxPCL0a
         VV+1ZL8RmcuqzjO6U2fWR09H1txuY8HsrvRQKzrSJdmiCqfRL+qM4ust542/cUWXPGIh
         CV3+OiukoEhHWoOYAnOIV84e8TAHrQDSHDJeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732590; x=1795337390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0upI0JkeOtdlV3/K9FWBma6qnIg4K4SSiqU5bydGtmo=;
        b=kVyIDBl8JOrmX7tL8LbjTTGgz30CXXHI8wLo9rVVzXlfq1zrSLH5e1nUfJf5PMxkdu
         bp3KLeVjq5I2zPIE2ecqEQGYeGD6n3TM+CFwQcgrto7sG1IN7zIj5YKIOePWG6rEh860
         vd6xn3/8u9F1dfhr1L+SGQUwFzCaSqMT35p+pGfMnvi9wCuI5Jkz5vX7LknjdRaB6Y/v
         4YPI1BkYl/rmSg/YKjj38CbO9sbAeHD1lnI3ULd4GRAYbrQ+ZzRZJi+VL2Nfg9lvr0mX
         6f1dPCYJJmQT6ICEcPGnIgc6Rv0UHnPy/gzrVzU81ltm1ehp/jgzj93pBvV7iyufQgs9
         ePWQ==
X-Gm-Message-State: APuU4Z+SmEMCTY2Ah85Suh8OkcTdl9VRnN3Zrg2NR6cEqHY70LO5ZYWB
	5BCsyDjUJtTLgbLOjzYDsZk9HjOQQA47opG/p36SV/1AlNvOFqy6KagU3zDPl00C+9pDKJJlp8f
	xP5+TP0U=
X-Gm-Gg: AYBFou1Xa1jJMyFowcab7Hm1sd0W2xmoR902EaL4RrCtPu+usJsZWHDAjI2lxRBqQTq
	2+raaYA4b0c2thH5zXcyc3ZSvbp95v3Z6/WpymTElxpBpUm7gbM32r0+IhMrVPQn4+5wB9pAdIH
	AMzsdguE+cvsEPv2D2MSIKwnSyLw9bKhjzrNplbz5GjTOG4Q1gv2hTfV+esMhtFJJDSTmY/Besk
	UQip590XdbU1T9A5rSqw2Hkq46v83zlwAi2qW6kLdLn8+7v+g5CF1oolCnSkQ4axPGMBXn1uMAQ
	esIY5qZB2j7nMfKa7EiEUh0NJR0nyPBiBHtbKyfNWfHPm1pzEdWjys6bsgzdrXEORqElvvvSnwk
	5+gPtm5bl/1aoQMwFoE4qKhUVCLbkONi9dwkgzQwYyIvi3U46zA+EFMzPTScWgBxhY0sek5jiNq
	tZbZx/3tPMTFkSbbX8ZQAV9JYcNJm53/aVLPRcuo0SQwDHvie1UK407xjrHXdmUa99yIGTm+jiF
	5U2qsOxc2y24NHKc1ORmY3XIHJuRFV0YkTXR/a08pbwV3wrDVWuUBYZJldNBr/Hza8++XGnFIuK
	oK3oCCefBPAJ054w0rwt75M8qqdeL4bgM9/zf2MaL38mEtlWf8qqzhTtRg==
X-Received: by 2002:a5d:584c:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-49c7325b837mr17556216f8f.50.1794732589864;
        Sun, 15 Nov 2026 00:49:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/41] oeqa/core: Use unittest's setup hook instead of patching test classes
Date: Sun, 15 Nov 2026 08:48:40 +0000
Message-ID: <20261115084845.701136-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250268
Content-Type: text/plain; charset="utf-8"

To run the decorators and the td_vars check, OETestLoader renamed the
setUp()/tearDown()/setUpClass()/tearDownClass() methods of every test
class it loaded and replaced them with OETestCase wrappers, marking the
class as patched. Since the marker was inherited, a subclass which
overrode setUp() and was loaded after its parent class was left
unpatched and silently lost its decorators.

Override TestCase._callSetUp(), which unittest uses to run setUp(), to
check td_vars and set up the decorators, and register the decorator
teardowns as cleanups so they run after tearDown() and when setUp()
fails. The td_vars check now runs per test rather than in setUpClass(),
none of the classes using td_vars need the variables in setUpClass().

The class level hook was otherwise only used to skip classes given on
the command line, so use unittest.skip() for those and for skipped
tests. Tests in a skipped class are now each reported as skipped rather
than as a single class level skip.

This does mean we use python internal API but we can adapt if python
changes that.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/case.py    | 37 +++++++++++------------------------
 meta/lib/oeqa/core/context.py | 25 +++++++++--------------
 meta/lib/oeqa/core/loader.py  | 30 +---------------------------
 3 files changed, 21 insertions(+), 71 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index e71cab5028c..86944cddde0 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -32,33 +32,18 @@ class OETestCase(unittest.TestCase):
     # OEQAMissingVariable exception is raised
     td_vars = None
 
-    @classmethod
-    def _oeSetUpClass(clss):
-        _validate_td_vars(clss.td, clss.td_vars, "class")
-        if hasattr(clss, 'setUpHooker') and callable(getattr(clss, 'setUpHooker')):
-            clss.setUpHooker()
-        clss.setUpClassMethod()
-
-    @classmethod
-    def _oeTearDownClass(clss):
-        clss.tearDownClassMethod()
-
-    def _oeSetUp(self):
-        # unittest doesn't call tearDown() if setUp() fails so the decorators
-        # need tearing down here in that case too
-        try:
-            for d in self.decorators:
-                d.setUpDecorator()
-            self.setUpMethod()
-        except:
-            for d in self.decorators:
-                d.tearDownDecorator()
-            raise
-
-    def _oeTearDown(self):
+    # Decorators bound to this test case by OETestLoader
+    decorators = ()
+
+    def _callSetUp(self):
+        # unittest.TestCase.run() calls this to run setUp(). Check the test
+        # data and set up the decorators first. Decorators are torn down as
+        # cleanups, which run after tearDown() and also if setUp() fails.
+        _validate_td_vars(self.td, self.td_vars, "class")
         for d in self.decorators:
-            d.tearDownDecorator()
-        self.tearDownMethod()
+            d.setUpDecorator()
+            self.addCleanup(d.tearDownDecorator)
+        super()._callSetUp()
 
     def assertFileExists(self, filename, msg=None):
         """
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 3bd65ba35f6..601a8014d9b 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -47,24 +47,17 @@ class OETestContext:
         return modules
 
     def skipTests(self, skips):
-        if not skips:
-            return
-        def skipfuncgen(skipmsg):
-            def func():
-                raise unittest.SkipTest(skipmsg)
-            return func
-        class_ids = {}
+        # Use unittest's skip support so that skipped tests, and the class
+        # setup of skipped classes, don't run
         for test in self.suites:
-            if test.__class__ not in class_ids:
-                class_ids[test.__class__] = '.'.join(test.id().split('.')[:-1])
+            class_id = test.id().rsplit('.', 1)[0]
             for skip in skips:
-                if (test.id()+'.').startswith(skip+'.'):
-                    setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
-        for tclass in class_ids:
-            cid = class_ids[tclass]
-            for skip in skips:
-                if (cid + '.').startswith(skip + '.'):
-                    setattr(tclass, 'setUpHooker', skipfuncgen('Skip by the command line argument "%s"' % skip))
+                msg = 'Skip by the command line argument "%s"' % skip
+                if (class_id + '.').startswith(skip + '.'):
+                    unittest.skip(msg)(test.__class__)
+                elif (test.id() + '.').startswith(skip + '.'):
+                    method = getattr(test, test._testMethodName)
+                    setattr(test, test._testMethodName, unittest.skip(msg)(method))
 
     def loadTests(self, module_paths, modules=[], tests=[],
             modules_manifest="", modules_required=[], **kwargs):
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 94ade54506d..d4f330dafc3 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -171,37 +171,9 @@ class OETestLoader(unittest.TestLoader):
         return False
 
     def _getTestCase(self, testCaseClass, tcName):
-        if not hasattr(testCaseClass, '__oeqa_loader') and \
-                issubclass(testCaseClass, OETestCase):
-            # In order to support data_vars validation
-            # monkey patch the default setUp/tearDown{Class} to use
-            # the ones provided by OETestCase
-            setattr(testCaseClass, 'setUpClassMethod',
-                    getattr(testCaseClass, 'setUpClass'))
-            setattr(testCaseClass, 'tearDownClassMethod',
-                    getattr(testCaseClass, 'tearDownClass'))
-            setattr(testCaseClass, 'setUpClass',
-                    testCaseClass._oeSetUpClass)
-            setattr(testCaseClass, 'tearDownClass',
-                    testCaseClass._oeTearDownClass)
-
-            # In order to support decorators initialization
-            # monkey patch the default setUp/tearDown to use
-            # a setUpDecorators/tearDownDecorators that methods
-            # will call setUp/tearDown original methods.
-            setattr(testCaseClass, 'setUpMethod',
-                    getattr(testCaseClass, 'setUp')) 
-            setattr(testCaseClass, 'tearDownMethod',
-                    getattr(testCaseClass, 'tearDown'))
-            setattr(testCaseClass, 'setUp', testCaseClass._oeSetUp)
-            setattr(testCaseClass, 'tearDown', testCaseClass._oeTearDown)
-
-            setattr(testCaseClass, '__oeqa_loader', True)
-
         case = testCaseClass(tcName)
         if isinstance(case, OETestCase):
-            setattr(case, 'decorators', [])
-
+            case.decorators = []
         return case
 
     def loadTestsFromTestCase(self, testCaseClass):
