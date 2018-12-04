Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96A5B6C46B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 03:15:49 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so13072968ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 19:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qBnw77OuKg8n6Y5ynPE/rbxTs149c5qH5mtCXRYUnq4=;
	b=RlxKDaoEBK31mdKKLwCnP2chngefx1A0dhh83bjr3dQvYMA66O+KRS3C7l+B3gvf+7
	pGUqWNQijMkIOki5getz0v8e6YR+ZU96L8z8mPdddEdjA5OGGNfnCNwSu1J2ypFb1W5U
	zwGAdmuUlUt+LDjoc29ezCcvaWGPexOFChOmnZUoAD6B4NP/vtBtmv7fxSfrQXZdUh2+
	Km+XfpJn+4X5e53W/gJNW5CUIHfk/krr/MgDbngwno4grcg3FW8E2DS7AuM21/lc1ZjV
	j37ff/I1ThwCJJVNxW64mAGV477SFCLFvjfByGX++G63+++Dlw/1ee7u4rCQwKiYxagF
	ce9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qBnw77OuKg8n6Y5ynPE/rbxTs149c5qH5mtCXRYUnq4=;
	b=C3si3H7Ki56ts3QupRZQAauorzmZN9pApkphznxPYjubl7VSBx+Hlz1LUDqQzOIF6j
	qh+uJL3ON/M2g0T0HeSyWWliNh2Z8qkq1S3uXdUTNjL8MJUOg+zwRVkfJgxXKsQeiv+Q
	RbXlziW7XN4yVTctzjLw6ivJmMsYldbcs5lo5bY10ORgEhULvOGPTl2IP2m/LgNsN8xz
	Xm/tHkTW7EEssXB9XKxV3v7wLVJK4HARokH6EgoOYdexHOw9wtbY8lhoOZMgqJpNu4g5
	pQbnOkBZjeBXFcKiiK7RZJ5qVngsYxbOkPtHq6m6f+44Ckjf+iJrBhvOrBVSSEAfo0Mo
	ikLA==
X-Gm-Message-State: AA+aEWY4u5RVSYwJLKZpAvVZZ+3IHTj57EY/XjU3wNwm0Cn2fURxk2tw
	Su9WfdD4arzb0UMDAjhSwPrQe7ft1IA=
X-Google-Smtp-Source: AFSGD/UvMZ3kZRnUyDGBQARqeN6zOp+SwHgDYHJyfePcv7YomOZET6jSwoFolyv75lFfWpEmcc58ig==
X-Received: by 2002:a24:2b81:: with SMTP id h123mr10943683ita.16.1543893350165;
	Mon, 03 Dec 2018 19:15:50 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 195sm4392356itm.2.2018.12.03.19.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Dec 2018 19:15:49 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 21:15:36 -0600
Message-Id: <20181204031536.24410-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] classes/icecc.bbclass: Fix ccache disable
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
X-List-Received-Date: Tue, 04 Dec 2018 03:15:49 -0000
Content-Transfer-Encoding: 8bit

The ccache disable flag was misspelled, preventing it from being
disabled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 3f04a1b63af..2b189232cb7 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -398,7 +398,7 @@ set_icecc_env() {
     # Don't let ccache find the icecream compiler links that have been created, otherwise
     # it can end up invoking icecream recursively.
     export CCACHE_PATH="$PATH"
-    export CCACHE_DISBALE="1"
+    export CCACHE_DISABLE="1"
 
     export ICECC_VERSION ICECC_CC ICECC_CXX
     export PATH="$ICE_PATH:$PATH"
-- 
2.19.1


