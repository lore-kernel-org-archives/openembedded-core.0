Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 029E078725
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 12:57:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 04:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="1252099895"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2017 04:57:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:57:41 +0200
Message-Id: <fb0d49a9957510576d76d45afce9bce93c623608.1512478515.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
References: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/13] gobject-introspection: update to 1.54.1
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
X-List-Received-Date: Tue, 05 Dec 2017 12:57:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ect-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
index 3fe71a3896c..156dac7ca78 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.52/${BPN}-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.54/${BPN}-${PV}.tar.xz \
            file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
            file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            "
-SRC_URI[md5sum] = "34157073991f9eeb0ed953351b65eb61"
-SRC_URI[sha256sum] = "2ed0c38d52fe1aa6fc4def0c868fe481cb87b532fc694756b26d6cfab29faff4"
+SRC_URI[md5sum] = "126c29e4d54adbed2ed4e2b04483de41"
+SRC_URI[sha256sum] = "b88ded5e5f064ab58a93aadecd6d58db2ec9d970648534c63807d4f9a7bb877e"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
@@ -132,6 +132,7 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
 # .gir files go to dev package, as they're needed for developing (but not for running)
 # things that depends on introspection.
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
 
 # These are used by gobject-based packages
 # to generate transient introspection binaries
-- 
2.15.0


