Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5B716772E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686625"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:56 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:50 +0200
Message-Id: <3e91ef478a98086a0395afa3653859a6ba72655b.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/19] gtk+3: Upgrade 3.16.6 -> 3.18.2
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:56 -0000

* Package new development tool gtk-builder-tool.
* Disable colord support (for explicitness, no functional change)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                            | 5 ++++-
 meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 22a40d8..1141b90 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -29,6 +29,7 @@ EXTRA_OECONF += " \
                  --enable-modules \
                  --disable-cups \
                  --disable-introspection \
+                 --disable-colord \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
@@ -79,7 +80,9 @@ FILES_${PN}-dev += " \
                     ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
                     ${libdir}/gtk-3.0/modules/*.la \
                     ${bindir}/gtk-builder-convert \
-                    ${bindir}/gtk-encode-symbolic-svg"
+                    ${bindir}/gtk-encode-symbolic-svg \
+                    ${bindir}/gtk-builder-tool \
+                    "
 
 FILES_${PN}-dbg += " \
                     ${libdir}/gtk-3.0/${LIBV}/loaders/.debug \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb b/meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb
index 381e607..46f0cf9 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://Do-not-try-to-initialize-GL-without-libGL.patch \
           "
 
-SRC_URI[md5sum] = "fc59e5c8b5a4585b60623dd708df400b"
-SRC_URI[sha256sum] = "4d12726d0856a968b41802ae5c5971d7e9bac532717e309d3f81b9989da5ffbe"
+SRC_URI[md5sum] = "230fd78e42419d35ff790784b457e5f2"
+SRC_URI[sha256sum] = "5dbec561c4a00070073bf9cf4cfdd61fab4a14c8ff5b15d700bd378f8185e152"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.4


