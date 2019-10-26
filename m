Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id E63967FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p21so4372195wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cZ5hnmFGJF17JWxY/gC2Hd9jAw2X4bfhIlVxuJTIkGs=;
	b=nEGxvP2hZEQjdQ2TfcRhxOeq/FVsegj+QJ1eQXkZgMeChlBxzWmEhjmJ+2X3qpt1bi
	IswGEXmBCLNC0w2bHeITxDfg4c8WJBwIfTedBmLoXLPpRgAiqpQh9kf8elQ3COUPVDoS
	CoIg5Fro47E3gQDqsJtqzEdRmwgZLr+agDM1qluADAJbMSzfkm+ktvNuxNLpvssTRSs9
	mcngziT2sz1X3dW1i5GJAVa9Pti1MIDsvU8YY2Bd8SU4XSN7Qkhhg65vXkWCF2F5raQc
	3Tw4Y11gTG8WfC6C/GYzQXZ4zkm2QN1n/oy3wujJIeR6NCQGYm0UEGfwJWhyvOnMiyqG
	p+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cZ5hnmFGJF17JWxY/gC2Hd9jAw2X4bfhIlVxuJTIkGs=;
	b=POkfmtAzVbGSY8mMzGHSMN7Xgij5nJM7Vm0Bc1z5B0rVQ5H9r2SWekdhUCPzoPBirE
	9ZO/PWfpM8427RhtYZRheqyJjzOnmMkuviYYYDOyPoJQSuLixyuNi3WwADmb+75IKt1B
	l1YEsHZNmuGxTvhBSUb0jbUtPN4BRvwR/EDHLYsbTuVBCLAAxZ33NS9ml4TNiGOaAS4e
	W0foeTii10L4XBV8tiuYOqJLh/6X25sr0fKkVKl39hM4m2JbqF2HOG2bXIgkOuOXZS90
	gbHn7lr/xVxcnf0nnx+knRp6xzawrll7S6JZvX9r0TMb9mZPnL6orZexztqE4PhLVYvx
	OnJA==
X-Gm-Message-State: APjAAAUt/D2vCDdEJ0UtaX2ARCRj15z8diAk46lmQ5G3GCJqE78P4TUW
	o/CmbgIZwrUsqTq3SPIEUgSWuX0yZ8g=
X-Google-Smtp-Source: APXvYqz8w9fPkU4YTNgjmZFoxRUsCZ9pQ1LRev0NHYAPFR1kD+ubOJ3CEPOcy6ocaEOX7T1bVb0hYw==
X-Received: by 2002:a1c:a70e:: with SMTP id q14mr6101733wme.86.1572072617574; 
	Fri, 25 Oct 2019 23:50:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:48 -0700
Message-Id: <5fae2306184023165e21a87d1cca3016ba105d5f.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 16/28] python3: -dev should depend on distutils
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:17 -0000

From: Ross Burton <ross.burton@intel.com>

python3-config uses distutils:

Traceback (most recent call last):
  File "/usr/bin/python3-config", line 9, in <module>
    from distutils import sysconfig
ModuleNotFoundError: No module named 'distutils'

Add the dependency so that distutils is always present.

[ YOCTO #13592 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 04136dbac48986dce5b2b872b2c0b46c673c44f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 1ad85a9..1eddda9 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -498,7 +498,8 @@
             "${libdir}/pkgconfig"
         ],
         "rdepends": [
-            "core"
+            "core",
+            "distutils"
         ],
         "summary": "Python development package"
     },
-- 
2.7.4


