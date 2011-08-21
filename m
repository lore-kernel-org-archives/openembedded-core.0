Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QvHBp-0002Ck-TI
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 01:12:26 +0200
Received: by mail-iy0-f171.google.com with SMTP id 13so9620198iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 16:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=exgDqy1+M1Komo2sKv9bnPPYSDpF27z7Sn4xzkFQqo0=;
	b=CSBmk2rOIMAPIOr7pr/arB0FDqSlZfl6HEe8B9gvBiG9uYyhb0AIYj7EkB5v1Z5HeN
	1aWeRqtKuHlyh/sakfoEVqBBlUirkLGqHXMRzR+/0zm9Wgw8dLebX6A5HjmWqESOQsTJ
	hEpsnAbvAvHx2YyAl3Zxh1QYO1/MV7vrQ+vZQ=
Received: by 10.231.82.14 with SMTP id z14mr4270610ibk.63.1313968063755;
	Sun, 21 Aug 2011 16:07:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p11sm3041777ibf.13.2011.08.21.16.07.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Aug 2011 16:07:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Aug 2011 16:07:19 -0700
Message-Id: <5b9ccd818b190262fac3e8ea29d63a912712b154.1313967536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <e4bac3e750c5562d3ef77e3cba4b02734a566b37.1313967536.git.raj.khem@gmail.com>
References: <e4bac3e750c5562d3ef77e3cba4b02734a566b37.1313967536.git.raj.khem@gmail.com>
In-Reply-To: <cover.1313967536.git.raj.khem@gmail.com>
References: <cover.1313967536.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] recipes: Delete patch=1, its default and replace pnum with striplevel
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
X-List-Received-Date: Sun, 21 Aug 2011 23:12:26 -0000

Some place pnum=1 is used which is removed as well since
striplevel=1 is default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    4 +-
 meta/recipes-bsp/hostap/hostap-utils.inc           |    2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +-
 meta/recipes-connectivity/gsm/gsmd.inc             |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +-
 meta/recipes-connectivity/portmap/portmap.inc      |    2 +-
 .../telepathy/libtelepathy_0.3.3.bb                |    4 +-
 meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb |    2 +-
 .../console-tools/console-tools_0.3.2.bb           |   10 ++--
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 ++--
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    2 +-
 .../binutils/binutils_csl-arm-2008q1.bb            |   14 +++---
 .../dosfstools/dosfstools-native_2.10.bb           |   16 +++---
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |    8 ++--
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    6 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    8 ++--
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    8 ++--
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |    4 +-
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   46 ++++++++++----------
 meta/recipes-devtools/gdb/gdb-cross_7.3.bb         |    2 +-
 meta/recipes-devtools/m4/m4_1.4.16.bb              |    2 +-
 meta/recipes-devtools/make/make.inc                |    2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |    6 +-
 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |    2 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    6 +-
 meta/recipes-devtools/patch/patch_2.5.9.bb         |    8 ++--
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 .../subversion/subversion_1.6.15.bb                |    6 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    4 +-
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |    4 +-
 meta/recipes-extended/man/man_1.6f.bb              |   42 +++++++++---------
 meta/recipes-extended/minicom/minicom_2.4.bb       |    2 +-
 meta/recipes-extended/psmisc/psmisc.inc            |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   10 ++--
 meta/recipes-extended/time/time_1.7.bb             |    6 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    4 +-
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |    4 +-
 .../gnome/gobject-introspection_git.bb             |    6 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |   34 +++++++-------
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   32 +++++++-------
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |   32 +++++++-------
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |   12 +++---
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    6 +-
 .../libmatchbox/libmatchbox_git.bb                 |    6 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb      |    4 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    4 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |   10 ++--
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    4 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |    4 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |    6 +-
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |    6 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb   |    2 +-
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   28 ++++++------
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |    4 +-
 meta/recipes-kernel/oprofile/oprofile_cvs.bb       |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    2 +-
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    4 +-
 meta/recipes-multimedia/lame/lame_3.98.4.bb        |    2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.8.2.bb      |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    4 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |   10 ++--
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    4 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../matchbox-stroke/matchbox-stroke_git.bb         |    4 +-
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    4 +-
 meta/recipes-support/libpcre/libpcre_8.12.bb       |    2 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    4 +-
 96 files changed, 289 insertions(+), 289 deletions(-)

diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index 9678814..b721bb5 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -12,8 +12,8 @@ PR = "r4"
 RDEPENDS_${PN} = "pm-utils"
 
 SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git;protocol=git \
-	   file://remove-doc-check.patch;patch=1 \
-	   file://powerbtn.patch;patch=1 \
+	   file://remove-doc-check.patch \
+	   file://powerbtn.patch \
 	   file://policy-funcs "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/hostap/hostap-utils.inc
index 90f2c6a..89d977a 100644
--- a/meta/recipes-bsp/hostap/hostap-utils.inc
+++ b/meta/recipes-bsp/hostap/hostap-utils.inc
@@ -10,7 +10,7 @@ SECTION = "kernel/userland"
 PR = "r4"
 
 SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
-	   file://hostap-fw-load.patch;patch=1"
+	   file://hostap-fw-load.patch"
 S = "${WORKDIR}/hostap-utils-${PV}"
 
 BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug \
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index b182864..7c5095d 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
 PR = "r2"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
-	   file://makefile-fix.patch;patch=1 "
+	   file://makefile-fix.patch "
 
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index bfd03cc..414f2f4 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -13,9 +13,9 @@ DEPENDS = ""
 PR = "r3"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
-	   file://autotools.patch;patch=1 \
-	   file://makefile.patch;patch=1 \
-	   file://gettext.patch;patch=1"
+	   file://autotools.patch \
+	   file://makefile.patch \
+	   file://gettext.patch"
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index a4203ec..f5aba54 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 DEPENDS = 	"dbus glib-2.0 dbus-glib"
 
 SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${PV}.tar.gz \
-                 file://mkdir.patch;patch=1 \
-                 file://pkgconfig.patch;patch=1 "
+                 file://mkdir.patch \
+                 file://pkgconfig.patch "
 
 SRC_URI[md5sum] = "7ec92f2ecba1309ac4b71b4b4d8d0a0d"
 SRC_URI[sha256sum] = "9b7c9845e2f661dbf5c2595e67bc7afd48f090ac2c033726c89d7f0e90791dfa"
diff --git a/meta/recipes-connectivity/gsm/gsmd.inc b/meta/recipes-connectivity/gsm/gsmd.inc
index 682456b..a968518 100644
--- a/meta/recipes-connectivity/gsm/gsmd.inc
+++ b/meta/recipes-connectivity/gsm/gsmd.inc
@@ -13,7 +13,7 @@ PV = "0.1+svnr${SRCPV}"
 PR = "r2"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
-           file://fix_machine_init.patch;patch=1 \
+           file://fix_machine_init.patch \
            file://gsmd \
            file://default"
 S = "${WORKDIR}/gsm"
diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
index 6abe96e..b123e11 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
 
 SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
-           file://fixups.patch;patch=1"
+           file://fixups.patch"
diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
index d563ad5..0dfa78c 100644
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ b/meta/recipes-connectivity/portmap/portmap.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://portmap.c;beginline=2;endline=31;md5=51ff67e66ec84b20
 DEPENDS = "virtual/fakeroot-native"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/p/portmap/portmap_5.orig.tar.gz \
-	${DEBIAN_MIRROR}/main/p/portmap/portmap_${PV}.diff.gz;patch=1 \
+	${DEBIAN_MIRROR}/main/p/portmap/portmap_${PV}.diff.gz \
 	file://portmap.init \
 	file://make.patch;apply=yes"
 S = "${WORKDIR}/portmap_5beta"
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index b2b9e75..e063f89 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 PR = "r3"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
-           file://prefer_python_2.5.patch;patch=1 \
-           file://doublefix.patch;patch=1"
+           file://prefer_python_2.5.patch \
+           file://doublefix.patch"
 
 SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
 SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
diff --git a/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb b/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb
index 058220f..f755940 100644
--- a/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb
+++ b/meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb
@@ -17,7 +17,7 @@ SECTION = "net"
 PR = "r1"
 
 SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
-           file://compilefix.patch;patch=1 \
+           file://compilefix.patch \
            file://zeroconf-default \
            file://debian-zeroconf"
 
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 7baace6..5f1d640 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -6,11 +6,11 @@ DESCRIPTION = "Provides tools that enable the set-up and manipulation of the lin
 PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
-           file://codepage.patch;patch=1 \
-           file://configure.patch;patch=1 \
-           file://compile.patch;patch=1 \
-           file://kbdrate.patch;patch=1 \
-           file://uclibc-fileno.patch;patch=1 \
+           file://codepage.patch \
+           file://configure.patch \
+           file://compile.patch \
+           file://kbdrate.patch \
+           file://uclibc-fileno.patch \
            file://config"
 
 SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index 2dde291..bad918c 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
 PR = "r7"
 
 SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}.tar.bz2 \
-	file://cvs-20040608.patch;patch=1;pnum=1 \
-	file://add-system.patch;patch=1;pnum=1 \
-	file://adduser-empty_pwd.patch;patch=1 \
-	file://remove-index.patch;patch=1 \
+	file://cvs-20040608.patch \
+	file://add-system.patch \
+	file://adduser-empty_pwd.patch \
+	file://remove-index.patch \
 	file://use_O2_option.patch \
 	file://passwd_rotate_check.patch \
 	file://avoid_static.patch"
diff --git a/meta/recipes-core/udev/udev_145.bb b/meta/recipes-core/udev/udev_145.bb
index becef04..b2e2294 100644
--- a/meta/recipes-core/udev/udev_145.bb
+++ b/meta/recipes-core/udev/udev_145.bb
@@ -3,7 +3,7 @@ RPROVIDES_${PN} = "hotplug"
 PR = "r11"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-           file://enable-gudev.patch;patch=1 \
+           file://enable-gudev.patch \
 	   file://run.rules \
 	   "
 
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index 8bc3dbf..0aac5fa 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -11,7 +11,7 @@ PR = "r4"
 SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
 
 SRC_URI = "git://github.com/philb/update-rc.d.git;protocol=git \
-           file://add-verbose.patch;striplevel=1"
+           file://add-verbose.patch;"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.1.bb
index fee9597..18450a0 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
@@ -29,7 +29,7 @@ RDEPENDS_automake += "\
 
 RDEPENDS_automake-native = "autoconf-native perl-native-runtime"
 
-PATHFIXPATCH = "file://path_prog_fixes.patch;patch=1"
+PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
 
 SRC_URI += "${PATHFIXPATCH} \
diff --git a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
index dd9b798..182b01f 100644
--- a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
@@ -4,13 +4,13 @@ DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
      http://www.codesourcery.com/gnu_toolchains/arm/portal/package2553/public/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
-     file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch;patch=1 \
-     file://binutils-uclibc-100-uclibc-conf.patch;patch=1 \
-     file://110-arm-eabi-conf.patch;patch=1 \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch;patch=1 \
-     file://binutils-uclibc-300-006_better_file_error.patch;patch=1 \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=1 \
-     file://docs_hack2.patch;patch=1 \
+     file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://110-arm-eabi-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://docs_hack2.patch \
      "
 
 PV = "2.18+csl-arm-2008q1-126"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb b/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
index 4853c15..91ff11f 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
@@ -7,13 +7,13 @@ require dosfstools_${PV}.bb
 PR="r5"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	file://mkdosfs-bootcode.patch;patch=1 \
-	file://mkdosfs-dir.patch;patch=1 \
-	file://alignment_hack.patch;patch=1 \
-	file://dosfstools-2.10-kernel-2.6.patch;patch=1 \
-	file://msdos_fat12_undefined.patch;patch=1 \
-	file://dosfstools-msdos_fs-types.patch;patch=1 \
-	file://include-linux-types.patch;patch=1 \
-	file://2.6.20-syscall.patch;patch=1"
+	file://mkdosfs-bootcode.patch \
+	file://mkdosfs-dir.patch \
+	file://alignment_hack.patch \
+	file://dosfstools-2.10-kernel-2.6.patch \
+	file://msdos_fat12_undefined.patch \
+	file://dosfstools-msdos_fs-types.patch \
+	file://include-linux-types.patch \
+	file://2.6.20-syscall.patch"
 
 inherit native
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
index 9b4763b..1beb5dd 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
 PR = "r2"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	   file://alignment_hack.patch;patch=1 \
-	   file://dosfstools-2.10-kernel-2.6.patch;patch=1 \
-           file://msdos_fat12_undefined.patch;patch=1 \
-	   file://include-linux-types.patch;patch=1"
+	   file://alignment_hack.patch \
+	   file://dosfstools-2.10-kernel-2.6.patch \
+           file://msdos_fat12_undefined.patch \
+	   file://include-linux-types.patch"
 
 do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index 91ec055..944d873 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	   file://alignment_hack.patch;patch=1 \
-           file://msdos_fat12_undefined.patch;patch=1 \
-	   file://include-linux-types.patch;patch=1"
+	   file://alignment_hack.patch \
+           file://msdos_fat12_undefined.patch \
+	   file://include-linux-types.patch"
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 041eda9..aa5f90e 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -5,7 +5,7 @@ SECTION = "base"
 INC_PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
-           file://ignore_extra_fields.patch;patch=1"
+           file://ignore_extra_fields.patch"
 
 DEPENDS = "zlib bzip2 perl"
 DEPENDS_virtclass-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index 48b6278..91535d3 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI += "file://noman.patch;patch=1 \
+SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
             file://check_version.patch"
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index a7bef25..ea0782d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -2,12 +2,12 @@ require e2fsprogs.inc
 
 PR = "r1"
 
-SRC_URI += "file://quotefix.patch;patch=1 \
+SRC_URI += "file://quotefix.patch \
             file://acinclude.m4"
 
 SRC_URI[md5sum] = "05f70470aea2ef7efbb0845b2b116720"
 SRC_URI[sha256sum] = "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50c8975cd0aad7b176"
-#file://no-hardlinks.patch;patch=1
+#file://no-hardlinks.patch
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 6eb3044..aa1cc95 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -35,9 +35,9 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
            file://fedora/gcc45-no-add-needed.patch;striplevel=0 \
            file://103-uclibc-conf-noupstream.patch  \
            file://200-uclibc-locale.patch  \
-           file://203-uclibc-locale-no__x.patch;striplevel=1 \
-           file://204-uclibc-locale-wchar_fix.patch;striplevel=1 \
-           file://205-uclibc-locale-update.patch;striplevel=1 \
+           file://203-uclibc-locale-no__x.patch; \
+           file://204-uclibc-locale-wchar_fix.patch; \
+           file://205-uclibc-locale-update.patch; \
            file://301-missing-execinfo_h.patch  \
            file://302-c99-snprintf.patch  \
            file://303-c99-complex-ugly-hack.patch  \
@@ -68,7 +68,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://pr45886.patch \
 	  "
 	
-SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
+SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
 
 # Language Overrides
 FORTRAN = ""
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 685feb4..98b682a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -41,9 +41,9 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://gcc-flags-for-build.patch \
            file://103-uclibc-conf-noupstream.patch  \
            file://200-uclibc-locale.patch  \
-           file://203-uclibc-locale-no__x.patch;striplevel=1 \
-           file://204-uclibc-locale-wchar_fix.patch;striplevel=1 \
-           file://205-uclibc-locale-update.patch;striplevel=1 \
+           file://203-uclibc-locale-no__x.patch; \
+           file://204-uclibc-locale-wchar_fix.patch; \
+           file://205-uclibc-locale-update.patch; \
            file://301-missing-execinfo_h.patch  \
            file://302-c99-snprintf.patch  \
            file://303-c99-complex-ugly-hack.patch  \
@@ -71,7 +71,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://gcc-with-linker-hash-style.patch \
 	  "
 
-SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
+SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
 
 #S = "${WORKDIR}/${BRANCH}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
index fd2b379..9aad535 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
@@ -7,8 +7,8 @@ PV_chinook-compat = "3.4.4cs2005q3.2"
 FILESDIR = "${FILE_DIRNAME}/gcc-csl-arm"
 
 SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-eabi/arm-2005q3-2-arm-none-eabi.src.tar.bz2 \
-           file://gcc_optab_arm.patch;patch=1 \
-           file://gcc-3.4.4-eabi-bigendian.patch;patch=1"
+           file://gcc_optab_arm.patch \
+           file://gcc-3.4.4-eabi-bigendian.patch"
 
 S = "${WORKDIR}/gcc-2005q3"
 
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
index 062f1c5..648d783 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
@@ -7,30 +7,30 @@ PR = "r6"
 FILESDIR = "${FILE_DIRNAME}/gcc-csl-arm"
 
 SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
-           file://gcc41-configure.in.patch;patch=1 \
-           file://arm-nolibfloat.patch;patch=1 \
-           file://arm-softfloat.patch;patch=1 \
-           file://zecke-xgcc-cpp.patch;patch=1 \
+           file://gcc41-configure.in.patch \
+           file://arm-nolibfloat.patch \
+           file://arm-softfloat.patch \
+           file://zecke-xgcc-cpp.patch \
 "
-#           file://100-uclibc-conf.patch;patch=1
-#           file://103-uclibc-conf-noupstream.patch;patch=1
-#           file://200-uclibc-locale.patch;patch=1
-#           file://203-uclibc-locale-no__x.patch;patch=1
-#           file://204-uclibc-locale-wchar_fix.patch;patch=1
-#           file://205-uclibc-locale-update.patch;patch=1
-#           file://300-libstdc++-pic.patch;patch=1
-#           file://302-c99-snprintf.patch;patch=1
-#           file://303-c99-complex-ugly-hack.patch;patch=1
-#           file://304-index_macro.patch;patch=1
-#           file://305-libmudflap-susv3-legacy.patch;patch=1
-#           file://306-libstdc++-namespace.patch;patch=1
-#           file://307-locale_facets.patch;patch=1
-#           file://402-libbackend_dep_gcov-iov.h.patch;patch=1
-#           file://602-sdk-libstdc++-includes.patch;patch=1
-#           file://gfortran.patch;patch=1
-#           file://fortran-static-linking.patch;patch=1
-#           file://gcc-configure-no-fortran.patch;patch=1;pnum=1
-#           file://gcc-new-makeinfo.patch;patch=1
+#           file://100-uclibc-conf.patch
+#           file://103-uclibc-conf-noupstream.patch
+#           file://200-uclibc-locale.patch
+#           file://203-uclibc-locale-no__x.patch
+#           file://204-uclibc-locale-wchar_fix.patch
+#           file://205-uclibc-locale-update.patch
+#           file://300-libstdc++-pic.patch
+#           file://302-c99-snprintf.patch
+#           file://303-c99-complex-ugly-hack.patch
+#           file://304-index_macro.patch
+#           file://305-libmudflap-susv3-legacy.patch
+#           file://306-libstdc++-namespace.patch
+#           file://307-locale_facets.patch
+#           file://402-libbackend_dep_gcov-iov.h.patch
+#           file://602-sdk-libstdc++-includes.patch
+#           file://gfortran.patch
+#           file://fortran-static-linking.patch
+#           file://gcc-configure-no-fortran.patch
+#           file://gcc-new-makeinfo.patch
 
 S = "${WORKDIR}/gcc-4.2"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.3.bb b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
index 9c2ed07..587d518 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
@@ -1,6 +1,6 @@
 require gdb-cross.inc
 
-SRC_URI += "file://sim-install-6.6.patch;patch=1"
+SRC_URI += "file://sim-install-6.6.patch"
 EXPAT = "--with-expat"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
index 53ef5ae..b50c022 100644
--- a/meta/recipes-devtools/m4/m4_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 
 PR = "r0"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-           file://ac_config_links.patch;patch=1"
+           file://ac_config_links.patch"
 
 SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
 SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index d9e0559..5c52c2a 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -7,7 +7,7 @@ SECTION = "devel"
 LICENSE = "GPL"
 
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
-           file://SCCS.patch;patch=1"
+           file://SCCS.patch"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb b/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
index e73cf2d..04531de 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
@@ -6,9 +6,9 @@ LICENSE = "GPLv2"
 PR = "r2"
 
 SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=b995f89a81589be8d8a41c374a6df109d0ee12b3 \
-           file://add-exclusion-to-mkfs-jffs2-git.patch;patch=1 \
-	   file://remove-ubi.patch;patch=1 \
-	   file://fix-ignoreerrors-git.patch;patch=1"
+           file://add-exclusion-to-mkfs-jffs2-git.patch \
+	   file://remove-ubi.patch \
+	   file://fix-ignoreerrors-git.patch"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
index f2de74d..c05149d 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
 SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
+		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index faf8317..2e4c1cb 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -10,9 +10,9 @@ PR = "r4"
 
 #http://mtools.linux.lu/mtools-${PV}.tar.gz 
 SRC_URI="http://folks.o-hand.com/richard/poky/sources/mtools-${PV}.tar.gz \
-	file://mtools-makeinfo.patch;patch=1 \
-	file://mtools.patch;patch=1 \
-	file://no-x11.patch;patch=1"
+	file://mtools-makeinfo.patch \
+	file://mtools.patch \
+	file://no-x11.patch"
 
 S = "${WORKDIR}/mtools-${PV}"
 
diff --git a/meta/recipes-devtools/patch/patch_2.5.9.bb b/meta/recipes-devtools/patch/patch_2.5.9.bb
index 285b42a..4d27cbd 100644
--- a/meta/recipes-devtools/patch/patch_2.5.9.bb
+++ b/meta/recipes-devtools/patch/patch_2.5.9.bb
@@ -1,10 +1,10 @@
 require patch.inc
 LICENSE = "GPLv2"
 
-SRC_URI += " file://debian.patch;patch=1 \
-	   file://install.patch;patch=1 \
-           file://unified-reject-files.diff;patch=1 \
-           file://global-reject-file.diff;patch=1 "
+SRC_URI += " file://debian.patch \
+	   file://install.patch \
+           file://unified-reject-files.diff \
+           file://global-reject-file.diff "
 PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-devtools/patch/patch_2.6.1.bb b/meta/recipes-devtools/patch/patch_2.6.1.bb
index 39d6fc6..fce3656 100644
--- a/meta/recipes-devtools/patch/patch_2.6.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.6.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv3"
 
 PR = "r0"
 
-SRC_URI += " file://global-reject-file.diff;patch=1 "
+SRC_URI += " file://global-reject-file.diff "
 
 SRC_URI[md5sum] = "d758eb96d3f75047efc004a720d33daf"
 SRC_URI[sha256sum] = "d1563731e9cffed11cc5f011b2b8e074c325e86a383a91889b5c5b80b09781b9"
diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index 671319c..d286564 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -50,7 +50,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
 	file://debian/fixes/h2ph-gcc-4.5.diff \
 	file://debian/patchlevel \
 	\
-        file://Makefile.patch;patch=1 \
+        file://Makefile.patch \
         file://parallel_build_fix_1.patch \
         file://parallel_build_fix_2.patch \
         file://parallel_build_fix_3.patch \
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 6aa7f6d..6271992 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -1,7 +1,7 @@
 require pkgconfig.inc
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config;protocol=git \
-           file://autofoo.patch;patch=1 \
+           file://autofoo.patch \
            file://glibconfig-sysdefs.h"
 
 S = "${WORKDIR}/git/"
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
index 35570dc..9bd4f50 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
@@ -13,7 +13,7 @@ PR = "r1"
 
 SRC_URI = "\
   http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
-  file://no-static-link.patch;patch=1 \
+  file://no-static-link.patch \
 "
 
 SRC_URI[archive.md5sum] = "919d58fe37e69fe87ce4534d8b6a1c7b"
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 4b3dd94..4e77e2e 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "http://subversion.tigris.org"
 PR = "r0"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
-           file://disable-revision-install.patch;patch=1 \
-	   file://neon-detection.patch;patch=1 \
-	   file://libtool2.patch;patch=1"
+           file://disable-revision-install.patch \
+	   file://neon-detection.patch \
+	   file://libtool2.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index 7343e90..7ee2fba 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -9,7 +9,7 @@ PR = "r5"
 #RRECOMMENDS_${PN} = "acct"
 
 SRC_URI = "svn://ubootchart.googlecode.com/svn/;proto=http;module=trunk \
-        file://sysvinit.patch;patch=1;pnum=0 \
+        file://sysvinit.patch;striplevel=0 \
         file://ubootchart-stop \
         file://ubootchart.desktop"
 
diff --git a/meta/recipes-extended/gzip/gzip_1.3.12.bb b/meta/recipes-extended/gzip/gzip_1.3.12.bb
index df41c1e..f0752e4 100644
--- a/meta/recipes-extended/gzip/gzip_1.3.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.3.12.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://lzw.h;endline=19;md5=c273e09a02edd9801cc74d39683049e9 "
 
 SRC_URI = "${GNU_MIRROR}/gzip/gzip-${PV}.tar.gz \
-           file://m4-extensions-fix.patch;patch=1 \
-           file://dup-def-fix.patch;patch=1"
+           file://m4-extensions-fix.patch \
+           file://dup-def-fix.patch"
 
 PR = "r0"
 
diff --git a/meta/recipes-extended/hdparm/hdparm_6.3.bb b/meta/recipes-extended/hdparm/hdparm_6.3.bb
index 7ba4b8b..62ae4c0 100644
--- a/meta/recipes-extended/hdparm/hdparm_6.3.bb
+++ b/meta/recipes-extended/hdparm/hdparm_6.3.bb
@@ -6,8 +6,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz \
-	   file://bswap.patch;patch=1 \
-	   file://uclibc.patch;patch=1"
+	   file://bswap.patch \
+	   file://uclibc.patch"
 
 SRC_URI[md5sum] = "0c12672f3a09c14ad0b0882f15fc9389"
 SRC_URI[sha256sum] = "08688a6a46ba495494bf838f8f26103e797584c1888eca94e43a171e1b37246d"
diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index 873b26c..d38612b 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
@@ -11,30 +11,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5k-confpath.patch;striplevel=0 \
-           file://man-1.5h1-make.patch;striplevel=1 \
-           file://man-1.5k-nonascii.patch;striplevel=1 \
-           file://man-1.6e-security.patch;striplevel=1 \
-           file://man-1.6e-mandirs.patch;striplevel=1 \
-           file://man-1.5m2-bug11621.patch;striplevel=1 \
-           file://man-1.5k-sofix.patch;striplevel=1 \
-           file://man-1.5m2-buildroot.patch;striplevel=1 \
-           file://man-1.6e-ro_usr.patch;striplevel=1 \
+           file://man-1.5h1-make.patch; \
+           file://man-1.5k-nonascii.patch; \
+           file://man-1.6e-security.patch; \
+           file://man-1.6e-mandirs.patch; \
+           file://man-1.5m2-bug11621.patch; \
+           file://man-1.5k-sofix.patch; \
+           file://man-1.5m2-buildroot.patch; \
+           file://man-1.6e-ro_usr.patch; \
            file://man-1.5i2-newline.patch;striplevel=0 \
-           file://man-1.5j-utf8.patch;striplevel=1 \
-           file://man-1.5i2-overflow.patch;striplevel=1 \
-           file://man-1.5j-nocache.patch;striplevel=1 \
-           file://man-1.5i2-initial.patch;striplevel=1 \
+           file://man-1.5j-utf8.patch; \
+           file://man-1.5i2-overflow.patch; \
+           file://man-1.5j-nocache.patch; \
+           file://man-1.5i2-initial.patch; \
            file://man-1.5h1-gencat.patch;striplevel=0 \
-           file://man-1.5g-nonrootbuild.patch;striplevel=1 \
+           file://man-1.5g-nonrootbuild.patch; \
            file://man-1.5m2-tv_fhs.patch;striplevel=0 \
-           file://man-1.5j-i18n.patch;striplevel=1 \
-           file://man-1.6e-whatis2.patch;striplevel=1 \
-           file://man-1.6e-use_i18n_vars_in_a_std_way.patch;striplevel=1 \
-           file://man-1.5m2-no-color-for-printing.patch;striplevel=1 \
-           file://man-1.5m2-sigpipe.patch;striplevel=1 \
-           file://man-1.6e-i18n_whatis.patch;striplevel=1 \
-           file://man-1.6e-new_sections.patch;striplevel=1 \
-           file://man-1.6e-lzma+xz-support.patch;striplevel=1 \
+           file://man-1.5j-i18n.patch; \
+           file://man-1.6e-whatis2.patch; \
+           file://man-1.6e-use_i18n_vars_in_a_std_way.patch; \
+           file://man-1.5m2-no-color-for-printing.patch; \
+           file://man-1.5m2-sigpipe.patch; \
+           file://man-1.6e-i18n_whatis.patch; \
+           file://man-1.6e-new_sections.patch; \
+           file://man-1.6e-lzma+xz-support.patch; \
            file://man*"
 
 SRC_URI[md5sum] = "67aaaa6df35215e812fd7d89472c44b6"
diff --git a/meta/recipes-extended/minicom/minicom_2.4.bb b/meta/recipes-extended/minicom/minicom_2.4.bb
index 8718a1f..38b5154 100644
--- a/meta/recipes-extended/minicom/minicom_2.4.bb
+++ b/meta/recipes-extended/minicom/minicom_2.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
 SRC_URI = "http://alioth.debian.org/frs/download.php/3195/minicom-${PV}.tar.gz \
 	file://rename-conflicting-functions.patch \
 	"
-#	file://gcc4-scope.patch;patch=1
+#	file://gcc4-scope.patch
 
 SRC_URI[md5sum] = "700976a3c2dcc8bbd50ab9bb1c08837b"
 SRC_URI[sha256sum] = "6b7af240b073ba847b091fd75aed4bf720eb94d30e188d23bb098d016bf40a48"
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 5a06a14..77047cc 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "ncurses virtual/libintl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
-	   file://libintl-link.patch;patch=1"
+	   file://libintl-link.patch"
 S = "${WORKDIR}/psmisc-${PV}"
 
 inherit autotools gettext
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 5d78a64..450a623 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -11,11 +11,11 @@ PR = "r1"
 DEPENDS = "zlib"
 
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
-           file://texinfo-4.12-zlib.patch;striplevel=1 \
-           file://texinfo-4.13a-data_types.patch;striplevel=1 \
-           file://texinfo-4.13a-mosdo-crash.patch;striplevel=1 \
-           file://texinfo-4.13a-powerpc.patch;striplevel=1 \
-           file://texinfo-4.13a-help-index-segfault.patch;striplevel=1"
+           file://texinfo-4.12-zlib.patch; \
+           file://texinfo-4.13a-data_types.patch; \
+           file://texinfo-4.13a-mosdo-crash.patch; \
+           file://texinfo-4.13a-powerpc.patch; \
+           file://texinfo-4.13a-help-index-segfault.patch;"
 
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
 SRC_URI[sha256sum] = "1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68"
diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index ef2cb8a..9f9a9e5 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -1,12 +1,12 @@
 require time.inc
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
-	   file://debian.patch;patch=1"
+	   file://debian.patch"
 
 SRC_URI[md5sum] = "e38d2b8b34b1ca259cf7b053caac32b3"
 SRC_URI[sha256sum] = "e37ea79a253bf85a85ada2f7c632c14e481a5fd262a362f6f4fd58e68601496d"
-#	   file://autofoo.patch;patch=1
-#	   file://compile.patch;patch=1
+#	   file://autofoo.patch
+#	   file://compile.patch
 S = "${WORKDIR}/time-${PV}"
 
 inherit autotools
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
index e3e1819..50597b0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpng glib-2.0 jpeg"
 PR = "r1"
 
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
-           file://hardcoded_libtool.patch;patch=1 \
-           file://configure_fix.patch;patch=1 \
+           file://hardcoded_libtool.patch \
+           file://configure_fix.patch \
            "
 
 SRC_URI[md5sum] = "fcfc854e9aec7dbb2bb3059484d44556"
diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
index c2e1c82..570c45a 100644
--- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
@@ -15,7 +15,7 @@ inherit gnome
 # The omf.make file failed if scrollkeeper doesn't happen to be
 # installed
 
-SRC_URI += "file://omf.patch;patch=1"
+SRC_URI += "file://omf.patch"
 
 SRC_URI[archive.md5sum] = "30daabb0ca4898fea2647999e7813e8f"
 SRC_URI[archive.sha256sum] = "dd4817103d23745d00c735dd137951552ba7b576cb8f68e6a529d06661e9b6a1"
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
index b730dae..fc891c7 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
@@ -10,7 +10,7 @@ inherit gnome
 inherit autotools
 PR = "r4"
 
-SRC_URI += "file://pkgconfig.patch;patch=1"
+SRC_URI += "file://pkgconfig.patch"
 
 SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
 SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
diff --git a/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb b/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
index 3ca9c56..c09c8be 100644
--- a/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
@@ -20,8 +20,8 @@ inherit gnome
 # This is to provide compatibility with the gnome-vfs DBus fork
 RPROVIDES = "gnome-vfs-plugin-dbus"
 
-SRC_URI += "file://gconftool-lossage.patch;patch=1;pnum=1 \
-	    file://gnome-vfs-no-kerberos.patch;patch=1;pnum=0"
+SRC_URI += "file://gconftool-lossage.patch \
+	    file://gnome-vfs-no-kerberos.patch;striplevel=0"
 
 SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
 SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
index d5723bf..5e37255 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
@@ -1,9 +1,9 @@
 SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
-           file://configure.patch;patch=1 \
-           file://pathfix.patch;patch=1"
+           file://configure.patch \
+           file://pathfix.patch"
 
 SRC_URI_virtclass-native = "git://git.gnome.org/gobject-introspection;protocol=git \
-                            file://pathfix.patch;patch=1"
+                            file://pathfix.patch"
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index ddc48c2..d82ea19 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -9,7 +9,7 @@ ART_CONFIG = "${HOST_ARCH}/art_config.h"
 # can't use gnome.oeclass due to _ in filename
 SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
        file://${ART_CONFIG} \
-       file://Makefile.am.patch;patch=1"
+       file://Makefile.am.patch"
 
 SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
 SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
index 92ddd68..b9ffce0 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
@@ -9,7 +9,7 @@ PR = "r2"
 
 inherit gnome update-alternatives
 
-SRC_URI += "file://crosscompile.patch;patch=1"
+SRC_URI += "file://crosscompile.patch"
 SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
 SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index 7c72a09..7de748c 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -3,26 +3,26 @@ require gtk+.inc
 PR = "r11"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.12/gtk+-${PV}.tar.bz2 \
-           file://xsettings.patch;patch=1 \
-           file://run-iconcache.patch;patch=1 \
-           file://disable-print.patch;patch=1 \
-           file://hardcoded_libtool.patch;patch=1 \
-           file://no-demos.patch;patch=1 \
-           file://cellrenderer-cairo.patch;patch=1;pnum=0 \
-           file://entry-cairo.patch;patch=1;pnum=0 \
-           file://toggle-font.diff;patch=1;pnum=0 \
-           file://scrolled-placement.patch;patch=1;pnum=0 \
-           file://filesystem-volumes.patch;patch=1 \
-           file://filechooser-props.patch;patch=1 \
-           file://filechooser-default.patch;patch=1 \
-           file://filechooser-sizefix.patch;patch=1 \
+           file://xsettings.patch \
+           file://run-iconcache.patch \
+           file://disable-print.patch \
+           file://hardcoded_libtool.patch \
+           file://no-demos.patch \
+           file://cellrenderer-cairo.patch;striplevel=0 \
+           file://entry-cairo.patch;striplevel=0 \
+           file://toggle-font.diff;striplevel=0 \
+           file://scrolled-placement.patch;striplevel=0 \
+           file://filesystem-volumes.patch \
+           file://filechooser-props.patch \
+           file://filechooser-default.patch \
+           file://filechooser-sizefix.patch \
 	  "
 # temporary
-#           file://gtklabel-resize-patch;patch=1
-#           file://menu-deactivate.patch;patch=1
-#        file://combo-arrow-size.patch;patch=1;pnum=0
+#           file://gtklabel-resize-patch
+#           file://menu-deactivate.patch
+#        file://combo-arrow-size.patch;striplevel=0
 # die die die
-#           file://pangoxft2.10.6.diff;patch=1
+#           file://pangoxft2.10.6.diff
 
 
 EXTRA_OECONF = "--without-libtiff --disable-xkb --disable-glibtest --enable-display-migration"
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index deea3d0..18f61e7 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -3,25 +3,25 @@ require gtk+.inc
 PR = "r7"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.16/gtk+-${PV}.tar.bz2 \
-           file://xsettings.patch;patch=1 \
-           file://run-iconcache.patch;patch=1 \
-           file://hardcoded_libtool.patch;patch=1 \
-           file://no-demos.patch;patch=1 \
-           file://cellrenderer-cairo.patch;patch=1;pnum=0 \
-           file://toggle-font.diff;patch=1;pnum=0 \
-	   file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch;patch=1 \
-            file://disable-gio-png-sniff-test.diff;patch=1 \
+           file://xsettings.patch \
+           file://run-iconcache.patch \
+           file://hardcoded_libtool.patch \
+           file://no-demos.patch \
+           file://cellrenderer-cairo.patch;striplevel=0 \
+           file://toggle-font.diff;striplevel=0 \
+	   file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
+            file://disable-gio-png-sniff-test.diff \
 	  "
 # TO MERGE
-#           file://entry-cairo.patch;patch=1;pnum=0
-#           file://filesystem-volumes.patch;patch=1
-#           file://filechooser-props.patch;patch=1
-#           file://filechooser-default.patch;patch=1
-#           file://filechooser-sizefix.patch;patch=1
+#           file://entry-cairo.patch;striplevel=0
+#           file://filesystem-volumes.patch
+#           file://filechooser-props.patch
+#           file://filechooser-default.patch
+#           file://filechooser-sizefix.patch
 # temporary
-#           file://gtklabel-resize-patch;patch=1
-#           file://menu-deactivate.patch;patch=1
-#        file://combo-arrow-size.patch;patch=1;pnum=0
+#           file://gtklabel-resize-patch
+#           file://menu-deactivate.patch
+#        file://combo-arrow-size.patch;striplevel=0
 
 
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
index 246606f..55620d2 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
@@ -7,26 +7,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 PR = "r2"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
-           file://xsettings.patch;patch=1 \
-           file://run-iconcache.patch;patch=1 \
-           file://hardcoded_libtool.patch;patch=1 \
-           file://no-demos.patch;patch=1 \
-           file://cellrenderer-cairo.patch;patch=1;pnum=0 \
-           file://toggle-font.diff;patch=1;pnum=0 \
-           file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch;patch=1 \
+           file://xsettings.patch \
+           file://run-iconcache.patch \
+           file://hardcoded_libtool.patch \
+           file://no-demos.patch \
+           file://cellrenderer-cairo.patch;striplevel=0 \
+           file://toggle-font.diff;striplevel=0 \
+           file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
            file://doc-fixes.patch \
 	  "
 # TO MERGE
-#           file://entry-cairo.patch;patch=1;pnum=0
-#           file://filesystem-volumes.patch;patch=1
-#           file://filechooser-props.patch;patch=1
-#           file://filechooser-default.patch;patch=1
-#           file://filechooser-sizefix.patch;patch=1
+#           file://entry-cairo.patch;striplevel=0
+#           file://filesystem-volumes.patch
+#           file://filechooser-props.patch
+#           file://filechooser-default.patch
+#           file://filechooser-sizefix.patch
 # temporary
-#           file://gtklabel-resize-patch;patch=1
-#           file://menu-deactivate.patch;patch=1
-#        file://combo-arrow-size.patch;patch=1;pnum=0
-#            file://configurefix.patch;patch=1
+#           file://gtklabel-resize-patch
+#           file://menu-deactivate.patch
+#        file://combo-arrow-size.patch;striplevel=0
+#            file://configurefix.patch
 
 SRC_URI[md5sum] = "fdce46ba354c155230b7d4090b17f7d9"
 SRC_URI[sha256sum] = "965bc124f0d25087c4cb2a64cbfd7e4f896e05be8d560fbba68dd8685ba24d07"
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index d6af820..c5a84d6 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -9,12 +9,12 @@ PV = "2.11.0+svnr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;proto=http \
-	http://svn.o-hand.com/repos/web/trunk/patches/at-import_box-pos.patch;patch=1;pnum=0;maxrev=1157;name=patch1 \
-	http://svn.o-hand.com/repos/web/trunk/patches/css-stylesheet-user.patch;patch=1;pnum=0;maxrev=1157;name=patch2 \
-	http://svn.o-hand.com/repos/web/trunk/patches/css-media.patch;patch=1;pnum=0;maxrev=1157;name=patch3 \
-	http://svn.o-hand.com/repos/web/trunk/patches/add-end-element-signal.patch;patch=1;pnum=0;maxrev=1157;name=patch4 \
-	http://svn.o-hand.com/repos/web/trunk/patches/add-dom-functions.patch;patch=1;pnum=0;maxrev=1157;name=patch5 \
-	http://svn.o-hand.com/repos/web/trunk/patches/iain-mem-leak.patch;patch=1;pnum=0;maxrev=1157;name=patch6"
+	http://svn.o-hand.com/repos/web/trunk/patches/at-import_box-pos.patch;striplevel=0;maxrev=1157;name=patch1 \
+	http://svn.o-hand.com/repos/web/trunk/patches/css-stylesheet-user.patch;striplevel=0;maxrev=1157;name=patch2 \
+	http://svn.o-hand.com/repos/web/trunk/patches/css-media.patch;striplevel=0;maxrev=1157;name=patch3 \
+	http://svn.o-hand.com/repos/web/trunk/patches/add-end-element-signal.patch;striplevel=0;maxrev=1157;name=patch4 \
+	http://svn.o-hand.com/repos/web/trunk/patches/add-dom-functions.patch;striplevel=0;maxrev=1157;name=patch5 \
+	http://svn.o-hand.com/repos/web/trunk/patches/iain-mem-leak.patch;striplevel=0;maxrev=1157;name=patch6"
 
 SRC_URI[patch1.md5sum] = "160c648e29637f2ed6301f4dfdecce21"
 SRC_URI[patch1.sha256sum] = "3ec786e6df9e1a935aff4848b6989cad8f87c1fa8813dc033b338e18b17138d8"
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 9609528..d5b41f2 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -13,7 +13,7 @@ DEPENDS = "gtk+ gtk-doc-native"
 
 inherit autotools pkgconfig gnome
 
-SRC_URI += "file://glade-cruft.patch;patch=1 file://no-xml2.patch;patch=1"
+SRC_URI += "file://glade-cruft.patch file://no-xml2.patch"
 
 SRC_URI[archive.md5sum] = "d1776b40f4e166b5e9c107f1c8fe4139"
 SRC_URI[archive.sha256sum] = "64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec"
diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index 76a26a6..020453f 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -8,8 +8,8 @@ PV = "1.0.0+git${SRCPV}"
 PR = "r9"
 
 SRC_URI = "git://git.gnome.org/clutter;protocol=git;branch=master \
-           file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;patch=1;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
-           file://enable_tests.patch;patch=1;notrev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 "
+           file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
+           file://enable_tests.patch;notrev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 "
 S = "${WORKDIR}/git"
 
 BASE_CONF += "--disable-introspection"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
index b2cf46d..3b691f7 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
@@ -3,10 +3,10 @@ require libmatchbox.inc
 PR = "r8"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-           file://16bppfixes.patch;patch=1 \
-           file://configure_fixes.patch;patch=1 \
+           file://16bppfixes.patch \
+           file://configure_fixes.patch \
            file://check.m4 \
-           file://matchbox-start-fix.patch;patch=1"
+           file://matchbox-start-fix.patch"
 
 SRC_URI[md5sum] = "465fa15c43bf0091a3810e7702fe143f"
 SRC_URI[sha256sum] = "f7054f93c57ba6b758d0e4f47d4d2dd96a7fe487e1157eb70a4d642910275aea"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
index 2984177..d9d4535 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
@@ -6,10 +6,10 @@ PR = "r0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://configure_fixes.patch;patch=1 \
+           file://configure_fixes.patch \
 	   file://check.m4 \
-	   file://16bppfixes.patch;patch=1 \
-	   file://matchbox-start-fix.patch;patch=1"
+	   file://16bppfixes.patch \
+	   file://matchbox-start-fix.patch"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index f08077d..8b0d3c2 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -17,8 +17,8 @@ PR = "r7"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://acinclude.m4 \
-	   file://configure_tweak.patch;patch=1 \
-	   file://kernel-asm-page.patch;patch=1 "
+	   file://configure_tweak.patch \
+	   file://kernel-asm-page.patch "
 
 S = "${WORKDIR}/SDL-${PV}"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index f68eb2b..63829ec 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -5,7 +5,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage li
 PR = "r4"
 
 SRC_URI = "http://matchbox-project.org/sources/matchbox-window-manager/1.2/matchbox-window-manager-${PV}.tar.bz2 \
-           file://configure_fix.patch;patch=1 \
+           file://configure_fix.patch \
            file://kbdconfig \
            file://gconf-2.m4"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 9814d67..f58529d 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -15,7 +15,7 @@ PV = "1.2+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=git \
-           file://configure_fix.patch;patch=1;maxrev=1818 \
+           file://configure_fix.patch;maxrev=1818 \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 07887f4..c4132d7 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,9 +1,9 @@
 include mesa-common.inc
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://cross2.patch;patch=1 \
+           file://cross2.patch \
            file://matypes.h"
-#           file://mesa-DRI2Swapbuffer.patch;patch=1 "
+#           file://mesa-DRI2Swapbuffer.patch "
 S = "${WORKDIR}/git"
 
 PROTO_DEPS = "xf86driproto glproto dri2proto"
diff --git a/meta/recipes-graphics/mutter/mutter_git.bb b/meta/recipes-graphics/mutter/mutter_git.bb
index c3ba32e..94cb17d 100644
--- a/meta/recipes-graphics/mutter/mutter_git.bb
+++ b/meta/recipes-graphics/mutter/mutter_git.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 # git://git.gnome.org/mutter.git;protocol=git;branch=master
 #
 SRC_URI = "git://git.moblin.org/mutter.git;protocol=git;branch=master \
-           file://nodocs.patch;patch=1 \
-           file://nozenity.patch;patch=1 \
-           file://crosscompile.patch;patch=1;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
-           file://fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch;patch=1;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
-           file://fix_pkgconfig.patch;patch=1;notrev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
+           file://nodocs.patch \
+           file://nozenity.patch \
+           file://crosscompile.patch;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
+           file://fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
+           file://fix_pkgconfig.patch;notrev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
            "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index ad9bfa7..3704572 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -13,13 +13,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 PR = "r18"
 
 SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
-           file://fix_version.patch;patch=1 \
+           file://fix_version.patch \
            file://ts.conf \
            file://tslib.sh"
 
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
-SRC_URI_append_qemumips += " file://32bitBE-support.patch;patch=1"
+SRC_URI_append_qemumips += " file://32bitBE-support.patch"
 
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 015065e..d3a5044 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -15,7 +15,7 @@ DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native"
 # DEPENDS += "xsltproc-native gperf-native"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2"
-#           file://xcbincludedir.patch;patch=1"
+#           file://xcbincludedir.patch"
 
 PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
              libxcb-randr libxcb-record libxcb-render libxcb-res \
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index 0727d0f..002cc15 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -9,8 +9,8 @@ SECTION = "x11/base"
 PR="r3"
 
 SRC_URI = "http://matchbox-project.org/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
-	   file://use-relative-symlinks.patch;patch=1 \
-	   file://fix_watch_cursor.patch;patch=1"
+	   file://use-relative-symlinks.patch \
+	   file://fix_watch_cursor.patch"
 
 SRC_URI[md5sum] = "7b0c623049d4aab20600d6473f8aab23"
 SRC_URI[sha256sum] = "b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
index a56ef11..b4dd1ed 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
@@ -13,6 +13,6 @@ PV = "1.3.0+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-mouse;protocol=git \
-           file://unbreak.patch;patch=1"
+           file://unbreak.patch"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
index bd82b35..dea7faf 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
@@ -4,9 +4,9 @@ require libx11_git.inc
 DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
 this version."
 
-SRC_URI += "file://X18NCMSstubs.diff;patch=1 \
-            file://fix-disable-xlocale.diff;patch=1 \
-            file://fix-utf8-wrong-define.patch;patch=1"
+SRC_URI += "file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.inc b/meta/recipes-graphics/xorg-lib/libx11_git.inc
index 40d8061..4de424d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_git.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11_git.inc
@@ -3,9 +3,9 @@ PV = "1.2.1+git${SRCPV}"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libX11;protocol=git"
 S = "${WORKDIR}/git"
 
-SRC_URI += "file://x11_disable_makekeys.patch;patch=1 \
-            file://include_fix.patch;patch=1 \
-            file://nodolt.patch;patch=1"
+SRC_URI += "file://x11_disable_makekeys.patch \
+            file://include_fix.patch \
+            file://nodolt.patch"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11-git"
 FILESPATH = "${FILE_DIRNAME}/libx11-git"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
index 2f9516c..43a628e 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
@@ -15,7 +15,7 @@ PROVIDES = "xfont"
 PR = "r0"
 PE = "1"
 
-#SRC_URI += "file://no-scalable-crash.patch;patch=1"
+#SRC_URI += "file://no-scalable-crash.patch"
 
 XORG_PN = "libXfont"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
index b7e5520..c2067c9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
@@ -10,20 +10,20 @@ PE = "1"
 PR = "r26"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
-	file://extra-kmodes.patch;patch=1 \
-	file://disable-apm.patch;patch=1 \
-	file://no-serial-probing.patch;patch=1 \
-	file://keyboard-resume-workaround.patch;patch=1 \
-	file://enable-xcalibrate.patch;patch=1 \
-	file://hide-cursor-and-ppm-root.patch;patch=1 \
-	file://fbdev_xrandr_ioctl.patch;patch=1 \
-	file://fix-newer-xorg-headers.patch;patch=1 \
-	file://crosscompile.patch;patch=1 \
-	file://nodolt.patch;patch=1"
-#	file://kdrive-evdev.patch;patch=1
-#	file://kdrive-use-evdev.patch;patch=1
-#	file://enable-builtin-fonts.patch;patch=1
-#	file://optional-xkb.patch;patch=1
+	file://extra-kmodes.patch \
+	file://disable-apm.patch \
+	file://no-serial-probing.patch \
+	file://keyboard-resume-workaround.patch \
+	file://enable-xcalibrate.patch \
+	file://hide-cursor-and-ppm-root.patch \
+	file://fbdev_xrandr_ioctl.patch \
+	file://fix-newer-xorg-headers.patch \
+	file://crosscompile.patch \
+	file://nodolt.patch"
+#	file://kdrive-evdev.patch
+#	file://kdrive-use-evdev.patch
+#	file://enable-builtin-fonts.patch
+#	file://optional-xkb.patch
 
 
 S = "${WORKDIR}/xorg-server-${PV}"
diff --git a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
index 75013a2..e6ccd04 100644
--- a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
+++ b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
@@ -15,8 +15,8 @@ DEPENDS = "virtual/libx11 libxft libxcalibrate"
 PR = "r13"
 
 SRC_URI = "${GPE_MIRROR}/xtscal-${PV}.tar.bz2 \
-           file://change-cross.patch;patch=1 \
-           file://cleanup.patch;patch=1 \
+           file://change-cross.patch \
+           file://cleanup.patch \
            file://dso_linking_change_build_fix.patch \
            file://30xTs_Calibrate.sh"
 
diff --git a/meta/recipes-kernel/oprofile/oprofile_cvs.bb b/meta/recipes-kernel/oprofile/oprofile_cvs.bb
index f2b5520..c66f4d3 100644
--- a/meta/recipes-kernel/oprofile/oprofile_cvs.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_cvs.bb
@@ -12,7 +12,7 @@ RRECOMMENDS_${PN} = "kernel-vmlinux"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "cvs://anonymous@oprofile.cvs.sourceforge.net/cvsroot/oprofile;module=oprofile \
-           file://opstart.patch;patch=1 \
+           file://opstart.patch \
 	   file://acinclude.m4"
 S = "${WORKDIR}/oprofile"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
index 53f4d29..6f32b57 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -17,7 +17,7 @@ ARM_INSTRUCTION_SET = "arm"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
-           file://fix-tstamp-declaration.patch;patch=1"
+           file://fix-tstamp-declaration.patch"
 
 SRC_URI[md5sum] = "7cc05f25e1d5b65da8fb3fdcd540f226"
 SRC_URI[sha256sum] = "a32f7c21015b6c71f9a80ff70a2b6a50e4ff4d5c77c744ff0793dea7ba7a2517"
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index fc8e14f..341047a 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -17,8 +17,8 @@ DEPENDS = "libogg"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
-           file://disable-xmms-plugin.patch;patch=1 \
-           file://flac-gcc43-fixes.patch;patch=1 \
+           file://disable-xmms-plugin.patch \
+           file://flac-gcc43-fixes.patch \
            file://xmms.m4 \
            file://0001-No-AltiVec-on-SPE.patch"
 
diff --git a/meta/recipes-multimedia/lame/lame_3.98.4.bb b/meta/recipes-multimedia/lame/lame_3.98.4.bb
index 3169334..6e098c6 100644
--- a/meta/recipes-multimedia/lame/lame_3.98.4.bb
+++ b/meta/recipes-multimedia/lame/lame_3.98.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
-           file://no-gtk1.patch;patch=1"
+           file://no-gtk1.patch"
 
 inherit autotools
 
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 175e494..ddc109c 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -9,7 +9,7 @@ PR = "r3"
 inherit autotools
 
 SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
-           file://buildcleanup.patch;patch=1"
+           file://buildcleanup.patch"
 
 SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
 SRC_URI[sha256sum] = "a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 1e07f7e..4faa981 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -10,7 +10,7 @@ DEPENDS = "zlib"
 PR = "r3"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
-           file://addpkgconfig.patch;patch=1"
+           file://addpkgconfig.patch"
 
 SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
diff --git a/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb b/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb
index 2d9fa48..0a0367a 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "zlib jpeg lzo"
 PR = "r2"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
-           file://libtool2.patch;patch=1"
+           file://libtool2.patch"
 
 SRC_URI[md5sum] = "fbb6f446ea4ed18955e2714934e5b698"
 SRC_URI[sha256sum] = "be88f037080b93ce0a337b2b3ca5e8195f76885deb6c558cc3aa872ee848fc76"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4bb1c59..2a8e74d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -12,7 +12,7 @@ DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool virtua
 DEPENDS += "bluez4 udev alsa-lib glib-2.0 dbus consolekit"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
-           file://gcc4-compile-fix.patch;patch=1 \
+           file://gcc4-compile-fix.patch \
            file://volatiles.04_pulse"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
index 2acc5b5..d129a64 100644
--- a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
+++ b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 PR = "r1"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/mobile/2.23/2.23.92/sources/evolution-data-server-dbus-${PV}.tar.gz  \
-           file://oh-contact.patch;patch=1;pnum=0 \
-           file://no_iconv_test.patch;patch=1 \
+           file://oh-contact.patch;striplevel=0 \
+           file://no_iconv_test.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/evolution-data-server-dbus-${PV}"
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 0d920cd..7fa8311 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -15,11 +15,11 @@ PV = "2.30+git${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
-           file://oh-contact.patch;patch=1;pnum=0 \
-           file://nossl.patch;patch=1 \
-           file://optional_imapx_provider.patch;patch=1 \
-           file://new-contact-fix.patch;patch=1 \
-           file://old-gdk-api.patch;patch=1 \
+           file://oh-contact.patch;striplevel=0 \
+           file://nossl.patch \
+           file://optional_imapx_provider.patch \
+           file://new-contact-fix.patch \
+           file://old-gdk-api.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index d3873ad..1d93b73 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -16,7 +16,7 @@ PR = "r0"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-        file://no-handed.patch;patch=1;pnum=0"
+        file://no-handed.patch;striplevel=0"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 7d7a1b9..97b40d4 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -15,8 +15,8 @@ PV = "0.0+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://configure_fix.patch;patch=1;maxrev=1819 \
-           file://single-instance.patch;patch=1 \
+           file://configure_fix.patch;maxrev=1819 \
+           file://single-instance.patch \
 	   file://80matchboxkeyboard.shbg"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 46473a0..98b3447 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -21,7 +21,7 @@ RCONFLICTS_${PN} = "matchbox-panel"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \	
 	   file://gcc-4.6.0-compile.patch \
-           file://startup_fix.diff;patch=1"
+           file://startup_fix.diff"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
diff --git a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
index 94ccd3f..10388f4 100644
--- a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
+++ b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
@@ -12,8 +12,8 @@ PV = "0.0+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://single-instance.patch;patch=1 \
-           file://configure_fix.patch;patch=1;maxrev=1819 \
+           file://single-instance.patch \
+           file://configure_fix.patch;maxrev=1819 \
            file://dso_linking_change_build_fix.patch "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
index 5eb5480..4925231 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
@@ -22,7 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://emblem-symbolic-link.png \
 	   file://cross-compile-fix.patch" 
 
-SRC_URI_append_poky = " file://owl-window-menu.patch;patch=1"
+SRC_URI_append_poky = " file://owl-window-menu.patch"
 
 SRC_URI[md5sum] = "4a7fdc0526ed14e3293d784c0ce27dea"
 SRC_URI[sha256sum] = "a9335baf127d133da1b2873b3065545bd278fadd4b33e4b91e3d10b165961b68"
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
index 616fb0e..b5e5b91 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
@@ -20,7 +20,7 @@ bindir = "/usr/games"
 inherit autotools pkgconfig
 
 SRC_URI = "svn://svn.o-hand.com/repos/;module=oh-puzzles;proto=http"
-SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;patch=1;pnum=0 "
+SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
 
 S = "${WORKDIR}/${BPN}"
 
diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index 4f233a2..28f578c 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8e20eece214df8ef953ed5857862150"
 PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
-	   file://makefile.patch;patch=1 \
-           file://libtool-mode.patch;patch=1"
+	   file://makefile.patch \
+           file://libtool-mode.patch"
 
 SRC_URI[md5sum] = "1d1b1d5c0245b1c00aff92da751e9aa1"
 SRC_URI[sha256sum] = "cc340338a2e28b40058ab9eb5354a21d53f88a1582ea21ba0bb185c37a281dc9"
diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
index 9216777..2972c1a 100644
--- a/meta/recipes-support/libpcre/libpcre_8.12.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -9,7 +9,7 @@ PR = "r1"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=77f9b14fe707d0376d89bc162e6c54ff"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
-           file://pcre-cross.patch;patch=1 \
+           file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
 SRC_URI[md5sum] = "f14a9fef3c92f3fc6c5ac92d7a2c7eb3"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index cc64ba7..8cfce0a 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -10,7 +10,7 @@ DEPENDS = "libxml2"
 PR = "r2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
-           file://pkgconfig_fix.patch;patch=1"
+           file://pkgconfig_fix.patch"
 
 SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
 SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
diff --git a/meta/recipes-support/neon/neon_0.29.5.bb b/meta/recipes-support/neon/neon_0.29.5.bb
index f465a4d..4653a28 100644
--- a/meta/recipes-support/neon/neon_0.29.5.bb
+++ b/meta/recipes-support/neon/neon_0.29.5.bb
@@ -9,7 +9,7 @@ DEPENDS = "zlib libxml2 expat time gnutls"
 PR = "r0"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
-           file://pkgconfig.patch;patch=1"
+           file://pkgconfig.patch"
 
 SRC_URI[md5sum] = "ff369e69ef0f0143beb5626164e87ae2"
 SRC_URI[sha256sum] = "dea3c52b9f3f915651c6279c76758acf7c427727e8b9b0130f8b138f24012290"
diff --git a/meta/recipes-support/taglib/taglib_1.6.3.bb b/meta/recipes-support/taglib/taglib_1.6.3.bb
index 63b965c..97980f7 100644
--- a/meta/recipes-support/taglib/taglib_1.6.3.bb
+++ b/meta/recipes-support/taglib/taglib_1.6.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=db979804f025cf55aabec7129cb671ed \
 PR = "r1"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
-           file://configuretweak.patch;patch=1 \
-           file://nolibtool.patch;patch=1"
+           file://configuretweak.patch \
+           file://nolibtool.patch"
 
 SRC_URI[md5sum] = "ddf02f4e1d2dc30f76734df806e613eb"
 SRC_URI[sha256sum] = "a9ba089cc2c6d26d266bad492de31cadaeb878dea858e22ae3196091718f284b"
-- 
1.7.5.4



