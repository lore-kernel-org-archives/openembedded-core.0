Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE62607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1076033678"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 06:28:00 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A370F6A4006;
	Wed, 26 Oct 2016 06:27:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:43 +0300
Message-Id: <422f55b993bccbc521f23c7dca533057fd534c6c.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/14] adwaita-icon-theme: Upgrade 3.20 -> 3.22.0
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

Package 512x512 icons in adwaita-icon-theme-hires.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{adwaita-icon-theme_3.20.bb => adwaita-icon-theme_3.22.0.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.20.bb => adwaita-icon-theme_3.22.0.bb} (86%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb
similarity index 86%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb
index bb0eaeb..1cbc1e6 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.22.0.bb
@@ -13,8 +13,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "411be2bd68dd8b0a3c86aca2eb351ce4"
-SRC_URI[sha256sum] = "7a0a887349f340dd644032f89d81264b694c4b006bd51af1c2c368d431e7ae35"
+SRC_URI[md5sum] = "cde51d7dfcbcfa3b8cdc3e5f0df8c799"
+SRC_URI[sha256sum] = "c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
@@ -36,6 +36,7 @@ FILES_${PN}-symbolic-hires = "${prefix}/share/icons/Adwaita/96x96/*/*.symbolic.p
                               ${prefix}/share/icons/Adwaita/32x32/*/*.symbolic.png"
 FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/16x16/*/*.symbolic.png \
                         ${prefix}/share/icons/Adwaita/24x24/*/*.symbolic.png"
-FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/"
+FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/ \
+                     ${prefix}/share/icons/Adwaita/512x512/"
 FILES_${PN} = "${prefix}/share/icons/Adwaita/ \
                ${prefix}/share/pkgconfig/adwaita-icon-theme.pc"
-- 
2.1.4


