Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD9979EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:52 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id g189so1652475pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/ByBu89CD1WQqslsIlW5CjGowVCIHR0hycDOXjUy80U=;
	b=rDqKpGMJ14NjVcmb61a6eHzufi1NxuYGOuEHiRXYEe8JLRbJZ+/7guGJsnNf8ODKO1
	82nb7gbgzLaEo8YqqFtTUN4zZh5rmvgUB5Tk/A4cY3xyPxwRhjcrOCQVKuxN9eTT//0p
	jECM6YOBqhjx/nhYWRrvkNHlDhAJ0j8CkDtfpR3Tzf4ZQQGuiyM0oieK6SJk2ywzdM/a
	6NsZAswWzEjsifcoY10aqVHgD2QDH7MIfq7/y91OCDDhrSERxf9x0yI9CLNzl1AiOLhU
	xd3QpV6/dKINhXIedDZUXNmaXaK9xAQCfeklhd4e3Td9U/opRRK/DhQ4aqeBz+fc8Bx9
	lA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/ByBu89CD1WQqslsIlW5CjGowVCIHR0hycDOXjUy80U=;
	b=BqHFM6eoDUP05Dmv2dii9fOowqo+A36b2qEMpkwFPRuWY3XtnBNenRaBX3OnFK5OMq
	38FymYsBrfVOak+nWrvhH/hxhZboIqoYmOssZq6nOi6dZuRPXQKcOTyC2YRiAFAIr8kv
	MtxsqI2vZQ3YQiusOzauSBPRDChGR2DZEFxWoX2tFqFVjMtS9SdqGgxex7VwZHTUGv0V
	9HVzwx1cVPReJPx9+hTWrlwjwUFGlMrQc1S+gk6zKoe9nhqx3UzVBpKgGxvBJEjHa+AC
	eq1UKfngBnUY4dryfRvqW/qmYmfDzdBr+X1eQOaJLTdgR26trSSucp5BPUs+cju7SWWW
	leCg==
X-Gm-Message-State: AA+aEWaXwfL1q5dtLYsM0kSbxCch/3LyTv5b2SrqgFsmtqNte4PRztIb
	MkgSmQeEHFxtsM/A4jrt1b7hJj0l
X-Google-Smtp-Source: AFSGD/VrJOUo+Kw1E6V8p9KHcxEbwjNEQ0eZ9q4+9+BDwgmWXuVa7e3pNuPwBrJFCAvx3klsuDe2aA==
X-Received: by 2002:a63:dd55:: with SMTP id g21mr433227pgj.86.1544737193168;
	Thu, 13 Dec 2018 13:39:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:52 -0800
Message-Id: <235e169a159f612e060c59bbdb3182897cf1f176.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 44/45] oeqa/selftest/esdk: Fix typo causing test failure
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:52 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

2018-12-06 23:19:24,564 - oe-selftest - INFO - Traceback (most recent call last):
  File "/media/build1/poky-sumo/meta/lib/oeqa/core/case.py", line 32, in _oeSetUpClass
    clss.setUpClassMethod()
  File "/media/build1/poky-sumo/meta/lib/oeqa/selftest/cases/eSDK.py", line 78, in setUpClass
    cls.tmpdir_eSDKQA = cls.tempdirobj.name
AttributeError: type object 'oeSDKExtSelfTest' has no attribute 'tempdirobj'

(From OE-Core rev: 2c60908a2039d333a9fe2651622750ff6ed4cce1)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 1e79d1d..d7aef93 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -75,7 +75,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
         bb.utils.mkdirhier(bb_vars["WORKDIR"])
         cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
-        cls.tmpdir_eSDKQA = cls.tempdirobj.name
+        cls.tmpdir_eSDKQA = cls.tmpdirobj.name
 
         oeSDKExtSelfTest.generate_eSDK(cls.image)
 
-- 
2.7.4


