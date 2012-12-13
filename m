Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjD5k-0000FX-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 19:01:05 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1173640bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 09:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Jo4InoUrZxl/sIrh1oGri2UvwQzPgS3pLvv7A+pWFrI=;
	b=mCNwWQBEEHctgPalQ+9cDLrl2XumdqOOO446Zd8ttOJzJJ7r9BFlO9v7yLyXaISIl5
	FawTb/fJ/DWe3AWi9XO0id7MSnjmpIQFpmuQH6eT2+JteC+Fe7y1mXPu5QfQzMOhIx3d
	qxSL1peC00ppeMde0jG+JSi6PtTq+79w0lmZYM/nzEcKckEJZS43I8khwZcKCCsYjLHE
	CvSeSEKKD6Gl84JiRVbNOQPrMyxIlYXRjLQ6x83D3APaLP0ylnK09b7EYbpAaJnGXdfJ
	i6ng/EMEeAac0ZHbiT79lsKrt/PC38OBG2Yyprqksu+l/n1faN7rROKBBoNHu13aRkhD
	WluQ==
Received: by 10.204.13.28 with SMTP id z28mr1408947bkz.113.1355420789698;
	Thu, 13 Dec 2012 09:46:29 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id 18sm2186301bkv.0.2012.12.13.09.46.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 09:46:28 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjCrZ-0003P0-DK; Thu, 13 Dec 2012 19:46:25 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 19:46:24 +0200
Message-Id: <1355420784-10734-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xserver-xorg: add libgcrypt dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 18:01:05 -0000

Build failed because of missing libgcrypt.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index cea4c26..7331cf6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -24,7 +24,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 inherit autotools pkgconfig
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
-LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
+LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl libgcrypt"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
-- 
1.7.10.4



