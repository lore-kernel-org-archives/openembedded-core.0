Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4394.1794732585727613805
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AGKOgSHh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17942915e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732584; x=1795337384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qFFVAfX+YGZ0x6GNk4C3sSkdNWvacVUulR0jwfm5IE=;
        b=AGKOgSHhR5LgqUcQUg0+ra/f0jvq4JplvWUI84Jomkl0uKvrJPAPCYu8kl5/HFk+jL
         B6+3QCGTFCl5AzoksMo4DdPpB5H5HWg3/ASBCn1cIBZ74MW2CRgJq6cnR6SIvweU8v2D
         RaYwgMOnUZx5JknQ91DMCB6bYT6PZB8E+yjmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732584; x=1795337384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5qFFVAfX+YGZ0x6GNk4C3sSkdNWvacVUulR0jwfm5IE=;
        b=ZMa6kyxRz0se1ZzNWtDjCoH8uF56Sh/HM7S68d3OgA/5+JL/EaCjH0/1IqY5VxEVgr
         9C6voVLeANzfIqhz3oJ+I0f0YiiLorrfyChyMqymFFsKVwm0QyJEYOQQYFuFFufIWqrA
         sSFDCZxlOaKS64mdztw7BVh9Ua0ao5khnIXkWO0diCL5l0wNl77epuyPDE8YhnCByYKP
         5G8PexYtR6FWaVJX8e6h8fytQb/iltCDC02btXblRrjVdv8Jewl9kvo3TSfhuBIR27da
         hJOGQv0TWeeTmdPrGaF9ZCV2d0UKhiWrBrBSKdeMWY8bOnPXuwqi818fAt9e583l11O+
         k6zA==
X-Gm-Message-State: APuU4Z9azUCYycEzk8CQCDo1oRgPgc6dPsEXqehOmqg6kbNar8nLG4JY
	3XFAEOB4TP77ZAoYNu894QqZ86DBqD6Daa+8YWTUR8zprhuXVftpM2+C8nSlYtBTX5dhRMLaxcu
	/XjsGsdE=
X-Gm-Gg: AYBFou0bVwUwSxDy1u13LWFXSjjGOyAAr31Eh+w9ge3XmVgJI762yJozZygioXbcHtH
	YX13mXhKD3dOyeRCRfO9Agfn1sD8sQGoo2YlY+WEGa4PTA8UwHdUwhXcSFcl4CvtxNPetfbof25
	tPyXrNbZ/F4J92lh2iZ1OFvhMmBbzGaR5MeilDfTviQWjPWFQyfHRBC0sT163uaqw9xTm06lLEb
	YUXyLZLpytG9Zfo8ZS+roecwZxnUFkHmWjiX1jcpS3GwNGwJpmOY4WP0Fm2CP/RAlocyFBdwqXO
	kFMsGYb3kqG4vwRxWz95q4JeRuaS/coDlVjFl9rdmB5zPmQUjUcPXCZ/HvjvJXL4bEr5S9aBX8g
	3/9AciAJZnxtsxffKUtVfBAhSsk+i5gReiJBwrJszINyLOuvp/PJnS5BefcjFl5UwSzqy4b0jLG
	6IKdQgt8b1SEFn9VV6dBybghKzGdY27EfTlqo1a9s3zv9SPXxDQvQxoUTYVNIFF+rwgsmS/BbEv
	/Pz0ZoAbT94O3J7hM/wyIjy7IdFToGh88w3jv1/kHPX9nLxfHKdTO8WoFoOPMe98++PWjMoFumy
	lSlLFKujMMDtcLZ2jkZk0/sglTxVliZ5SDnDe0H8xDI0QuYN1OTNsRZSUw==
X-Received: by 2002:a05:600c:8b82:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb6814762dmr67481465e9.22.1794732583952;
        Sun, 15 Nov 2026 00:49:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/41] oeqa/core/runner: Use getSuiteCases() to list tests
Date: Sun, 15 Nov 2026 08:48:37 +0000
Message-ID: <20261115084845.701136-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250265
Content-Type: text/plain; charset="utf-8"

The test listing code had its own recursive walk over the suite, and a
counter stored on the runner, to do what getSuiteCases() already does.
Use getSuiteCases() instead. The output is unchanged.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 79 +++++++++++++-----------------------
 1 file changed, 28 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f68203baa3b..6de9d865f4c 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -6,7 +6,6 @@
 
 import os
 import time
-import unittest
 import logging
 import re
 import json
@@ -15,6 +14,8 @@ import sys
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
 
+from oeqa.core.utils.test import getSuiteCases
+
 def _case_id(case):
     # Failures in subtests are recorded against a subtest object, use the
     # id of the test case it belongs to
@@ -272,68 +273,44 @@ class OETestRunner(_TestRunner):
         return self.resultclass(self.tc, self.stream, self.descriptions,
                 self.verbosity)
 
-    def _walk_suite(self, suite, func):
-        for obj in suite:
-            if isinstance(obj, unittest.suite.TestSuite):
-                if len(obj._tests):
-                    self._walk_suite(obj, func)
-            elif isinstance(obj, unittest.case.TestCase):
-                func(self.tc.logger, obj)
-                self._walked_cases = self._walked_cases + 1
-
     def _list_tests_name(self, suite):
-        self._walked_cases = 0
-
-        def _list_cases(logger, case):
-            oetags = []
-            if hasattr(case, '__oeqa_testtags'):
-                oetags = getattr(case, '__oeqa_testtags')
-            if oetags:
-                logger.info("%s (%s)" % (case.id(), ",".join(oetags)))
-            else:
-                logger.info("%s" % (case.id()))
+        cases = getSuiteCases(suite)
 
         self.tc.logger.info("Listing all available tests:")
-        self._walked_cases = 0
         self.tc.logger.info("test (tags)")
         self.tc.logger.info("-" * 80)
-        self._walk_suite(suite, _list_cases)
+        for case in cases:
+            oetags = getattr(case, '__oeqa_testtags', None)
+            if oetags:
+                self.tc.logger.info("%s (%s)" % (case.id(), ",".join(oetags)))
+            else:
+                self.tc.logger.info("%s" % (case.id()))
         self.tc.logger.info("-" * 80)
-        self.tc.logger.info("Total found:\t%s" % self._walked_cases)
+        self.tc.logger.info("Total found:\t%s" % len(cases))
 
     def _list_tests_class(self, suite):
-        self._walked_cases = 0
-
-        curr = {}
-        def _list_classes(logger, case):
-            if not 'module' in curr or curr['module'] != case.__module__:
-                curr['module'] = case.__module__
-                logger.info(curr['module'])
-
-            if not 'class' in curr  or curr['class'] != \
-                    case.__class__.__name__:
-                curr['class'] = case.__class__.__name__
-                logger.info(" -- %s" % curr['class'])
-
-            logger.info(" -- -- %s" % case._testMethodName)
-
         self.tc.logger.info("Listing all available test classes:")
-        self._walk_suite(suite, _list_classes)
+        module = cls = None
+        for case in getSuiteCases(suite):
+            if case.__module__ != module:
+                module = case.__module__
+                self.tc.logger.info(module)
+            if case.__class__.__name__ != cls:
+                cls = case.__class__.__name__
+                self.tc.logger.info(" -- %s" % cls)
+            self.tc.logger.info(" -- -- %s" % case._testMethodName)
 
     def _list_tests_module(self, suite):
-        self._walked_cases = 0
-
-        listed = []
-        def _list_modules(logger, case):
-            if not case.__module__ in listed:
-                if case.__module__.startswith('_'):
-                    logger.info("%s (hidden)" % case.__module__)
-                else:
-                    logger.info(case.__module__)
-                listed.append(case.__module__)
-
         self.tc.logger.info("Listing all available test modules:")
-        self._walk_suite(suite, _list_modules)
+        listed = set()
+        for case in getSuiteCases(suite):
+            module = case.__module__
+            if module not in listed:
+                if module.startswith('_'):
+                    self.tc.logger.info("%s (hidden)" % module)
+                else:
+                    self.tc.logger.info(module)
+                listed.add(module)
 
     def list_tests(self, suite, display_type):
         if display_type == 'name':
