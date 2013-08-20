Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 86F686B84D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:25:38 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so315344pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ECUZkoY0ZLckSJBmn+u9axAGHCfftTHE/U8vOF4Il2Q=;
	b=Z+TPdTPTzEXZ2a97JWvlgb2Y1iu3fjePxlg0OzZ232hE6QH/8NsTUGHO3lnBvThfA4
	bibvKthLtQZCA+PWwQhX5WmycpGDKhq1ZEVwMtTlk4YwTHU16dxyWsrDDGaaJrUq0Ecq
	dttdsVIxGBVG4cgiqZb0zrrPsH3tOK52FxN/jNczTdt2QmXXSo7ZqqPZmH9QQO+6wizz
	QMYgyW0aBMSOVrGIQRIa6fKsmIqxrHLU0XG3TPnIXp/ZXNfOXgUqUiqQxsMeff2UMBDC
	uozkpZ4L5r3ng604Q4XVdVfdPcl+TVeHIf3SDwIgVy28J3mTolHNNJ03iPKbi7W6fD+Z
	JJPQ==
X-Received: by 10.68.143.38 with SMTP id sb6mr1612832pbb.44.1377001539292;
	Tue, 20 Aug 2013 05:25:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id py4sm1912174pbc.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 05:25:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 22:21:03 +1000
Message-Id: <1377001263-18778-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] xf86-video-intel: remove duplicate xf86driproto from DEPENDS
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
X-List-Received-Date: Tue, 20 Aug 2013 12:25:38 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
index 9817049..54c4d17 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
@@ -10,7 +10,7 @@ Infrastructure (DRI)."
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 DEPENDS += "virtual/libx11 drm xf86driproto glproto \
-	    virtual/libgl xineramaproto xf86driproto libpciaccess udev"
+            virtual/libgl xineramaproto libpciaccess udev"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
-- 
1.8.3.4


