Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 98E4A7C92A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w17so22909218wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GYnv712MGkj8/FYo13hIUVbbe1T3ugvEtVmJ342uuwM=;
	b=pZhda3Fjt0TN0DgOXP2xLLm0Te7APoLGLlwB6QSH5ICsLs47ZSldQF56SYFJKaIkly
	689pR6CwWT8jDjyIkTM0nifFsQdF5Jr1t9Ae5kGCrtRh6whl9TciNVIMLTZmuiHfehZd
	Gd90pCPYau7298tNecEGAFM2QT4HaRp//1hzUTci4A4MKAUhDZYp3vKLH4et08H6mSld
	PTeuWd25vAn3tPNwsSmuMiZ+qFHZJpdobQKWkdJRrgH4YjsSUsV9I/v8aN9PSUOSN4jb
	/3I/TlMAkxLh5tG2BIpzZ9si7xDrjxzF4QM3h1EwB/uF3jim+FgA9rzcBGy8OnqSAd5t
	PxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GYnv712MGkj8/FYo13hIUVbbe1T3ugvEtVmJ342uuwM=;
	b=Uu66BJFywk9xOdoaSLdFxISycKxrAN2kC+/Fn+2012Z0IUDA7rHlgEEkdX6dkPnQun
	8dX1aaWHgOIb7iCbmHiciL6VpzTw25yUb2ECbSQXeXGiFp+Gmz5mWOzD7soHw1vKLT2a
	CWsua/4mx7vW3bHXD1pIOIitSqf/gcWEcdsueF//cOwLNGWkwgCflMinf2HaWQvWHZpK
	jx4604ip4OqmYtVvQMSl4P4xNk0WQAiopvByVZ5Dl6OcyLBhQSXhHQTol/zS9x/46sG9
	0BeUbhxLIzKQQiCX3U8hcRqLhRwT4dFuWlZCagjiUf9+sv72ijPuuLagcUYpOBKAKGXb
	144A==
X-Gm-Message-State: AHQUAuZY3XPWyH6zyDQcPaaWlyxYZcehYA38X9UmdbzT3D2ZnQBOaDlu
	piEkYpbL+KPLBmZxwvb7Ix3EBLbg
X-Google-Smtp-Source: AHgI3IY+GRho+x1pOSxp9/beybL3LFW2s2DAwPqoQTpTAg9hDo7/zPT+jI4gkbeEm3GtEuEdU13lWQ==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr20881747wrw.84.1550598443856; 
	Tue, 19 Feb 2019 09:47:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:55 +0100
Message-Id: <20190219174712.60694-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/20] vala: upgrade 0.42.4 -> 0.42.5
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.42.4.bb => vala_0.42.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.42.4.bb => vala_0.42.5.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.42.4.bb b/meta/recipes-devtools/vala/vala_0.42.5.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.42.4.bb
rename to meta/recipes-devtools/vala/vala_0.42.5.bb
index 49ffc41bc36..eea17661604 100644
--- a/meta/recipes-devtools/vala/vala_0.42.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.42.5.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "f34cb465a164ba7f1f2e7fea31f36d13"
-SRC_URI[sha256sum] = "b528906d080ac5b6043285a82c194c988e495c70da71ae19c1fc7811509f4f1e"
+SRC_URI[md5sum] = "d204eb4fa210995e731e2a9a01c8c772"
+SRC_URI[sha256sum] = "8c33b4abc0573d364781bbfe54a1668ed34956902e471191a31cf05dc87c6e12"
-- 
2.17.1


