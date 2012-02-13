Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rwy9g-00071u-2s
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 16:49:28 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1514696eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0NptwZA+9QP0BNCldYGrwmeTbY3YR0LuwRMY13AvjUo=;
	b=jJ5Sijr9oiM4DEBZcho9ZnNNai4Ed8+w4qIGxYDp3M4WJ6ziWSH8ToXAEuyh3js9u/
	bRcSWU9/C08UKG+YH4YrFk8M2cK+GmsWSekqrNen2V+Jy2KiDDDqPIfXDMAYdRdIiLVO
	bmcLgYKrAZeWPEQEZHQ3h0XkOELVyX6PyUoVk=
Received: by 10.213.108.212 with SMTP id g20mr2690575ebp.122.1329147680765;
	Mon, 13 Feb 2012 07:41:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm62232472eei.3.2012.02.13.07.41.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:41:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:40:49 +0100
Message-Id: <4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Mon, 13 Feb 2012 15:49:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |    2 +-
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |    2 +-
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |    2 +-
 .../telepathy/libtelepathy_0.3.3.bb                |    2 +-
 .../telepathy/telepathy-glib_0.17.4.bb             |    2 +-
 .../telepathy/telepathy-mission-control_5.10.1.bb  |    2 +-
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
 .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-devtools/file/file_5.10.bb            |    2 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb |    2 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 .../subversion/subversion_1.7.2.bb                 |    2 ++
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    2 +-
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 ++
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 meta/recipes-gnome/json-glib/json-glib_0.14.2.bb   |    2 ++
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    2 +-
 .../menu-cache/menu-cache_0.3.2.bb                 |    2 +-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb   |    2 +-
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    2 +-
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    2 +-
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    2 +-
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    2 +-
 .../gstreamer/gstreamer_0.10.35.bb                 |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libpng/libpng_1.2.46.bb    |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |    2 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
 .../sato-screenshot/sato-screenshot_git.bb         |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
 meta/recipes-support/curl/curl_7.23.1.bb           |    2 +-
 meta/recipes-support/gnutls/gnutls_2.12.16.bb      |    2 +-
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    2 +-
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    2 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 58 files changed, 61 insertions(+), 55 deletions(-)

diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index 310d8a9..dcc40b8 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -18,7 +18,7 @@ FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
 
 EXTRA_OECONF = "--disable-introspection"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
 SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea" 
diff --git a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
index ce9ca30..ae96eda 100644
--- a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "gupnp"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
index fd2eb38..8460c16 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
 SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = "--disable-introspection"
 
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index e063f89..a7c6667 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
            file://prefer_python_2.5.patch \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
index 1ad91b2..64473df 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
index f7ce736..9be4543 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bb b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
index 0b958f7..75f56de 100644
--- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
+++ b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/~david/eggdbus"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/eggdbus/eggdbus.h;md5=6b312aef57ed8d738b3f131ad037d6c2"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "dbus glib-2.0 dbus-glib eggdbus-native"
 DEPENDS_virtclass-native = "dbus-native glib-2.0-native dbus-glib-native"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index 4bb38a7..111f9a4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index 521c925..1ae34c0 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 SECTION = "libs"
 DEPENDS = "glib-2.0 gnutls"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 8ec69fb..1de73da 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://fix_version_info.patch"
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index f9827d3..8b058fe 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r4"
+PR = "r5"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-devtools/file/file_5.10.bb b/meta/recipes-devtools/file/file_5.10.bb
index 1bf1b61..db247a7 100644
--- a/meta/recipes-devtools/file/file_5.10.bb
+++ b/meta/recipes-devtools/file/file_5.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_virtclass-native = "zlib-native"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://fix_version_check.patch \
diff --git a/meta/recipes-devtools/python/python-gst_0.10.22.bb b/meta/recipes-devtools/python/python-gst_0.10.22.bb
index baadd41..7bd6d06 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.22.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.22.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index efc06b4..d79ab2f 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
-PR = "r3"
+PR = "r4"
 
 MAJ_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 83ee890..2c26d9a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r29"
+PR = "r30"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index 23e2132..a8d4f22 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
+PR = "r1"
+
 # negative, because of new checkout format in 1.7.0 
 # and distro PREMIRRORs need to be in sync with users
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
index 05eda85..31f808d 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "zlib"
-PR ="r2"
+PR ="r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index c2c101b..283f477 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index d53dda8..2737a4a 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
 SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r1"
+PR = "r2"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 458b0fc..121babd 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
 SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index a12cb9b..ccbc24e 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,7 +9,7 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r7"
+PR = "r8"
 
 inherit gnomebase
 
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 8fb7c7a..1a5ee05 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r5"
+PR = "r6"
 
 inherit autotools gnome pkgconfig
 
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 8367bbd..19a6b31 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
+PR = "r1"
+
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
 inherit gnome pkgconfig
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 8dfcc32..dab66c7 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index f15cf2e..7635e7a 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SRCREV = "1161"
 PV = "2.11.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;proto=http \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
index bdc9dfb..18db4e7 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
@@ -8,6 +8,8 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
+PR = "r1"
+
 DEPENDS = "glib-2.0"
 
 SRC_URI[archive.md5sum] = "5716a181a2b85268f53a1fb0c8024c4a"
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 632d7f7..747b4ed 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
 
 SECTION = "libs"
-PR = "r2"
+PR = "r3"
 DEPENDS = "zlib gdk-pixbuf gtk+ gtk-doc-native"
 
 inherit autotools pkgconfig gnome
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index c1d5e3b..faefecd 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index 71b4551..7061cf6 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "glib-2.0 gtk+ dbus"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index a74a2cc..206b026 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
index 2ce5952..2fcd1b0 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
@@ -1,6 +1,6 @@
 require libmatchbox.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://16bppfixes.patch \
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
index 87f9826..b8f9d97 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
@@ -16,6 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz"
 SRC_URI[md5sum] = "ac4a9ea77db68d3db3f9f53cc75af66a"
 SRC_URI[sha256sum] = "6b7c1627b5102d8301a8a3e845f673a7181a71dde32f6455abf22d03e392b89f"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
index c489f39..252fd22 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 
 DEPENDS += "zlib xproto font-util"
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
index 3e44fc8..55d4e69 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc zlib"
 PROVIDES = "xfont"
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 XORG_PN = "libXfont"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index 56c54b5..b99d453 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index e49a00c..6dfc26e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -13,7 +13,7 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
 SRC_URI[md5sum] = "1d300983525f4f09030eb3ba47cb04b0"
 SRC_URI[sha256sum] = "cd24f01bb5258a1f400bc4f2c212bb7cee9ee23c9ffb80d537a24ef366d17103"
 
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index a3dffa0..ebd49ab 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r4"
+PR = "r5"
 
 inherit gettext gconf
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
index 72a8151..7f87cd3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
index b58f34d..8d3bc75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index c5d53e6..dbcf2da 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
index a917691..142f2b9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
                     file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
 DEPENDS = "zlib"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
diff --git a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
index ae8df15..bf0a387 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
index edd3e0e..6a0b0b8 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 0405a02..74da2ef 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index 224b6e1..d6685f5 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRCREV = "e4a29fbb7648f12fb3aefd8ea0120c3f54ba392a"
 PV = "0.3.3+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 97b40d4..74d8757 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 0514164..12e4392 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index f1a4f88..4413d38 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -14,7 +14,7 @@ RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
 
 SRCREV = "1379fd230a32509e94971961183f1031f469737a"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 5e51d3d..8a113b3 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "matchbox-panel-2"
 SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
            file://fix_ldadd_order.patch"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index e279ca3..9181c2c 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -15,7 +15,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
diff --git a/meta/recipes-support/curl/curl_7.23.1.bb b/meta/recipes-support/curl/curl_7.23.1.bb
index 9772465..db1ca81 100644
--- a/meta/recipes-support/curl/curl_7.23.1.bb
+++ b/meta/recipes-support/curl/curl_7.23.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.16.bb b/meta/recipes-support/gnutls/gnutls_2.12.16.bb
index 3c9b809..38cc98f 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.16.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.16.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.3.bb b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
index 0addd64..74c2cbb 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.3.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_0.1.17.bb
index efc1024..adf8e64 100644
--- a/meta/recipes-support/libfm/libfm_0.1.17.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.17.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "gtk+ menu-cache intltool-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz"
 
diff --git a/meta/recipes-support/libsoup/libsoup_2.2.105.bb b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
index d251e94..697caaa 100644
--- a/meta/recipes-support/libsoup/libsoup_2.2.105.bb
+++ b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An HTTP library implementation in C"
 SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "glib-2.0 gnutls libxml2"
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 09e90dc..f3e806d 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.29.6.bb
index ed62181..170a47c 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r1"
+PR = "r2"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 33f71b5..507e272 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.8.4



