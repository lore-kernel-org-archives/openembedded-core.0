Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xu-QL
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 0447B31334; Tue,  5 Jul 2011 23:51:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:11 +0100
Message-Id: <9082c82931cd31c0ad6a8a9467b6d069e1567fd8.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/17] librsvg: Clean up unpackaged files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index a47afc6..6744932 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools pkgconfig gnome
 
@@ -27,16 +27,21 @@ do_configure_prepend () {
 
 PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
 FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN}-staticdev += "${libdir}/gdk-pixbuf-2.0/*.a ${libdir}/gdk-pixbuf-2.0/*/*/*.a \
+                          ${libdir}/gtk-2.0/*.a ${libdir}/gtk-2.0/*/*/*.a"
 FILES_rsvg = "${bindir}/rsvg \
 	      ${bindir}/rsvg-view \
 	      ${bindir}/rsvg-convert \
 	      ${datadir}/pixmaps/svg-viewer.svg \
 	      ${datadir}/themes"
 FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so ${libdir}/gdk-pixbuf-2.0/*/*/*.so"
-FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.*a \
-			  ${libdir}/gtk-2.0/*/loaders/*.*a \
-			  ${libdir}/gtk-2.0/*/engines/*.*a"
-FILES_librsvg-gtk-dbg += "${libdir}/gtk-2.0/.debug \
+FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.la \
+			  ${libdir}/gtk-2.0/*/*/*.la \
+			  ${libdir}/gdk-pixbuf-2.0/*.la \
+			  ${libdir}/gdk-pixbuf-2.0/*/*/*.la"
+FILES_librsvg-gtk-dbg += "${libdir}/gdk-pixbuf-2.0/.debug \
+                          ${libdir}/gdk-pixbuf-2.0/*/*/.debug \
+                          ${libdir}/gtk-2.0/.debug \
                           ${libdir}/gtk-2.0/*/*/.debug"
 
 pkg_postinst_librsvg-gtk() {
-- 
1.7.4.1



