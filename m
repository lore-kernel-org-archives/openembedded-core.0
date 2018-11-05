Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1557679D5D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 11:23:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so9096920wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 03:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=RR2BaKpSi2mpJjsJTPYjbT+sPa0D+rl7FRMoRRqwrkw=;
	b=2EyDs+x0otSGpfIGc6NUQs94MfiTjDrT4Ua5FAi/IxwA7QPptjWnc8tLJN53JbVriy
	m8qvMzwqO/JSQGH6qiHXEnt2818duQDgByOr8R5D5a2G1CSzqhsrDHXe4+1umzyyBbDN
	B13y7yiS1pN3IHY1PfiCrqpD49AAHdoaJMyTu9tqnu1Kel6HhtfM25WRe48wKVYzT0+n
	HcgLikdTQzOuErn32/0v/5fPbgvTyRSwjEZfzuUyq2sWdqY4Asx+UKC5T9rMi50ziFoF
	+eWM92XwRnyXFrf4hq/jQlKJsKTU0wfpDsXWcyo4YRjgbMW6pbAZKfFCAZOAiXlcB4M9
	TmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RR2BaKpSi2mpJjsJTPYjbT+sPa0D+rl7FRMoRRqwrkw=;
	b=J2WZwdPCufOtHzdBOJSBe799Zm9F7cuoPeqnXSegW5S4lHVknaTA5NNIGQgNumvVCd
	kM20El4nSwIt+sxSgazsrzt0EkYsmDDkyKziqWYtyJfRHkuOMpKVfNvDCm2iP/NkYQif
	TdS0HbKNwIOBPRxC6d0Fh3HrFRKFjJZn1tNqYdFjMcRWlCAMqpmWxOAQu8fVFX/x/8Kz
	mCwbx1ksL0IgNfvtcpr+sFntWqhHaiSDNx5RDwlnM40Vgfor34liwUPG05EJlwrrZY9J
	ygjtR3euySTKdJCwRpQTSra2k29JxwrXTL9G83DQEnoAbyYaCICQdOKxX9PU+MU1vAt+
	30TA==
X-Gm-Message-State: AGRZ1gKbJKvR8xJ3nSPTZ5gusE1G6/yZ7YxrG1tYtKwqM50XFFAQoQpj
	81LBlhAkmC1OhPSKe/yrEb9QqfKVvZM=
X-Google-Smtp-Source: AJdET5cKcj9Wlj4jQx00I29qeA9GHGZh8uhICAibKbdIRnfn81Wi/XIa+00+OX7bmBUg673snyOk0g==
X-Received: by 2002:adf:a409:: with SMTP id
	d9-v6mr18570675wra.190.1541416981362; 
	Mon, 05 Nov 2018 03:23:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b143-v6sm51668417wma.28.2018.11.05.03.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 03:23:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 11:22:58 +0000
Message-Id: <20181105112258.9149-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3: add python3-venv to the python3-modules RDEPENDS
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
X-List-Received-Date: Mon, 05 Nov 2018 11:23:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index ef7fa4ecaf8..5329bf7c579 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -721,6 +721,7 @@
             "typing",
             "unittest",
             "unixadmin",
+            "venv",
             "xml",
             "xmlrpc"
         ],
-- 
2.11.0


