Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S24Dq-00068u-CW
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 18:18:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 18:10:10 +0100
Message-Id: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] qt4.inc: depend on tiff
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
X-List-Received-Date: Mon, 27 Feb 2012 17:18:50 -0000

* Fixes the following error with qt4-embedded-4.8.0 and possibly others:

| ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-qt/qt4/qt4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ea868ff..a16a475 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
 
 require qt4_arch.inc
 QT_ARCH := "${@qt_arch(d)}"
-- 
1.7.5.4



