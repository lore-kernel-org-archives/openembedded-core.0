Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+D6eav3XMgtkH3a04qhhACappfycbP5Gw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QodPO-0000En-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:30:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73FQaB6022710
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 10:26:36 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 10:26:36 -0500
Message-Id: <1312385196-14664-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] libproxy: utilize base_libdir when configured
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
X-List-Received-Date: Wed, 03 Aug 2011 15:30:58 -0000

Pass $base_libdir through when we configure to support a location other
than /lib.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-support/libproxy/libproxy_0.4.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
index b24e8ba..8d9a332 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
@@ -14,12 +14,12 @@ SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
 SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
 
-PR = "r1"
+PR = "r2"
 
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
-	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no"
+	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${base_libdir}"
 
 FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
 
-- 
1.7.3.4



