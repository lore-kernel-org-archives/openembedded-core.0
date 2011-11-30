Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVt3Z-0002DJ-0J
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:55:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 14:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42682069"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.113])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 14:48:30 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 14:48:27 -0800
Message-Id: <52b00508f2e29c90b4ea37b448d376da7ce95174.1322693022.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322693022.git.josh@linux.intel.com>
References: <cover.1322693022.git.josh@linux.intel.com>
In-Reply-To: <cover.1322693022.git.josh@linux.intel.com>
References: <cover.1322693022.git.josh@linux.intel.com>
Subject: [PATCH 1/2] gthumb: update to 2.12.4
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
X-List-Received-Date: Wed, 30 Nov 2011 22:55:13 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb}  |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb} (76%)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
similarity index 76%
rename from meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
rename to meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 7fb8a94..8367bbd 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -3,7 +3,6 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
-PR = "r1"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
@@ -12,5 +11,5 @@ inherit gnome pkgconfig
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug/ ${libdir}/gthumb/extensions/.debug/"
 
-SRC_URI[archive.md5sum] = "bfa0957a1bafc5d049292cd5fad372ce"
-SRC_URI[archive.sha256sum] = "0060c05fd372c2af2048d294ab3f75c8fb02c576d3e2004e08b7d34f49da1e66"
+SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
+SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
-- 
1.7.7.3



