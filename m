Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BB5AA78094
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 31 May 2017 04:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1154873197"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 31 May 2017 04:23:32 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A1C865803BE;
	Wed, 31 May 2017 04:23:30 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:17 +0300
Message-Id: <d869a9882ac75e55722728ae3a4afaf6a61de422.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/10] librsvg: Upgrade 2.40.16 -> 2.40.17
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
X-List-Received-Date: Wed, 31 May 2017 11:23:31 -0000

Small update with mostly bug fixes.

Add a desktop file for rsvg thumbnailing (it points to
gdk-pixbuf-thumbnailer so there's no binary added).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../librsvg/{librsvg_2.40.16.bb => librsvg_2.40.17.bb}             | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.16.bb => librsvg_2.40.17.bb} (84%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.17.bb
similarity index 84%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.17.bb
index 49243c8..74777e9 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.17.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "f474fe37177a2bf8050787df2046095c"
-SRC_URI[archive.sha256sum] = "d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e"
+SRC_URI[archive.md5sum] = "d6fcedf86c5c271abb36da5acc7eb987"
+SRC_URI[archive.sha256sum] = "e6f6c5cbecc405bb945c7cd15061276035ae3173bbb3bb25e8a916779c7f69cc"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
@@ -38,6 +38,7 @@ PACKAGES =+ "librsvg-gtk rsvg"
 FILES_rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \
 	      ${datadir}/themes"
-FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so"
+FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
+                     ${datadir}/thumbnailers/librsvg.thumbnailer"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
-- 
2.1.4


