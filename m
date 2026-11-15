Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4389.1794732576939660914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eamqf2W8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso2045636f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732575; x=1795337375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bf4P3f9Gzu3gYu2q1dNwCaXpaQVZ0gbtr7u6c7HhnI4=;
        b=eamqf2W8XQrdwMbtT9mbM+e0uQmTw3j9t5pLzrOKGNlZUNQJOceL70gXq3VpHO2BMF
         4us22BHHB1Lcr4s6Psw/2loI8IGoBYGEHMtcDNc5YoGqruGG90VxDjI4yT8IXsjUWPBw
         uLdDb1ozwmpzPJMsIwZuaNo50UT0Y+f1vKE7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732575; x=1795337375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bf4P3f9Gzu3gYu2q1dNwCaXpaQVZ0gbtr7u6c7HhnI4=;
        b=IbH8U4MaVzX0nn62YybKinF2O2tYCOekPqcqJwLMq6VUTCf2jevwvmHSy6Da+LbyHg
         q365fuzI3tVGP4Bl/Hent5a4hwvcl7rn8365BseZ3BRZ4Bbx+VHqDw8ZmuDIX42zorNM
         n0NUlvHIFhQZjFQg6TqAn32GmB7ZVQnK7cxX8d8A5bVn0Cj9yfs/ZRulDwk4ERqARdJq
         Mxij2fq7F2bGvNgcsS8tiD6NTc7JD+c7wYOaywV0Ei43IdlpIQ2hi24iOzEA636pmeU7
         SVKY9h5Z2LDx7FLuib9s7WabUdlc9hMuPq6oO+bHK8qKwLcIqFNoZFH0CFH7a0KMCwdz
         DccA==
X-Gm-Message-State: APuU4Z89iNTYv00TSamt5euEZX/mvUHJvEsR9VtucBe1QFE+i0vWRw7+
	sQjH6ucEecmkbBHhCRhQbGnf/1ISgYQaN+ahhaEr/0bHdqDQjOH3fJKOmMb7uIV3vJB3bEQzFXY
	k/GAxVo4=
X-Gm-Gg: AYBFou1WUEswE5JKGiaM27sKEgbTN8t8w2V+82QdHuw40USrRPa/IYxW1T41vVpNp54
	3OCxylwYuiP9AIou6DqPKXHVBNRAPnBrkg/jQwDeaBM459yQ8h8zSjvpQ8r14yDhXGP+yFyXGnm
	a93cHgXVjaAsEvHnhCzsRLGYI6IUHSxumFoz8xelD2qYHreu0QlYJK5T4he8+G5+J5Gqe+g1QZE
	Socnmi2jWM0jfKb7h1xmI/KiItk8TThqsQTre9p4YpCsbKLyryfatK7V9902/1kL5Sx+pa+1hWY
	qDtcN7hdP0NJM3Cj1vLHwq49DaYAi0TU7+TPfsalKk4SfWJ9XNFIECL2mh7LU5RTN9AzgJega2d
	xHhByOkB1XikIAYz7D5q5Jlvz8rWgedrR+py9uv8zbdu1bayMUVIu19LoZFVWdcSYShXzqd43yn
	uEqpyhAlKrIQz+CM23+0uKdgdREJRodTyX+eGC7GtTZqW5ewhOKZjHOK88p+kCRXyUkl9VC02tX
	4QDz5hjsC5qTyXUFWTRTprwUGBNSItFclx1wtQ8XV+WnQJSx/EN/IyZ47TDL4KT/eTyGLnSSZdo
	MWjiSLTNwHnWhOWF9VBdunIwPdcZBoydK6uDAcmbeGWa6KsvUhFWlOct6g==
X-Received: by 2002:a05:6000:2888:b0:493:d5f0:4e68 with SMTP id ffacd0b85a97d-49c72307130mr16960560f8f.36.1794732575067;
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/41] oeqa/core/case: Tear down decorators if setUp() fails
Date: Sun, 15 Nov 2026 08:48:31 +0000
Message-ID: <20261115084845.701136-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250259
Content-Type: text/plain; charset="utf-8"

unittest doesn't call tearDown() when setUp() raises, so if a test's own
setUp() failed after the decorators were set up, they were never torn
down. For OETimeout this left the alarm running so it could fire during
a later test. Tear the decorators down in that case too and add a test.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/case.py                  | 4 +++-
 meta/lib/oeqa/core/tests/cases/timeout.py   | 9 +++++++++
 meta/lib/oeqa/core/tests/test_decorators.py | 9 +++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index ad5524a7142..e71cab5028c 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -44,14 +44,16 @@ class OETestCase(unittest.TestCase):
         clss.tearDownClassMethod()
 
     def _oeSetUp(self):
+        # unittest doesn't call tearDown() if setUp() fails so the decorators
+        # need tearing down here in that case too
         try:
             for d in self.decorators:
                 d.setUpDecorator()
+            self.setUpMethod()
         except:
             for d in self.decorators:
                 d.tearDownDecorator()
             raise
-        self.setUpMethod()
 
     def _oeTearDown(self):
         for d in self.decorators:
diff --git a/meta/lib/oeqa/core/tests/cases/timeout.py b/meta/lib/oeqa/core/tests/cases/timeout.py
index 69cf969a67b..2d7229c18fd 100644
--- a/meta/lib/oeqa/core/tests/cases/timeout.py
+++ b/meta/lib/oeqa/core/tests/cases/timeout.py
@@ -32,3 +32,12 @@ class TimeoutTest(OETestCase):
 
     def testTimeoutUnrelated(self):
         sleep(6)
+
+class TimeoutSetUpFailTest(OETestCase):
+
+    def setUp(self):
+        raise Exception("setUp failed")
+
+    @OETimeout(10)
+    def testTimeoutSetUpFail(self):
+        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 2c668a9871d..d3305b1e534 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -147,6 +147,15 @@ class TestTimeoutDecorator(TestBase):
         msg = "OETestTimeout didn't restore SIGALRM"
         self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
 
+    def test_timeout_setup_fail(self):
+        tests = ['timeout.TimeoutSetUpFailTest.testTimeoutSetUpFail']
+        alarm_signal = signal.getsignal(signal.SIGALRM)
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        self.assertFalse(tc.runTests().wasSuccessful())
+        # signal.alarm() returns the time left on any previous alarm
+        self.assertEqual(signal.alarm(0), 0, msg="OETestTimeout alarm left running after setUp failed")
+        self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg="OETestTimeout didn't restore SIGALRM")
+
     def test_timeout_cancel(self):
         tests = ['timeout.TimeoutTest.testTimeoutSkip', 'timeout.TimeoutTest.testTimeoutDepends', 'timeout.TimeoutTest.testTimeoutUnrelated']
         msg = 'Unrelated test failed to complete'
