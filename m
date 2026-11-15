Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4336.1794732586747354083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D838kozy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso4423305e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732585; x=1795337385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WHNmUCXfoovc28pQN+AdXsrZdjWqMte+sUiDKFRfbOU=;
        b=D838kozynsyneyBbHGcJixMhoyYelbRKVtYKCMgb6YgtoRjM2kPUxB/nmwLOu5ddfV
         CnC7yVMxesmX6iEkNh0OwclkNUCLLWaM1SvRdbmU+1qWdqOz+v40TC1HH0pG/MmTGB8t
         97C9jI9JeR7MDPLRbhgUqc09Wr2uUMpiJogwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732585; x=1795337385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WHNmUCXfoovc28pQN+AdXsrZdjWqMte+sUiDKFRfbOU=;
        b=sJ51t+uZB7jMRxRZ1zRDjyKNAtca/8WOIhUEI4l92Qm1r8Kv9X8jMljb3TmTjBqvww
         9qq6GyJsTQjpS+7hFEZECntgXvaGZKUIVtvR0wejnVVTIB47gX+EBojQ6IRHOLOSRNvX
         z5m/jIKAqngJfWL5BxxGsNDtvIQzqRvV8/6UHAl2ZAoPLIScIgtSpZDyUcjY5i5iAtg6
         ZuG64keRQgxcLhTcOJo3NXgH+hKLnABQYnLnXwryx3vUJQQ9UqDSdQ0s/fjbrG6y7DrX
         uttx9fPnVQlEm0U17dTOyA1RB/VvJTp3yK+jqqejyN+o5nQZlR61Py5BmiOSkkj4zuSZ
         k9ug==
X-Gm-Message-State: APuU4Z92KODITYzNp01qyurb1bmi3VO49UForVxOWyK8ho52NJrizPRs
	Aq0oo3+0bKnZ7UWO4PohCr4sBr4I857TpYJhnXiSzfRj/2iN55mIIdeAqNN6/LNrwEBgv9AxhXz
	53DBS38Y=
X-Gm-Gg: AYBFou0PYumNf4/VQlvPu02Z6GIeqMyHJ8cvi05K+KIHIlodtNvJwIMpSJ43Bf4X49W
	6ZHtRVALhEcCoeb/qxvDW2qATlVqQNT04HQO+FKzQhVWc2q1WPr5XSvLgkeMhtFhJEiLSu1XT1k
	xAqjz4mE/iekHAJGQrxY3oiHr+p+TYLOIg+N3z2+4icOfHw4YPsQfpDw5M2yeRm90kbVulOTThe
	7FUjDaeBtpVmM09ue07GvQQOdccllWB4WDhLMSKvJHqKWSOwLYrER0exhlde5bqY/wPVwd6KYxs
	ykOdPQe0ZFtqUVUjMBELte7x6FJfQbDMFafuuUVvGjWH1YhAq6kNRQAO3AtqyvBiQtn8SreieZZ
	XBIFtCmDOsFa4iHITeqktD/Pg6Bm4t6KnArjfca7j7dxIDdtibK1I5pNAP7FtqtlbdXKwhubGKT
	Bd9KyA1M2AE2N9MvB2+ISPsiGvHl2bgl8YVxDl2/l8sHOm8DO6ptaAJl9JdNpkZdzM7D9kZZfOz
	qUnuVcEPEtDOsVYG/bv3v3Y2lOtPHBxzrcxrPNcC6VK2s8RA+92f1ncjfLjCstGVdu6AV3V+W5A
	0swoJ36R/1SOfrI2Ghx9TUAuQSUEpaifM7pKZ9V6yXXkn3F5ZjaAjQJIJUU=
X-Received: by 2002:a05:600c:608e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb55a238bemr140035435e9.1.1794732584927;
        Sun, 15 Nov 2026 00:49:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/41] oeqa/core/decorator: Record decorators on the test function
Date: Sun, 15 Nov 2026 08:48:38 +0000
Message-ID: <20261115084845.701136-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250266
Content-Type: text/plain; charset="utf-8"

OETestDecorator wrapped each test method in a function which only called
it, with a dummy assignment to self so the decorator would be captured
in the wrapper's closure. OETestLoader then walked the closures to find
the decorators.

Instead, record the decorators in an attribute on the test function and
return it unchanged. The order they are set up in is the same as before,
innermost first, and a test now checks this.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/decorator/__init__.py    | 10 ++++----
 meta/lib/oeqa/core/loader.py                | 26 +++++++--------------
 meta/lib/oeqa/core/tests/test_decorators.py |  8 +++++++
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 93efd30e1db..e3e1326873c 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -4,7 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-from functools import wraps
 from abc import ABCMeta
 
 decoratorClasses = set()
@@ -29,11 +28,10 @@ class OETestDecorator(object, metaclass=ABCMeta):
             setattr(self, attr, value)
 
     def __call__(self, func):
-        @wraps(func)
-        def wrapped_f(*args, **kwargs):
-            self.attrs = self.attrs # XXX: Enables OETestLoader discover
-            return func(*args, **kwargs)
-        return wrapped_f
+        # Record the decorator on the test function for OETestLoader to find.
+        # They are set up in the order they are applied, innermost first.
+        func._oeqa_decorators = getattr(func, '_oeqa_decorators', []) + [self]
+        return func
 
     # OETestLoader call it when is loading test cases.
     # XXX: Most methods would change the registry for later
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 28b4fd20166..94ade54506d 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -14,8 +14,7 @@ from oeqa.core.utils.test import getSuiteModules, getCaseID
 
 from oeqa.core.exception import OEQATestNotFound
 from oeqa.core.case import OETestCase
-from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
-        OETestDiscover
+from oeqa.core.decorator import decoratorClasses, OETestDiscover
 
 # When loading tests, the unittest framework stores any exceptions and
 # displays them only when the run method is called.
@@ -103,23 +102,14 @@ class OETestLoader(unittest.TestLoader):
         self.tc._registry['cases'][case_id] = case
 
     def _handleTestCaseDecorators(self, case):
-        def _handle(obj):
-            if isinstance(obj, OETestDecorator):
-                if not obj.__class__ in decoratorClasses:
-                    raise Exception("Decorator %s isn't registered" \
-                            " in decoratorClasses." % obj.__class__.__name__)
-                # The decorator instance is shared by every class that has
-                # the method so bind a copy for this test case
-                copy.copy(obj).bind(self.tc._registry, case)
-
-        def _walk_closure(obj):
-            if hasattr(obj, '__closure__') and obj.__closure__:
-                for f in obj.__closure__:
-                    obj = f.cell_contents
-                    _handle(obj)
-                    _walk_closure(obj)
         method = getattr(case, case._testMethodName, None)
-        _walk_closure(method)
+        for obj in getattr(method, '_oeqa_decorators', []):
+            if not obj.__class__ in decoratorClasses:
+                raise Exception("Decorator %s isn't registered" \
+                        " in decoratorClasses." % obj.__class__.__name__)
+            # The decorator instance is shared by every class that has
+            # the method so bind a copy for this test case
+            copy.copy(obj).bind(self.tc._registry, case)
 
     def _filterTest(self, case):
         """
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 74ac4632372..90ab1d3ff67 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -126,6 +126,14 @@ class TestDependsDecorator(TestBase):
         self.assertEqual(result.skipped, [])
         self.assertEqual(len(result.successes), len(tests))
 
+class TestDecoratorOrder(TestBase):
+    def test_decorator_order(self):
+        # Decorators are set up in the order they are applied, innermost first
+        tc = self._testLoader(modules=['timeout'])
+        case = tc._registry['cases']['timeout.TimeoutTest.testTimeoutDepends']
+        self.assertEqual([d.__class__.__name__ for d in case.decorators],
+                         ['OETimeout', 'OETestDepends'])
+
 class TestInheritedDecorators(TestBase):
     modules = ['inherit']
 
