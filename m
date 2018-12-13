Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3D271BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:35 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z9so1740770pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=D9wJtBV/U0gDnHfJ2vCIdDHESCaYzzDutQa/ZWxOlnc=;
	b=RbZW94GHMcnHgmjAR+C4FO8nC1XmGTQu0W6WrOiIB2Nq6p2HrXo4UQb2TUt6J1sTNE
	T19rFeVpKWOxhX6DAY+Sg3BW/LguAoedD9astdRj56f36UdjLQy0cvjNdcMKztc2fV4j
	1/JGVRr379E97bU+BDeOBtinDfgROLp5+kLnpbS14dbHlk3Yw48ik2nNTxuOwux7bPgz
	Wd8YNcS2nxQDS1KTsZNAHJkBTwkJTb24sPz0u+2mMnhhM8gHkfLtchzkK8AnB+iai/Xs
	Sk1WOcP/TBdclnkJjPqi44kZsodEBK5ybEJHP2+rVbpUWjMc4z4WOtus8h62aBa6dOkl
	yAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=D9wJtBV/U0gDnHfJ2vCIdDHESCaYzzDutQa/ZWxOlnc=;
	b=ppuhFqzoBjf9yDxUCdhir8gmbZdGxsdkpmoOv/b2UWGi5Lag2E63CgMKp7UHbl4SHQ
	1qQQYYIsmar3yFoOAsg/OevyTUGP9aOtrN6WJaK6IKKi3Qbtp/MfPLGNNY065CtUA2Mu
	nJL5lqeay/itDknwBrKzuVK864KeJIkwCxFuTXsMXShnksHQvOCA6yl68JMWefeirtV2
	zjCIH1Zt4y4FxiJw1c+nTOA3yIUMnkJf3YUOXtXfUXnpVZvXxr6+jX6y57gzpDIopefx
	a8PBG/zQwVpVw7YcayFd8qYAarsKdwi5b5/l/9DQ6MfsRiMhMrUpxzSkoKs67/UaFStL
	SwvQ==
X-Gm-Message-State: AA+aEWZcQrOGlGHZEmGRkAb7voevAwHm8X/JojCHELbam8xhnH/oip5F
	tZeU2AgXiaZA8jjydvcbVhSVq+c2
X-Google-Smtp-Source: AFSGD/U0qlYoamDmmO48/pfFS3K6xp5HsSa8e0NZ/b9STECv8ImUVnRu4XBQUxHAAJdkXcivphEajg==
X-Received: by 2002:a63:e247:: with SMTP id y7mr417355pgj.84.1544737176137;
	Thu, 13 Dec 2018 13:39:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:37 -0800
Message-Id: <48d88d97cc59f71e77d0adb58096e9112ce31200.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 29/45] oeqa: Remove xmlrunner
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 21:39:35 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This isn't present on modern distros by default and doesn't work with
testtools, needing multiple code paths in the code. Remove it in favour
of finding a better replacement for results collection/analysis.

(From OE-Core rev: 8001d933a8dc86004db014777f094d718086687d)

(From OE-Core rev: 02449e89d62a7714d30ab6e2e58c476dc9441f7a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 54 ++++++++------------------------------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 50122f2..429c216 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -7,16 +7,8 @@ import unittest
 import logging
 import re
 
-xmlEnabled = False
-try:
-    import xmlrunner
-    from xmlrunner.result import _XMLTestResult as _TestResult
-    from xmlrunner.runner import XMLTestRunner as _TestRunner
-    xmlEnabled = True
-except ImportError:
-    # use the base runner instead
-    from unittest import TextTestResult as _TestResult
-    from unittest import TextTestRunner as _TestRunner
+from unittest import TextTestResult as _TestResult
+from unittest import TextTestRunner as _TestRunner
 
 class OEStreamLogger(object):
     def __init__(self, logger):
@@ -77,19 +69,10 @@ class OETestResult(_TestResult):
         found = False
 
         for (scase, msg) in getattr(self, type):
-            # XXX: When XML reporting is enabled scase is
-            # xmlrunner.result._TestInfo instance instead of
-            # string.
-            if xmlEnabled:
-                if case.id() == scase.test_id:
-                    found = True
-                    break
-                scase_str = scase.test_id
-            else:
-                if case.id() == scase.id():
-                    found = True
-                    break
-                scase_str = str(scase.id())
+            if case.id() == scase.id():
+                found = True
+                break
+            scase_str = str(scase.id())
 
             # When fails at module or class level the class name is passed as string
             # so figure out to see if match
@@ -156,33 +139,14 @@ class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
     def __init__(self, tc, *args, **kwargs):
-        if xmlEnabled:
-            if not kwargs.get('output'):
-                kwargs['output'] = os.path.join(os.getcwd(),
-                        'TestResults_%s_%s' % (time.strftime("%Y%m%d%H%M%S"), os.getpid()))
-
         kwargs['stream'] = self.streamLoggerClass(tc.logger)
         super(OETestRunner, self).__init__(*args, **kwargs)
         self.tc = tc
         self.resultclass = OETestResult
 
-    # XXX: The unittest-xml-reporting package defines _make_result method instead
-    # of _makeResult standard on unittest.
-    if xmlEnabled:
-        def _make_result(self):
-            """
-            Creates a TestResult object which will be used to store
-            information about the executed tests.
-            """
-            # override in subclasses if necessary.
-            return self.resultclass(self.tc,
-                self.stream, self.descriptions, self.verbosity, self.elapsed_times
-            )
-    else:
-        def _makeResult(self):
-            return self.resultclass(self.tc, self.stream, self.descriptions,
-                    self.verbosity)
-
+    def _makeResult(self):
+        return self.resultclass(self.tc, self.stream, self.descriptions,
+                self.verbosity)
 
     def _walk_suite(self, suite, func):
         for obj in suite:
-- 
2.7.4


