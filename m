Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4334.1794732577967770849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KMmDIFUg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so18535755e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732576; x=1795337376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Em4LeCNW9oSi+h+npeEyWWkD20+DJgqJ6mntdYL+G5Q=;
        b=KMmDIFUgh9DX7/mn2djXlfvZj0twg/prPl5tn6ErHRV58Q3sExemfLs0XWW1aLnoRD
         j90BYyil+qUm/wJZXtq2lJjcBUS+fLupTxlvRTnw784h7FWbClO/leqek0TbxRDjibqV
         aEFliwcacl6p6o6muQ8enwTkD/gXNuR9y5dOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732576; x=1795337376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Em4LeCNW9oSi+h+npeEyWWkD20+DJgqJ6mntdYL+G5Q=;
        b=ikfg9Qx742ZV2VjSk4fdQBf4+vHcSrJx9hOD/gzq0LN/EYFnY3ezmUxkMSH+YQ+KLY
         T+HNfbgCtgLwDPRka4bgsak3zeO+SpfJxo/LvkHfqvO4nKRP7Zfv33QjFUpll4qxBoZh
         5BmKl76XiJ9YVb49vKj6TvfuYrD9La9jOb9LOl+FJSr4rlI+M0jacXTL1etvnrXCu55E
         czz+VZIYoYUigU8woXMPMXh8ZXSvq5dIQ2+AGD15looz/quGkc3kCIboOC+fBo2dOhW+
         Ic1R1gNeIE+i1mI39yIxQfrQT2PUWqK2MbZaPqq/byofHQ//PcLEfkGyBty0UBy5yu7K
         JhfA==
X-Gm-Message-State: APuU4Z+eetOrjZ6jFeqev0YLNHGrUYtoBKnKqCM8Rug3J8MtDVj37d1L
	GeP+0LV/+TwLJ86HUGsZ30tjwdK3E301zJOGI2PgmaOqrOP3TdXnvsIJSK5+Vy38NfTaFIExHxh
	9iq/RN88=
X-Gm-Gg: AYBFou1hf8PYRvqVuQ9urZn4DdwGvcLiOfrVnCtDW/Ne/SZT6Gq+Aj1Vm/vP9GeH+Ho
	vgEP5cYOcxSuYnYduZK4Z1nCPUWha/2DzlNnxa2tX/tWUXOFW0j6GXOI8nRsDwhajEii3mxROSa
	BnHdzUGgM4nCiuAO0QP/1Y8xE0SprFQUPW0ps14KictsaHQ2lhBac04SjD4IIknK0B9Y7R0Xt2Q
	MVb3AkdL1EhpnbqbOERk8/mrH1GmAiiEZcytdhmIOPUK4nYpatfmPqzdYAz+XxWqJFRX8pfQSNH
	f7WvEy7g8vGFCLtcCuJeC21rwByBwAIGX8CIpi5u+8i9BYTpNfeON9vmE/Aqu16tWBHqf5TcR7q
	4pSfexGFzLb0JpgR9fiPg/vcb7O4WQSSYazyUAgZC1Iy/eT4olEGUxGM4UW71GL8rOnifSCGEBG
	wkr7l8HWDArhnH1a5fuTUiRiTip34EmRtzh1pzeMuuDkCOFm/VY7UlYXohXlhfbbzdexY05U8b+
	U7DWPI2+IvaqZ+lMOvug75Sk/GMdN2wHBIpEa8q08B1xp3iCtyabV6OkmnTxNmXEpABEoKtXxAZ
	Vai+30q2raZbQzlNAgPhQvIE0vJIT3o2kBpFzm3GIcSzcVZL4Zv6eSDfWA==
X-Received: by 2002:a05:600c:3e10:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb6651a042mr60844295e9.14.1794732576100;
        Sun, 15 Nov 2026 00:49:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/41] oeqa/core/loader: Bind a copy of each decorator per test case
Date: Sun, 15 Nov 2026 08:48:32 +0000
Message-ID: <20261115084845.701136-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250260
Content-Type: text/plain; charset="utf-8"

A decorator instance belongs to the decorated function, so when a test
method is inherited by more than one test class the same instance was
bound to each test case in turn and ended up referring to whichever case
was bound last. Its setUpDecorator() then ran against the wrong case.
Bind a copy for each test case instead and add a test.

Also fix the unregistered decorator error, which used obj.__name__ on a
decorator instance and so raised AttributeError instead.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py                |  7 +++++--
 meta/lib/oeqa/core/tests/cases/inherit.py   | 20 ++++++++++++++++++++
 meta/lib/oeqa/core/tests/test_decorators.py | 14 ++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/inherit.py

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 90b9366754d..28b4fd20166 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import copy
 import re
 import sys
 import unittest
@@ -106,8 +107,10 @@ class OETestLoader(unittest.TestLoader):
             if isinstance(obj, OETestDecorator):
                 if not obj.__class__ in decoratorClasses:
                     raise Exception("Decorator %s isn't registered" \
-                            " in decoratorClasses." % obj.__name__)
-                obj.bind(self.tc._registry, case)
+                            " in decoratorClasses." % obj.__class__.__name__)
+                # The decorator instance is shared by every class that has
+                # the method so bind a copy for this test case
+                copy.copy(obj).bind(self.tc._registry, case)
 
         def _walk_closure(obj):
             if hasattr(obj, '__closure__') and obj.__closure__:
diff --git a/meta/lib/oeqa/core/tests/cases/inherit.py b/meta/lib/oeqa/core/tests/cases/inherit.py
new file mode 100644
index 00000000000..8600c8005b5
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/inherit.py
@@ -0,0 +1,20 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class InheritBaseTest(OETestCase):
+
+    def testInheritFirst(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestDepends(['testInheritFirst'])
+    def testInheritSecond(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+class InheritSubTest(InheritBaseTest):
+    pass
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index d3305b1e534..74ac4632372 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -126,6 +126,20 @@ class TestDependsDecorator(TestBase):
         self.assertEqual(result.skipped, [])
         self.assertEqual(len(result.successes), len(tests))
 
+class TestInheritedDecorators(TestBase):
+    modules = ['inherit']
+
+    def test_inherited_decorators(self):
+        # Each test case needs its own decorator instances, even when the
+        # test method is inherited by another test class
+        tc = self._testLoader(modules=self.modules)
+        cases = tc._registry['cases']
+        self.assertEqual(len(cases), 4)
+        for case in cases.values():
+            for d in case.decorators:
+                self.assertIs(d.case, case)
+        self.assertTrue(tc.runTests().wasSuccessful())
+
 class TestTimeoutDecorator(TestBase):
     modules = ['timeout']
 
