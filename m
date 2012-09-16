Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDK4W-0004cI-Vv
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 21:00:01 +0200
Received: by wgbdq11 with SMTP id dq11so1821258wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2012 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jbr8P+pKjgXRpGtdHmjG41skcsLELaz0/MbAwFWzW+g=;
	b=AFuhiwsgGXTSsa4rN9AgCWLQo3bzH4qHQa2jfA/uvjGFY7dhEwV1xcvLW/yYdT6UAQ
	+FSzC4a1crc8ke4HOu0iY97JpLRmzMNCaApAroAObNo/JM5nBOVnM3xCNFrHpOi6N1DZ
	yilpnoj9xuiznsXz7zmXN+ALSvHx+Eqs4Ke6FjLw+mbs1ejUiBNc6zh/CGrDL8od+axC
	fKQshKZCr/ZXdkQhoqJKEIO/PaZeaca4ua+qihpn18Lt7ym8WzJMBzzSqwIjIFEUjPYp
	/xGswwmmVmLS07X0KaO9SvTWy96Te2yxg7E0rvt0woXsDw934fqaEcC1er9mRMGhdMoB
	m+Yw==
Received: by 10.216.255.18 with SMTP id i18mr4914700wes.45.1347821242911;
	Sun, 16 Sep 2012 11:47:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm19318687wix.5.2012.09.16.11.47.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Sep 2012 11:47:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Sep 2012 20:47:26 +0200
Message-Id: <1347821246-13169-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <20120916143010.GB3628@jama.jama.net>
References: <20120916143010.GB3628@jama.jama.net>
Subject: [PATCH] recipes: bump PR to rebuild after libffi5 -> libffi6
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
X-List-Received-Date: Sun, 16 Sep 2012 19:00:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb               | 2 +-
 meta/recipes-connectivity/gypsy/gypsy_0.9.bb                  | 2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb                  | 2 +-
 meta/recipes-core/dbus/dbus-glib_0.100.bb                     | 2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb                 | 2 +-
 meta/recipes-core/glib-networking/glib-networking_2.28.7.bb   | 2 +-
 meta/recipes-devtools/python/python-dbus_1.1.1.bb             | 2 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb            | 2 +-
 meta/recipes-devtools/python/python-pygobject_2.27.91.bb      | 2 +-
 meta/recipes-devtools/python/python-pygtk_2.24.0.bb           | 2 ++
 meta/recipes-extended/polkit/polkit_0.104.bb                  | 2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb            | 2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb                       | 2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb              | 2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                        | 2 +-
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb          | 2 +-
 meta/recipes-gnome/json-glib/json-glib_0.14.2.bb              | 2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb                 | 2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb                  | 2 +-
 meta/recipes-graphics/cairo/cairo_1.12.2.bb                   | 2 +-
 meta/recipes-graphics/pango/pango_1.30.0.bb                   | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb        | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb          | 2 +-
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb  | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb    | 2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb                  | 2 +-
 meta/recipes-support/atk/atk_2.4.0.bb                         | 2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb            | 2 ++
 meta/recipes-support/vte/vte_0.28.2.bb                        | 2 +-
 32 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index e56bb1d..cff0974 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
 SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
index 9b99267..51207c9 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
@@ -14,7 +14,7 @@ SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 
 SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
index 495467e..867582d 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_git.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
 PV = "0.8+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.100.bb b/meta/recipes-core/dbus/dbus-glib_0.100.bb
index f96d04e..786cb99 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.100.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.100.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "d33959a9c0c6a158f5ac6d640316e89e"
 SRC_URI[sha256sum] = "80ddf7584a659590103817798dd95d7e451d666f385e5e95a83abf85c46d4605"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 3a075d4..10c0b61 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r5"
+PR = "r6"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index 990fb54..8c2404c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 SECTION = "libs"
 DEPENDS = "glib-2.0 gnutls intltool-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/python/python-dbus_1.1.1.bb b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
index 51d5bc2..5bf01a6 100644
--- a/meta/recipes-devtools/python/python-dbus_1.1.1.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/python/python-gst_0.10.22.bb b/meta/recipes-devtools/python/python-gst_0.10.22.bb
index 7bd6d06..8b041c3 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.22.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.22.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index d79ab2f..d08668e 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
-PR = "r4"
+PR = "r5"
 
 MAJ_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 20d54a3..4747d98 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -8,6 +8,8 @@ SRCNAME = "pygtk"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2 \
            file://fix-gtkunixprint.patch \
            file://prevent_to_get_display_during_import.patch \
diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index e548cbc..52e6618 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 
-PR = "r6"
+PR = "r7"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 99f6cb4..82a7eaa 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r6"
+PR = "r7"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 8388684..dc3520f 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,7 +9,7 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT} gobject-introspection-stub"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
-PR = "r11"
+PR = "r12"
 
 inherit gnomebase gtk-doc
 
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 1fd42b4..d822721 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r8"
+PR = "r9"
 
 inherit autotools gnome gtk-doc pkgconfig
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 529f8e1..34b78ac 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c544870..259517e 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "gtk+"
 
-PR = "r2"
+PR = "r3"
 
 PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
 
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
index 18db4e7..a4cbd51 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 0b01dc1..c8a2fac 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
 
 SECTION = "libs"
-PR = "r4"
+PR = "r5"
 DEPENDS = "zlib gdk-pixbuf gtk+"
 
 inherit autotools pkgconfig gnome gtk-doc
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6bb5fe2..12ae310 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "gtk+ libcroco cairo libxml2"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r9"
+PR = "r10"
 
 inherit autotools pkgconfig gnome gtk-doc
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.2.bb b/meta/recipes-graphics/cairo/cairo_1.12.2.bb
index c2e7cc6..f4c2d58 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
diff --git a/meta/recipes-graphics/pango/pango_1.30.0.bb b/meta/recipes-graphics/pango/pango_1.30.0.bb
index 25101f2..de562b1 100644
--- a/meta/recipes-graphics/pango/pango_1.30.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.30.0.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r0"
+PR = "r1"
 
 GNOME_COMPRESS_TYPE="xz"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 99f28e9..88fa74d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r4"
+PR = "r5"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e095b38..641de7c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r4"
+PR = "r5"
 
 inherit gettext gconf
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
index 125d09c..a9da76e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 278c20e..4ca4429 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index e39b69e..2f3728f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 4c03541..430e343 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 52ccc6f..9678713 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
index 8beb6eb..bba9a80 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
-PR = "r1"
+PR = "r2"
 
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
diff --git a/meta/recipes-support/atk/atk_2.4.0.bb b/meta/recipes-support/atk/atk_2.4.0.bb
index e2de5d6..4a2d853 100644
--- a/meta/recipes-support/atk/atk_2.4.0.bb
+++ b/meta/recipes-support/atk/atk_2.4.0.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
index c04918e..486c38b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
@@ -5,6 +5,8 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
+PR = "r1"
+
 SECTION = "x11/gnome/libs"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 2cb1871..1fe66e7 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.12



