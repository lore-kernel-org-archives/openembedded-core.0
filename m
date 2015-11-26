Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85D69601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574690"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:15 +0200
Message-Id: <76d1dc566a44449c94fbac01e1742f31dc82a727.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/29] gdk-pixbuf: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
index 6e3cb02..b54fae7 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "b1590189a2e89fab9f871959c168508c"
 SRC_URI[sha256sum] = "4432b74f25538c7d6bcb3ca51adabdd666168955f25812a2568dc9637697f3bc"
 
-inherit autotools pkgconfig gettext pixbufcache ptest-gnome
+inherit autotools pkgconfig gettext pixbufcache ptest-gnome gobject-introspection
 
 LIBV = "2.10.0"
 
@@ -41,15 +41,12 @@ PACKAGECONFIG[jpeg2000] = "--with-libjasper,--without-libjasper,jasper"
 PACKAGECONFIG[gio-sniff] = "--enable-gio-sniffing,--disable-gio-sniffing,,shared-mime-info"
 PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
-EXTRA_OECONF = "--disable-introspection"
-
 PACKAGES =+ "${PN}-xlib"
 
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
-FILES_${PN} = "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
-	${libdir}/lib*.so.*"
+FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
-- 
2.6.2


