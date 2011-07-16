Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QiEPm-0004ha-Fk
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 01:36:54 +0200
Received: (qmail invoked by alias); 16 Jul 2011 23:32:51 -0000
Received: from p4FDF0445.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.4.69]
	by mail.gmx.net (mp004) with SMTP; 17 Jul 2011 01:32:51 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/3JthTHjr35tJzdP0B3NxVZ/owGIgwg1av14a15Y
	Uo2ifSVW0WZpUc
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jul 2011 01:34:56 +0200
Message-Id: <1310859296-18797-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] gdk-pixbuf: Fix QA issues and clean minor formatting
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
X-List-Received-Date: Sat, 16 Jul 2011 23:36:54 -0000

QA warnings fixed:
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-png.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-wbmp.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xbm.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ras.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-tga.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-bmp.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ani.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-pnm.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-icns.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-pcx.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ico.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-gif.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-qtif.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xpm.la
WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.la

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
index e3f5977..e3e1819 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -34,11 +34,14 @@ FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
-	${includedir}/*"
+	${includedir}/* \
+	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
+"
 
 FILES_${PN}-dbg += " \
         ${libdir}/.debug/* \
-	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/*"
+	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
+"
 
 postinst_pixbufloader () {
 if [ "x$D" != "x" ]; then
-- 
1.7.4.4



