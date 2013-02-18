Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7Q12-0006mC-B2
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:40:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2013 04:22:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="264068347"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 18 Feb 2013 04:24:06 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:25:08 +0200
Message-Id: <1361190308-9747-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] gdk-pixbuf: upgrade to 2.27.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 12:40:23 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{gdk-pixbuf-2.26.5 => gdk-pixbuf-2.27.1}/configure_fix.patch  | 0
 .../extending-libinstall-dependencies.patch                       | 0
 .../hardcoded_libtool.patch                                       | 0
 .../gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.27.1.bb}     | 8 ++++----
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf-2.27.1}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf-2.27.1}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf-2.27.1}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.27.1.bb} (93%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/configure_fix.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/configure_fix.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/extending-libinstall-dependencies.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-libinstall-dependencies.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/extending-libinstall-dependencies.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_libtool.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.27.1/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.27.1.bb
similarity index 93%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.27.1.bb
index cc2ea50..252ac78 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.27.1.bb
@@ -11,16 +11,16 @@ SECTION = "libs"
 DEPENDS = "libpng glib-2.0 jpeg"
 DEPENDS_append_linuxstdbase = " virtual/libx11"
 
-SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${PV}.tar.xz \
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.27/gdk-pixbuf-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            file://extending-libinstall-dependencies.patch \
            "
 
-SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"
-SRC_URI[sha256sum] = "77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a38556d13681f5c84"
+SRC_URI[md5sum] = "8ea172466dc3ead706130981e88c219b"
+SRC_URI[sha256sum] = "028f95552203e522429e3248ff97a433c63c9a57143f10265e7ce48c2bea02b4"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools pkgconfig gettext pixbufcache
 
-- 
1.7.11.7



