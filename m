Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97F2B76A7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:40:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 06:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771742334"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 06:40:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 16:40:58 +0300
Message-Id: <9b0e41b527fd4c0a43f7ffe69bd719c422d3c6fa.1439991562.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/22] gnome-desktop3: add a recipe from meta-gnome
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
X-List-Received-Date: Wed, 19 Aug 2015 13:40:02 -0000

gnome-desktop3 is a dependency of epiphany

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gnome-desktop/gnome-desktop3_3.16.2.bb          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
new file mode 100644
index 0000000..1f2f06c
--- /dev/null
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "GNOME library for reading .desktop files"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+BPN = "gnome-desktop"
+
+inherit gnome pkgconfig
+SRC_URI[archive.md5sum] = "ab5bf4cc94ad63639f42adcc1542b1f0"
+SRC_URI[archive.sha256sum] = "3a8f196b46eb9dbd3ba2afb8fb5fef6a8825539d449a02181311242e22227bd0"
+
+DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification iso-codes"
+
+EXTRA_OECONF = "--disable-desktop-docs"
+
+PACKAGES =+ "libgnome-desktop3"
+FILES_libgnome-desktop3 = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop*/pnp.ids ${datadir}/gnome/*xml"
+
+RRECOMMENDS_libgnome-desktop3 += "gsettings-desktop-schemas"
+
-- 
2.1.4


