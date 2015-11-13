Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9C04772E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686679"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:58 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:52 +0200
Message-Id: <de3d377d7a18802f32f90676ce92f405457022b5.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/19] gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:59 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...tk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.2.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.2.bb
index cba3815..e6c475b 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.2.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "fc59e5c8b5a4585b60623dd708df400b"
-SRC_URI[sha256sum] = "4d12726d0856a968b41802ae5c5971d7e9bac532717e309d3f81b9989da5ffbe"
+SRC_URI[md5sum] = "230fd78e42419d35ff790784b457e5f2"
+SRC_URI[sha256sum] = "5dbec561c4a00070073bf9cf4cfdd61fab4a14c8ff5b15d700bd378f8185e152"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


