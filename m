Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LBA-0000gN-H4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:38:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Mar 2012 17:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119573520"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:29:11 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:01 +0800
Message-Id: <cd88e0bc3c689f07109e8e68bf07fcdd332cc66f.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 04/60] gdk-pixbuf: upgrade to 2.24.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:38:00 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../configure_fix.patch                            |    0
 .../configure_nm.patch                             |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} |   10 +++++-----
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_nm.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} (92%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
similarity index 92%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index cbeca94..30b3fcf 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -10,16 +10,16 @@ SECTION = "libs"
 
 DEPENDS = "libpng glib-2.0 jpeg"
 
-SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.bz2 \
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.xz \
            file://configure_nm.patch \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            "
 
-SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
-SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
+SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
+#SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r5"
+PR = "r0"
 
 inherit autotools pkgconfig gettext
 
@@ -74,7 +74,7 @@ do_install_append_virtclass-native() {
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-csource \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-		
+
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 }
-- 
1.7.6



