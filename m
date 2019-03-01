Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 89B627CD7A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 22:58:27 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3C16E5C0187;
	Fri,  1 Mar 2019 23:58:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1551481108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=dUD7ycr6bx+RLJxz0RJnGhSfYcZ4LucmGxl/JB3bFEo=;
	b=CrJCiHUsCJTn65nnDBb0AJ7GuoKHNb8rRxoa5AvSPeAB5M6DehKp23NN9ZKtUaXCxiEDiC
	zzuf58XvwXMBitqllAwubVaMa1Lk32ftP29Em7HossAYDyqkSw4cXdPFZGVRYzHwh2y5mc
	/aGPrBkaYZNbqo41WqSFJVb2a5Xp1n0=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 23:58:26 +0100
Message-Id: <20190301225826.62963-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>, liu.ming50@gmail.com
Subject: [PATCH] gdk-pixbuf: fix Meson variable names
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
X-List-Received-Date: Fri, 01 Mar 2019 22:58:27 -0000

From: Stefan Agner <stefan.agner@toradex.com>

With 2.38.0 gdk-pixbuf dopped the enable_ prefix from the Meson
build options.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index 3a544bd8a6..448e8ab40e 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -58,10 +58,10 @@ PACKAGECONFIG ??= "${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_linuxstdbase = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
-PACKAGECONFIG[png] = "-Denable_png=true,-Denable_png=false,libpng"
-PACKAGECONFIG[jpeg] = "-Denable_jpeg=true,-Denable_jpeg=false,jpeg"
-PACKAGECONFIG[tiff] = "-Denable_tiff=true,-Denable_tiff=false,tiff"
-PACKAGECONFIG[jpeg2000] = "-Denable_jasper=true,-Denable_jasper=false,jasper"
+PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
+PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
+PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
+PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
 
 PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
-- 
2.13.6


