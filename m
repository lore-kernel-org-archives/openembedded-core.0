Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0397F2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b24so11185098pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=BEUFEdxl91e7z2VA7L5I+2DUqKJdfspjyXVd9KAT7Gk=;
	b=HZ3YCo+fZY88ZxHmdRvivFJLwEdrw8WYg6l+RfXvOmZBLo/hpVD214hOPq9MdLnte7
	K0b/k3v/6D6dNQBkHa9kLSB0U3nizABTrwLCgSRe74A0VHb8N+o1LHAAy3Q1Zm6wKw6W
	auaUQlZSymB/iqJYYiF1c7mD98s90dmqF143ndy7ArQvXs1NMvtbd7yHaWcvNtkDuDIT
	M93SbRmYrvrSWZFs8RNVGfYB2bBCBQ65Jor89UCYKrQ5ALjveBk5gpR120ZRtS307FcR
	hXXuRuJWuU87XVFzHbXxKjSgP8oj6ZhvKAKwDqOZtQ7ONACQV/s6ZJRRcAAuL+fDj2wo
	JL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=BEUFEdxl91e7z2VA7L5I+2DUqKJdfspjyXVd9KAT7Gk=;
	b=li8wYqJSn/WjZlmjhUKVXxfY7lZCQu2yWseeeR5exgfrT8l86VyoggGX3oPmw/Qkv7
	QQ3l1IV/wITCTHPFnvPUpCHTs9SlkDfIaHCuYo85bagrqj0F0VkJsoDEqYAc3wYZgmk4
	g6jtOizOHb1ej6Vl5dsO/U+rWRIAyp7FDITYG6IAHWUDZCGwehsDdN1Tcg1UMb0fWgP/
	4oBciCn16lyJGE+dkQYK9hNGgr+Nun3kWcxbd8KrMLCG+DGnddzm7m9HMcihKxV2gdC+
	St+na2X9zwJdl0ZAM0rZjnQwDRELcYroYX+PgsoQHOEUFXys/P6jVePiV5rwJNER+QTc
	tHvA==
X-Gm-Message-State: APjAAAXSl0m93XYi6yhH0UBKFd+MH8EjUEBywgZ7QGDQPg8bBwQQYxHu
	z3lO/R63WLbFb650S2PolY+4ogQFt//Icg==
X-Google-Smtp-Source: APXvYqz5laRBPwlzaTzgl7tIVvn7RCkJdFJACQIQv0WZLrtxP8Vo1bCyRmp7YRbXWnplvf41xVMhUg==
X-Received: by 2002:a63:6097:: with SMTP id
	u145mr29443343pgb.227.1567529870761; 
	Tue, 03 Sep 2019 09:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	s5sm96799pjo.26.2019.09.03.09.57.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:50 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-6-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 06/12] oeqa/core/tests: Skip test_fail_duplicated_module
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

At some point the modules in tests/cases/loader/invalid/ were removed,
this test relied on having tests/cases/loader/invalid/oetag.py to
trigger a ImportError in the loader module. Skip this test.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- New
---
 meta/lib/oeqa/core/tests/test_loader.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index 519ba96091..e73c91b141 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -40,6 +40,7 @@ class TestLoader(TestBase):
             result = True if expect in str(e) else False
             self.assertTrue(result, msg=msg)
 
+    @unittest.skip("invalid directory is missing oetag.py")
     def test_fail_duplicated_module(self):
         cases_path = self.cases_path
         invalid_path = os.path.join(cases_path, 'loader', 'invalid')
---
2.23.0.rc1

