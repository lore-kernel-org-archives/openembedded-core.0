Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3a-0001do-I2
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396957"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:05 -0700
Message-Id: <a7762e942200e9f1e7d43311a28d13554970900f.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/22] gdk-pixbuf: Fix QA issues and clean minor formatting
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:55 -0000

From: Andreas Mueller <schnitzeltony@gmx.de>

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
index 8b6314f..fc879ed 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -33,11 +33,14 @@ FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 
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
1.7.3.4



