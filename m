Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB367F2E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:55 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t11so2057537plo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=p6YurIwcDimlq+YWdlgzbmktt301II7siC40Vd0rqD0=;
	b=jjQ5WL9xkED+gJ6enN2RSWzUCIGoihk5P+ZZnns60qq5PjR1EJykmNr9S+KcL3uPhz
	mKN1/R75nLdEBKDzO5HSekq+um25FHtOzuGgKkKP7KPrtyIYgJ0Ge6lovvfBD/hEvGMD
	Gz4GQ4YuixHKDoaTTvt8qtQhs/RXfW0/LJA+hE5CBrclY4sIIIFLsf9345S9jdtIf3yT
	w93O2JWMgv5lNHyNsAvspLoEkvgyQyGEKjYW7uZMeClwCRfWUj9CJP6m7GSjpaQgKrkL
	LNTJ7QrnLQgVVqoqzWOmLgv9kUq6IucSfFdFycL+oLdc5Z0lH6VQT7Ycf/4OGDeRNXjI
	Ib9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=p6YurIwcDimlq+YWdlgzbmktt301II7siC40Vd0rqD0=;
	b=YKjXcsUjNfpfInUtms+VzmJjWNYbCBKokxNkT3hlf92ZaDANe8l3hGPTYWlnvrxo7z
	SbajZmAAyUD8k+1q2qOAulFf7LLocPDhqKyM8vQOoduNnFJqZHTfLg42WWAZABZAksnV
	VMpQ5uWM/kGBrdmTJhpVl55cPqDmpqsFiPvLddNnnml6wBX55FZxlayCHYTZJ2cIf9XA
	5MJ3Tfu+XNWjlbJ6Dky9f5+E15Lm3w0QYbronKj2O4DLRl34Wstvsq4VTpBZ68zaxip5
	yDQcLU86KMyjomo7Dl0tzqDiRjkuyPKus++kQaXIdkdM3bYr6o+tG9KQz5SskgqREyuj
	pX1w==
X-Gm-Message-State: APjAAAWK8qCeEUpAhVr3n4Lqs0aIfPaRESxSdgCAW3Liiw+y6db/x/Ne
	K/x6beiMuH28fwQVV3gHYQmmzEqnVGXHew==
X-Google-Smtp-Source: APXvYqysZM2VTS9lECcgF97fjdAqTZRCezqysCN13bS95kYhABVZR1K9sX2dysz49jMvLQxO7SDnnw==
X-Received: by 2002:a17:902:a01:: with SMTP id
	1mr37186211plo.278.1567529875826; 
	Tue, 03 Sep 2019 09:57:55 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	w20sm24945849pfn.72.2019.09.03.09.57.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:55 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-7-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 07/12] oeqa/core/tests: Fix test_data module tests
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

These two tests relied on the context containing the results information.
This was moved into the OETestResults class.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- New
---
 meta/lib/oeqa/core/tests/test_data.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index 50811bb381..ac74098b78 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -22,8 +22,9 @@ class TestData(TestBase):
         expectedException = "oeqa.core.exception.OEQAMissingVariable"
 
         tc = self._testLoader(modules=self.modules)
-        self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc.errors:
+        results = tc.runTests()
+        self.assertFalse(results.wasSuccessful())
+        for test, data in results.errors:
             expect = False
             if expectedException in data:
                 expect = True
@@ -35,8 +36,9 @@ class TestData(TestBase):
         d = {'IMAGE' : 'core-image-sato', 'ARCH' : 'arm'}
 
         tc = self._testLoader(d=d, modules=self.modules)
-        self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc.failures:
+        results = tc.runTests()
+        self.assertFalse(results.wasSuccessful())
+        for test, data in results.failures:
             expect = False
             if expectedError in data:
                 expect = True
---
2.23.0.rc1

