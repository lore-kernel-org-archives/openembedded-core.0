Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4388.1794732574726380627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=csqsNLB6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490585eddfcso1787787f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732573; x=1795337373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PBBqLks8pXq6n8gaq7ssFyajeLLxCEBX2aibZgKxoFk=;
        b=csqsNLB6jtu1LB24DErfT3ckB8olYefALA5RiIlYOZVbJJm9MJI+YuSuEch02BmZSu
         V1M3EylNXHwi7ui5B6PCrebsMCAK2yvt7RbO7m6DdwyrAfegiQt52LjGovWvF6EQChse
         HNPcJxZTOrKRSayIrFlPSO2VXXhLCZRh2HkZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732573; x=1795337373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PBBqLks8pXq6n8gaq7ssFyajeLLxCEBX2aibZgKxoFk=;
        b=GOI7hLyW8Rm4+Sg0M9t4qHy6mnrdpP756fL/Xgm+3dVlxRlRwW0A8DvDP+lGxA8Ci+
         Jot7Mgun0mDVR0YVipckCo11I/0DzpthH5ZXXpxdDQDTYdlXIsbeWJovIcPK0MiB9uQn
         P0Yg+4jaIy+CV1EuTUYzDFHHzgubNEs8m0jOl4QJqMAXDxnrTUA0iT9VzT4+TpXokm5y
         XF04Tjbt4RTIX8XWNiXrmPNQ9rItxbGRzfL+0h/yZnd/01aEgS9gDozx3jEOxcd1Rv0V
         gHqxYxU356fC1zNxB2DYps1+aSs1C5suybWrCe+P1TgTcQUc7H5IAyAqsAlRei2o09jZ
         RHBw==
X-Gm-Message-State: APuU4Z+gcL9zNKytd5NnezqLF7ZsavNlaFpGume2FPVOcX85Z1sF2Dcs
	StQQYSh+Q3DrZ54ik0WVozr25KFY7PNsGHdoHC7DtUn2rDPPJgDwaEC3FXVucsrJpP4rVZA4yrR
	jzO/QuxM=
X-Gm-Gg: AYBFou3JVuqyT0IwH/x2I3KZ6z0Q4L5uLkb7/U+xFmEHTJ899QTSUdHFg9967XzVibB
	nbHKvkmJhpdPBiN+DRzOwFKohJZZ2RiAoAv0AIn7Q8AQQbNko4WU8F6RFqMSZPt1PQ8JZA7Qd+4
	JlgTUe7ROmP2N1wQBjyhxlL1tnsr8vMFNh0sxG3sm2Wv5o+dSK2yKgqrtUi0k42Rbn5KAEfGtlQ
	F5nqN7lKukaglferFW3Z/oil9ggUufn1oa8yTy8eRCv4XP2pfI9znG3Y1lDkoyHfRfkFRe+3tYI
	elc5invC5oR6/ZP3fvrs/Sh4J8AnbXCTk4BvNDqMH0OdVXeLCPwugajGWtYcMChehvWB6i3de//
	z+svonKwCBi4zZrNsxKswlG9H+FpEIitD2IVkHVBnsFHvP5v+NHQjTdYtBN2bFGhQUIYxZ0Fsv3
	WsQ4FwoMxxDv5HbM2YTdG3LKW6Z1rK3FD9IU0U78DWabSLJqdxzgos1KRvhkjcsMIVzUUOUIKOO
	ADT9MSbs0xEicHlZ73tSg0cUBOMJkrUIEZeZ+cNh3h9RnobFOnPeQPiTzFUUz03yZ4RkOjWGgtU
	yeofBFIZAtS+BYsunnOtpdLchDwx5DMIj/huV2RZ+C7gq576XNBP9Y0bTQ==
X-Received: by 2002:a05:6000:2dc9:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-49c71785323mr17130102f8f.33.1794732572890;
        Sun, 15 Nov 2026 00:49:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/41] oeqa/core/decorator/depends: Check resolved dependency ids when running
Date: Sun, 15 Nov 2026 08:48:30 +0000
Message-ID: <20261115084845.701136-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250258
Content-Type: text/plain; charset="utf-8"

OETestDepends allows dependencies to be given relative to the test's
module or class and bind() resolves these to full test ids for ordering.

The runtime check compared the dependencies as written with the ids of the
passed tests though, so a test with a relative dependency was always
skipped, e.g. test_example_depends in the core example tests.

Use the resolved ids from the registry to avoid that.

Add a test which runs tests with relative dependencies.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/decorator/depends.py     |  2 +-
 meta/lib/oeqa/core/tests/test_decorators.py | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 41a324e61fb..abfb72a6152 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -95,4 +95,4 @@ class OETestDepends(OETestDiscover):
             return [registry['cases'][case_id] for case_id in registry['cases']]
 
     def setUpDecorator(self):
-        _skipTestDependency(self.case, self.depends)
+        _skipTestDependency(self.case, self.case.tc._registry['depends'][self.case.id()])
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 5095f39948d..2c668a9871d 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -112,6 +112,20 @@ class TestDependsDecorator(TestBase):
             msg = 'Expected OEQADependency exception having a circular dependency'
             self.assertTrue(result, msg=msg)
 
+    def test_depends_run(self):
+        # Dependencies given relative to the class must be found when the
+        # tests run, otherwise the dependent tests are skipped
+        tests =  ['depends.DependsTest.testDependsFirst',
+                  'depends.DependsTest.testDependsSecond',
+                  'depends.DependsTest.testDependsThird',
+                  'depends.DependsTest.testDependsFourth',
+                  'depends.DependsTest.testDependsFifth']
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        result = tc.runTests()
+        self.assertTrue(result.wasSuccessful())
+        self.assertEqual(result.skipped, [])
+        self.assertEqual(len(result.successes), len(tests))
+
 class TestTimeoutDecorator(TestBase):
     modules = ['timeout']
 
