Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QiDgw-0003s4-0F
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 00:50:34 +0200
Received: (qmail invoked by alias); 16 Jul 2011 22:46:31 -0000
Received: from p4FDF0445.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.4.69]
	by mail.gmx.net (mp022) with SMTP; 17 Jul 2011 00:46:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+JERF8kvyJkTjCZxxT9i3ZJwCFZSGGWbXqUoUSxM
	r3Tzu6GKErd+BX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jul 2011 00:48:34 +0200
Message-Id: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] gdk-pixbuf(-native): Fix build by disabling introspection
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
X-List-Received-Date: Sat, 16 Jul 2011 22:50:34 -0000

Error message was:
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-compiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
| /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
| /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
| error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir GLib-2.0
| make[4]: *** [GdkPixbuf-2.0.typelib] Error 1

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
index 8b6314f..e3f5977 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 SECTION = "libs"
 
 DEPENDS = "libpng glib-2.0 jpeg"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
            file://hardcoded_libtool.patch;patch=1 \
@@ -26,6 +26,7 @@ LIBV = "2.10.0"
 EXTRA_OECONF = "\
   --without-libtiff \
   --with-libpng \
+  --disable-introspection \
 "
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
-- 
1.7.4.4



