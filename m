Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUn-0003np-LF
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:06 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bH6n022662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0bGDd008792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bGqw001497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:16 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:16 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFao011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:15 -0500
Message-ID: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH meta-oe 1/9] schroedinger: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:06 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../schroedinger/gst-plugin-schroedinger_1.0.9.bb  |   15 +++++++++++++++
 .../schroedinger/schroedinger.inc                  |   19 +++++++++++++++++++
 .../schroedinger/schroedinger/configure.ac.patch   |   13 +++++++++++++
 .../schroedinger/schroedinger_1.0.9.bb             |   13 +++++++++++++
 4 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb
 create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
 create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
 create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb

diff --git a/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb
new file mode 100644
index 0000000..0a95646
--- /dev/null
+++ b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb
@@ -0,0 +1,15 @@
+require schroedinger.inc
+PR = "r0"
+
+DEPENDS += "gstreamer gst-plugins-base"
+
+SRC_URI[schroedingertargz.md5sum] = "d67ec48b7c506db8c8b49156bf409e60"
+SRC_URI[schroedingertargz.sha256sum] = "345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
+
+S = "${WORKDIR}/schroedinger-${PV}"
+
+PACKAGES = "gst-plugin-schroedinger gst-plugin-schroedinger-dev gst-plugin-schroedinger-dbg"
+FILES_gst-plugin-schroedinger += "${libdir}/gstreamer-0.10/libgstschro.so"
+FILES_gst-plugin-schroedinger-dev += "${libdir}/gstreamer-0.10/libgstschro.*"
+FILES_gst-plugin-schroedinger-dbg += "${libdir}/gstreamer-0.10/.debug/libgstschro.so"
+
diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
new file mode 100644
index 0000000..386fc73
--- /dev/null
+++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
@@ -0,0 +1,19 @@
+HOMEPAGE = "http://schrodinger.sourceforge.net/"
+LICENSE = "MPL GPL LGPL MIT"
+DEPENDS = "liboil orc-native orc"
+
+INC_PR = "r1"
+
+SRC_URI = "http://www.diracvideo.org/download/schroedinger/${P}.tar.gz;name=schroedingertargz"
+SRC_URI += "file://configure.ac.patch"
+
+EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
+
+inherit autotools
+
+do_configure_append () {
+        # Fix stupid libtool... handling. 
+        # rpath handling can't be disabled and the Makefile's can't be regenerated..
+        # (GNU sed required)
+        sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
+}
diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
new file mode 100644
index 0000000..ac5e7ee
--- /dev/null
+++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
@@ -0,0 +1,13 @@
+Index: schroedinger-1.0.9/configure.ac
+===================================================================
+--- schroedinger-1.0.9.orig/configure.ac
++++ schroedinger-1.0.9/configure.ac
+@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" != xyes ; then
+   AC_ERROR([orc-0.4 >= $ORC_VER is required])
+ fi
+ SCHRO_PKG_DEPS="$SCHRO_PKG_DEPS orc-0.4 >= $ORC_VER"
+-ORCC=`$PKG_CONFIG --variable=orcc orc-0.4`
++ORCC=$STAGING_DIR`$PKG_CONFIG --variable=orcc orc-0.4`
+ AC_SUBST(ORCC)
+ 
+ AC_ARG_WITH([thread],
diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
new file mode 100644
index 0000000..2994428
--- /dev/null
+++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
@@ -0,0 +1,13 @@
+require schroedinger.inc
+
+PR = "${INC_PR}.0"
+
+inherit autotools
+
+SRC_URI[schroedingertargz.md5sum] = "d67ec48b7c506db8c8b49156bf409e60"
+SRC_URI[schroedingertargz.sha256sum] = "345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
+
+PACKAGES =+ "gst-plugin-schroedinger-dbg gst-plugin-schroedinger-dev gst-plugin-schroedinger"
+FILES_gst-plugin-schroedinger = "${libdir}/gstreamer-0.10/*.so"
+FILES_gst-plugin-schroedinger-dbg = "${libdir}/gstreamer-0.10/.debug"
+FILES_gst-plugin-schroedinger-dev = "${libdir}/gstreamer-0.10/*.*a"
-- 
1.7.0.4



