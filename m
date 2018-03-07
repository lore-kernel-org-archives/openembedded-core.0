Return-Path: <earwigz32@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6BD605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 05:51:51 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w22-v6so757586pll.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 21:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9hQpXctLekfSFH0hRCA5AoCyzRciVJO9YQL71ZovGoo=;
	b=sGwWMiYzJgz4BM9RIEKTGBD7uUwcUigZwzuIjeyEix3Hq0GGqJNlCx5/CjHFGgsmLb
	pFDCjJE47K2x7ofRXSTjsXZHK+xs1XJtigGyT8/bpxlBlwZK68ftE1ECR5pWHkrr5A26
	6IKyz2afSrTk4IixEPsVtUvjnbThOt377vVCW+p1RwLSEwTS+/LTWsRk70pGd/H0+BXG
	FJs4Q6uNUNd3YL+QMyS+0lOyYEmxcz7rWZJYtEjwMawv5jmqfHhzbM8n0IYm6jntGJgl
	U9C7xNafGsLevnTn95IZHA6qI8b+xLxi4WuwLeLJF3lvaUtS64Suk0oOXvVCv6gwsC8/
	tO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9hQpXctLekfSFH0hRCA5AoCyzRciVJO9YQL71ZovGoo=;
	b=Mk0fXVlXmKf9IQ/J7JBMsLMOvzlkMhD6hGNgv9FJ36Ny8RgM/OxNM/Hx3mmJRFH7VP
	+777JdJCAW5bwYqwb/ST4fii01WOBIsnJH3Tva37BbFEboYOw7trLJuYzWm1AGME/Lqm
	M1CkN4FO3fsywVCBMx2+HbFA2hVed2PKagBJ0FKXo/R9VjeRpOfSweJC4s9nXoL9qLco
	pqjXQDbJ9fy7LAHiK8vN0Jyy6Vt+K30aFpWeisOFbb438dPELJrV52zam4YoPtkZclPw
	Zq+pBJBpf2S8Vf1LiKB3AQAap7nGTYJWpGa/nr7d89KVAKHRytDPj+7iuU7bFBKXEhP4
	iO5w==
X-Gm-Message-State: APf1xPABquyczo9Z70JEadxsAdWRpRamyZfd+VztTcUPWGnlNVtnjptp
	Mh/ZJ0tSGWR+3P/tcxxmITPzTw==
X-Google-Smtp-Source: AG47ELt9DbLzLh7kngChuOsZmb2oWTFLFzJZqK2KpydS6bY9xkEg6r2rGp/AeohrRIdYHgsixZ/1Ag==
X-Received: by 2002:a17:902:341:: with SMTP id
	59-v6mr18772044pld.64.1520401912524; 
	Tue, 06 Mar 2018 21:51:52 -0800 (PST)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id
	z22sm27894786pfd.158.2018.03.06.21.51.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 21:51:51 -0800 (PST)
From: youngseokyoon <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 14:49:17 +0900
Message-Id: <1520401757-31207-1-git-send-email-earwigz32@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpng: Upgrade 1.6.32 -> 1.6.34
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
X-List-Received-Date: Wed, 07 Mar 2018 05:51:51 -0000

License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseokyoon <earwigz32@gmail.com>
---
 .../libpng/{libpng_1.6.32.bb => libpng_1.6.34.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.32.bb => libpng_1.6.34.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.32.bb b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.32.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.34.bb
index d93e72c..88ea586 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=53f2df0e62ce82307cd1389a9f41e4cf \
-                    file://png.h;endline=144;md5=591cf1f8d84a757af46e43c2b9b5ddd9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2db717a05a20e36f2fa673265bd31568 \
+                    file://png.h;endline=144;md5=3ac9fd250a8786ae581e34254bf79429"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "e01be057a9369183c959b793a685ad15"
-SRC_URI[sha256sum] = "c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b"
+SRC_URI[md5sum] = "c05b6ca7190a5e387b78657dbe5536b2"
+SRC_URI[sha256sum] = "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.7.4


