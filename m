Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD6761303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:49:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48SDc42Z4fz4M
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582717764;
	bh=BjsPuO1RY0b+LQERFOD7Zz1kV7FLJekxKkJ0isnuirw=;
	h=From:To:Subject:Date:From;
	b=Svn/UKCTMJYLx+6s1HHczXSNz65LRhJpMSqECrklJm+zv60HpV+uwqbVEeC+cEKNg
	JjVj6GZ+nXu2U2AGB50j5Tgy0h3NnIBCBKpE1vPzm76r0UNDNPaAAYDu3eEOPxCahV
	elKSVwrZ9Fu181H2L+xU1temVBjtq/SjXrctuF/DOitIogM67Kmo3DWgH1MZbpVm/h
	YpdyBZI702D7eWnoGZ9E45S5DDapAr7RiT49JTjvYACy+2TOA1hsLnaRAQ1KC298mB
	t2DObAVNaNW8jrlQPUKiySs5MDGsmKBH7TS1IfOux5lJh2l39ezDwDsiGjYPdDgmq8
	1bMrVtTpkwhoNtxA5yaZoBpRfYzeAHAIjAtJP0nl3+iNomVJflyLY+ocytkpSJqbna
	HhNUb3/doQVmjSo9DjwLbzcfGJ4q9T29+tPUX+nNPHn3V5dev4RroiXFBNk1SNqkSi
	oTVwzHE3lUZrdsrjS3IZaANP4ImVGrjKlKAZCAYrtVnuAetfriXiNuxBhzMb76oGLa
	SJZJa1SXNRw502IAFxrd0LfDw366vPvCu+BPBmo6TKXm9WHlE14udWCQEiXtjFVR3p
	XJAHLTRM0m1zDkWAp12khxuMF9pRY4ZcSiPq0SbfKn+OyR6TwOoMGICE3IN0eSWgOW
	/89BHXysHBztXNfzk8MxttaM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 13:49:23 +0200
Message-Id: <20200226114923.23580-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] webkitgtk: Remove obsolete woff2 comment
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
X-List-Received-Date: Wed, 26 Feb 2020 11:49:25 -0000

woff2 is now available in meta-webkit.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index b40699f4d1..2e923991e9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -53,7 +53,6 @@ PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
 PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
-# Source is at https://github.com/google/woff2
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
 PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 
-- 
2.17.1


