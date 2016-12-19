Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC0677294
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2016 05:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="800013194"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2016 05:35:57 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3010B6A4082;
	Mon, 19 Dec 2016 05:35:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:42 +0200
Message-Id: <2e6793e4c84a0cbaac8fbaff35125f5006d0d4be.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/8] gdk-pixbuf: Upgrade 2.36.0 -> 2.36.1
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:55 -0000

New binary gdk-pixbuf-thumbnailer packaged in ${PN}-bin.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb} (92%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
similarity index 92%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
index 9efe374..cb589bb 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
@@ -19,10 +19,10 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            "
 
-SRC_URI[md5sum] = "1a3baf91956c7923dab49ee3de100ce1"
-SRC_URI[sha256sum] = "85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c"
+SRC_URI[md5sum] = "fe30b0420e013f2c4590ae6226d895d4"
+SRC_URI[sha256sum] = "9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38"
 
-inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc
+inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
 LIBV = "2.10.0"
 
@@ -48,6 +48,8 @@ ALLOW_EMPTY_${PN}-xlib = "1"
 
 FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
+FILES_${PN}-bin += "${datadir}/thumbnailers/gdk-pixbuf-thumbnailer.thumbnailer"
+
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
 	${bindir}/gdk-pixbuf-pixdata \
-- 
2.1.4


