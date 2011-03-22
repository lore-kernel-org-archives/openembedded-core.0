Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29lr-0005Yz-04
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q29k6-0003BU-88 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:07:58 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:07:05 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:07:56 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:32 -0700
Message-Id: <d05acd2d679d5dedda4afcced34d5716d84816c3.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:07:57.0075 (UTC)
	FILETIME=[997D8E30:01CBE8DD]
Subject: [PATCH 2/7] Various: Switch to GNOME_MIRROR
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
X-List-Received-Date: Tue, 22 Mar 2011 22:09:47 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
 .../python/python-pygobject_2.27.0.bb              |    2 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb  |    2 +-
 meta/recipes-support/libsoup/libsoup_2.2.100.bb    |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
index eace71a..6a1fb6c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
@@ -3,7 +3,7 @@ require glib.inc
 PE = "1"
 PR = "r0"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glib/2.26/glib-${PV}.tar.bz2 \
+SRC_URI = "${GNOME_MIRROR}/glib/2.26/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
index d3c8eee..4014a1b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -2,7 +2,7 @@ require glib.inc
 
 PR = "r3"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glib/2.27/glib-${PV}.tar.bz2 \
+SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.0.bb b/meta/recipes-devtools/python/python-pygobject_2.27.0.bb
index 876e8a4..62024c3 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.0.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.0.bb
@@ -9,7 +9,7 @@ PR = "r2"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "9e2496ffa4e55911f94232e29ee9f146"
 SRC_URI[sha256sum] = "7594bd86c5b92a4ba1f26927800f1b29e1ec5c246cad67aa085c279d6425b8a2"
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index d9037a2..ddc48c2 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -7,7 +7,7 @@ PR = "r1"
 ART_CONFIG = "${HOST_ARCH}/art_config.h"
 
 # can't use gnome.oeclass due to _ in filename
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
+SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
        file://${ART_CONFIG} \
        file://Makefile.am.patch;patch=1"
 
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index dcc6555..cbf085e 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Unique is a library for writing single instance application. If y
 HOMEPAGE = "http://live.gnome.org/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libunique/1.1/libunique-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index bdeb4c1..9a1f5bb 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "all"
 PR = "r3"
 RDEPENDS = "fontconfig-utils"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2" 
+SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2" 
 
 do_install () { 
         install -d ${D}${prefix}/share/fonts/ttf/ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb
index adc95f3..72d7852 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb
@@ -10,7 +10,7 @@ PR = "r0"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.32/libsoup-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libsoup/2.32/libsoup-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "894ca0077ec2d923286a69766d0b0b74"
 SRC_URI[sha256sum] = "8779da1b4d85f443f04ea8301f52c4a1943c10e4dc8d20dbcdb3652921de6b8e"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
index f48ac3d..9c65331 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "glib-2.0 gnutls libxml2"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.4/libsoup-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libsoup/2.4/libsoup-${PV}.tar.bz2"
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/libsoup/libsoup_2.2.100.bb b/meta/recipes-support/libsoup/libsoup_2.2.100.bb
index 3704bd4..cc9846a 100644
--- a/meta/recipes-support/libsoup/libsoup_2.2.100.bb
+++ b/meta/recipes-support/libsoup/libsoup_2.2.100.bb
@@ -6,7 +6,7 @@ PR = "r1"
 
 DEPENDS = "glib-2.0 gnutls libxml2"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/2.2/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/2.2/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "936e29d705aab0483b9a5b8860f68c13"
 SRC_URI[sha256sum] = "fa9f33e96a11133adbfd10538d95ed9704e582ef334c0a119a2a0bfca302877d"
-- 
1.7.0.4



