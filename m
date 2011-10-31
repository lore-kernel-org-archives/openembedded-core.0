Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvyL-00026x-Kd
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:48:35 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6404690faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3/iJglRyaMXz3xPDmMh9iEOTH4giOZ8SyztrZScnxg0=;
	b=b6h5o2JbVHKnneez2+SArmmMa2smwcHSBHjK1SWZXr1B88whUCe0iM45Qhna0+Kn2+
	aWEmTR753anTa2USnFR8Fo8+F6iA1vqX7cOKE+JIf62F/pTmXmN04/UJKOhS0q/o1YlH
	420lFJRYxy/sEnceRM6zaxk/qNzoLqivXpDS4=
Received: by 10.223.85.139 with SMTP id o11mr30808637fal.0.1320082950649;
	Mon, 31 Oct 2011 10:42:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a26sm24469886fac.2.2011.10.31.10.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:42:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:48 +0100
Message-Id: <669b20b5af9c663f8f8bc4017511d60638f86088.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
References: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
Subject: [oe-core 5/7] recipes: bump PR after python upgrade
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
X-List-Received-Date: Mon, 31 Oct 2011 17:48:36 -0000

* PR bumps to rebuild stuff which is in /usr/lib/python2.6

* It's good to check that sysroots like this are empty after build:
  sysroots/om-gta02/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la
  sysroots/x86_64-linux/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../bluez/gst-plugin-bluetooth_4.96.bb             |    2 ++
 .../telepathy/telepathy-python_0.15.19.bb          |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 .../python/python-argparse_1.2.1.bb                |    1 +
 meta/recipes-devtools/python/python-dbus_0.84.0.bb |    2 +-
 meta/recipes-devtools/python/python-gst_0.10.21.bb |    2 +-
 .../python/python-imaging_1.1.7.bb                 |    2 +-
 .../python/python-pycairo_1.8.10.bb                |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 .../recipes-devtools/python/python-pygtk_2.17.0.bb |    2 +-
 .../python/python-pyrex-native_0.9.9.bb            |    2 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 .../python/python-scons-native_2.1.0.bb            |    2 +-
 meta/recipes-devtools/python/python-scons_2.1.0.bb |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    2 ++
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 .../gstreamer/gstreamer_0.10.35.bb                 |    2 ++
 meta/recipes-support/atk/atk_2.2.0.bb              |    1 +
 26 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
index a137b12..d60827a 100644
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
@@ -1,6 +1,8 @@
 require bluez4.inc
 require recipes-multimedia/gstreamer/gst-plugins-package.inc
 
+PR = "r1"
+
 DEPENDS = "bluez4 gst-plugins-base"
 
 EXTRA_OECONF = "\
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 817b911..0113854 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://parallel_make.patch \
            file://remove_duplicate_install.patch"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 74860af..71001a0 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
index a74c533..76d89a1 100644
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -3,6 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
 SRCNAME = argparse
+PR = "r1"
 
 SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
diff --git a/meta/recipes-devtools/python/python-dbus_0.84.0.bb b/meta/recipes-devtools/python/python-dbus_0.84.0.bb
index fff8649..db2d7de 100644
--- a/meta/recipes-devtools/python/python-dbus_0.84.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_0.84.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/python/python-gst_0.10.21.bb b/meta/recipes-devtools/python/python-gst_0.10.21.bb
index 888002c..e1b7cc8 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.21.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.21.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index b024646..fc568b5 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489
 DEPENDS = "freetype jpeg tiff"
 RDEPENDS_${PN} = "python-lang python-stringold"
 SRCNAME = "Imaging"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://path.patch"
diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
index b76724e..02ec353 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1 & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421"
 # cairo >= 1.8.8
 DEPENDS = "cairo"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
index 9bd4f50..d9fe465 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;endline=13;md5=fbfe545b1869617123a08c0983ef17b
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
 SRCNAME = "pycurl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
   http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index fd696a5..da4faec 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
-PR = "r2"
+PR = "r3"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
diff --git a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb b/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
index f56e1fe..603ec5b 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
@@ -7,7 +7,7 @@ PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-PR = "ml9"
+PR = "ml10"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.17/${SRCNAME}-${PV}.tar.bz2 \
            file://fix-gtkunixprint.patch \
diff --git a/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
index 8276354..dcfc3f5 100644
--- a/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
@@ -2,4 +2,4 @@ require python-pyrex_${PV}.bb
 inherit native
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r1"
+PR = "r2"
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 1a54051..330f856 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
 SRCNAME = "Pyrex"
-PR = "ml0"
+PR = "ml1"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/python/python-scons-native_2.1.0.bb b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
index 083ad15..ff94cf6 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
@@ -2,4 +2,4 @@ require python-scons_${PV}.bb
 inherit native
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-devtools/python/python-scons_2.1.0.bb b/meta/recipes-devtools/python/python-scons_2.1.0.bb
index 22df333..f0b5b1f 100644
--- a/meta/recipes-devtools/python/python-scons_2.1.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"
 SRCNAME = "scons"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 75bce3f..5dd5f31 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -5,7 +5,7 @@ LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
 
 SRCNAME = "setuptools"
-PR = "ml2"
+PR = "ml3"
 DEPENDS += "python"
 DEPENDS_virtclass-native += "python-native"
 
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
index 6c8577d..53ed739 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = ""
-PR ="r0"
+PR ="r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 9e3d4c4..1681db7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://xsltproc_nonet.patch \
 	    file://use-usr-bin-env-for-python-in-xml2po.patch \
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index 118bf74..3b4acd9 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.12/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index 47a4660..371eda3 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.16/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
index c017f99..01f4a11 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
+PR = "r1"
+
 SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
 SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
 
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 2cbd372..d7af871 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://no-tests.patch"
 SRC_URI += "file://noconst.patch"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
index 9d35596..7ac7ad5 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
 SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xcb/xcb-proto_git.bb
index 4358fee..1813d65 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_git.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_git.bb
@@ -3,7 +3,7 @@ DEFAULT_PREFERENCE = "-1"
 include xcb-proto.inc
 SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 PV = "1.2+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto;protocol=git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
index 50916e5..650c708 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
+PR = "r1"
+
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
            file://gst-inspect-check-error.patch"
diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.2.0.bb
index e0c67a9..0d657b5 100644
--- a/meta/recipes-support/atk/atk_2.2.0.bb
+++ b/meta/recipes-support/atk/atk_2.2.0.bb
@@ -1,5 +1,6 @@
 require atk.inc
 
+PR = "r1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-- 
1.7.7.1



