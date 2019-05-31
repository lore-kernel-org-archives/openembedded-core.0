Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3187E5D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 23:30:20 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 196so4855518pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D9MQzbjQBKPmDEFheqrDa9xQcuXAHr9mALjcEobhAvY=;
	b=fFUo9SJXKeAhtaMRz8VlJOHWKGUG/G3pPVvrRm4byHtqH1VV0O1s4q4/Vrl4lJ556R
	8Kf4T31hih9S5BfgzpodO8cCYDXpa9oTuTt5HNR2510H+v0/KV+wyvp038RfT1rrqDlP
	DlhWssIrZjB0Az/3tpd0CJ+KhxhXVzCzn8Id8wFY3w3Dx4xo3fFftB1rEp/StBDl/XPA
	pru8smGrwxTsvxk2iURZrG3x8ip4d6tX3lbo2TeAnPAmUv/mDtIlUk62MKeL++2b0LuU
	0iHIZ0VhjVFsg2b81a72EIFHh9HQmoCXnrorzlyXA7mxJE0osmstbpt2xEukztgNxNs3
	wKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D9MQzbjQBKPmDEFheqrDa9xQcuXAHr9mALjcEobhAvY=;
	b=R4SQ5rMJOjiGcXRP1c+QP9Plup54i5FPe+Dl1zbypnh0g+kXDlyQmHz60GenYyC4Bm
	XzloK/nrf01m7jU13iCTYaYuODBg9JCLOiOz0gIkgD7KvE8LmQW2VK3jLOLv3jvKG1Yy
	SnFKQzR8Y+Oc5VGr9KmBrfXkOPNwvtTmDk7BegszTwVEFIKpNZNCGtPdqm5sQWxpE6ZE
	sGiYmeiNliGeUmIXV9J9Q1jMMTZGPU1tYBDFqEyvMV8xcQGyK4Yq/DafTH+a6FjfCCnZ
	H1jNz8t7DURdsqTMzioKnUkjtpdGW8pwKxXZzw8shNtZyAlvmfOc9mK8JQZT+NB2Kn4c
	umyg==
X-Gm-Message-State: APjAAAVGlyDtWei6Qbkzj9TUgWe7YP6k//XqnW0+fiFm7jZDehu2ozVt
	gd0wLixq6rSLNJS6VwkR7a+RjwAm
X-Google-Smtp-Source: APXvYqwOc7Fu2LOXHNlY/jvZPgeVB/qoYPOX566wlznoVqR3Za/cxm/wNBmcjSeeMlUXsJ7a/8raWw==
X-Received: by 2002:aa7:8d85:: with SMTP id i5mr13062574pfr.242.1559345421041; 
	Fri, 31 May 2019 16:30:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id u1sm7199631pfh.85.2019.05.31.16.30.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 16:30:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 16:30:15 -0700
Message-Id: <1559345417-17830-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559345417-17830-1-git-send-email-akuster808@gmail.com>
References: <1559345417-17830-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 2/4] go-crosssdk: PN should use SDK_SYS, not TARGET_ARCH
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
X-List-Received-Date: Fri, 31 May 2019 23:30:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The crosssdk dependencies are handled using the virtual/ namespace so
this name doesn't matter in the general sense. We want to be able to provide
recipe maintainer information through overrides though, so this standardises it
with the behaviour from gcc-crosssdk and ensures the maintainer overrides work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 4391b32..94f6fb8 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,7 +1,7 @@
 inherit crosssdk
 
 DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
-PN = "go-crosssdk-${TARGET_ARCH}"
+PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
 export GOHOSTOS = "${BUILD_GOOS}"
-- 
2.7.4


