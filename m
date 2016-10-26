Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A49F5607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1076033684"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 06:28:01 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id F227F6A4006;
	Wed, 26 Oct 2016 06:27:26 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:44 +0300
Message-Id: <f5ff88f388b7c6d5be521a4648e7b52b2ae66b8b.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] gnome-themes-standard: Upgrade 3.20.2 -> 3.22.2
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Six-monthly release.

Package the new dark variant of GTK2-Adwaita separately.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...es-standard_3.20.2.bb => gnome-themes-standard_3.22.2.bb} | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.20.2.bb => gnome-themes-standard_3.22.2.bb} (78%)

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb
similarity index 78%
rename from meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb
rename to meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb
index c98d870..2b3cc97 100644
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.20.2.bb
+++ b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.2.bb
@@ -16,8 +16,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "adc3b1d57330561fea524842d0c0b485"
-SRC_URI[sha256sum] = "9d0d9c4b2c9f9008301c3c1878ebb95859a735b7fd4a6a518802b9637e4a7915"
+SRC_URI[md5sum] = "84624dbcecab7add32672abae030314d"
+SRC_URI[sha256sum] = "b34516cd59b873c187c1897c25bac3b9ce2d30a472f1fd7ae9d7105d93e17da5"
 
 EXTRA_OECONF = "--disable-gtk3-engine"
 
@@ -31,9 +31,15 @@ do_install_append() {
 # gtk+3 and includes lots of icons (is also broken with B != S).
 PACKAGES += "gnome-theme-adwaita \
              gnome-theme-adwaita-dbg \
-             gnome-theme-adwaita-dev"
+             gnome-theme-adwaita-dev \
+             gnome-theme-adwaita-dark \
+             "
 
 FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
                               ${libdir}/gtk-2.0/2.10.0/engines/libadwaita.so"
 FILES_gnome-theme-adwaita-dev = "${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la"
 FILES_gnome-theme-adwaita-dbg = "${libdir}/gtk-2.0/2.10.0/engines/.debug/libadwaita.so"
+
+FILES_gnome-theme-adwaita-dark = "${prefix}/share/themes/Adwaita-dark"
+RDEPENDS_gnome-theme-adwaita-dark = "gnome-theme-adwaita"
+
-- 
2.1.4


