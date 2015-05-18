Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2C1A72207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:58:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2015 06:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="495065462"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2015 06:58:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:58:38 +0300
Message-Id: <1431957520-14510-5-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/6] qt4: disable Phonon framework
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
X-List-Received-Date: Mon, 18 May 2015 13:58:27 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This allows removal of gstreamer 0.10 dependency from Qt4 recipe

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 09f6d93..6d67994 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff icu"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 sqlite3 tiff icu"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
 require qt4_arch.inc
@@ -16,7 +16,7 @@ QT_GLFLAGS ?= ""
 QT_QT3SUPPORT ?= "-qt3support"
 QT_XML ?= "-xmlpatterns"
 QT_WEBKIT ?= "-webkit"
-QT_PHONON ?= "-phonon"
+QT_PHONON ?= "-no-phonon"
 QT_DBUS ?= "-qdbus"
 QT_MULTIMEDIA ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', '-pulseaudio', '-no-pulseaudio', d)}"
  
-- 
2.1.4


