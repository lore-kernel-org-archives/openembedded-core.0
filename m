Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8247E731F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:59:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0M1xU80013626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:59:30 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 17:59:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 17:59:29 -0800
Message-ID: <7c60a8094ba098006166f4b2eb8f23b6891c7e7e.1453427939.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453427939.git.liezhi.yang@windriver.com>
References: <cover.1453427939.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta: cleanup PACKAGECONFIG ??= ""
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
X-List-Received-Date: Fri, 22 Jan 2016 01:59:32 -0000
Content-Type: text/plain

The base.bbclass can handle PACKAGECONFIG well when it is not set, so
PACKAGECONFIG ??= "" isn't useful here, but there are a lot of them,
which may mislead the newbie that it is a must.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc                    |    1 -
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |    1 -
 meta/recipes-devtools/gdb/gdb_7.10.1.bb            |    1 -
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    1 -
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    1 -
 meta/recipes-devtools/opkg/opkg_0.3.1.bb           |    2 --
 .../python/python-imaging_1.1.7.bb                 |    1 -
 meta/recipes-devtools/ruby/ruby_2.2.2.bb           |    1 -
 meta/recipes-extended/mc/mc_4.8.15.bb              |    1 -
 meta/recipes-extended/minicom/minicom_2.7.bb       |    1 -
 meta/recipes-extended/screen/screen_4.3.1.bb       |    1 -
 meta/recipes-extended/sudo/sudo.inc                |    1 -
 meta/recipes-extended/tar/tar_1.28.bb              |    1 -
 meta/recipes-extended/wget/wget.inc                |    1 -
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    1 -
 meta/recipes-graphics/directfb/directfb.inc        |    1 -
 meta/recipes-graphics/piglit/piglit_git.bb         |    1 -
 meta/recipes-graphics/wayland/libinput_1.1.4.bb    |    1 -
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |    1 -
 .../recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb |    1 -
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb   |    1 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    1 -
 .../xorg-proto/xorg-proto-common.inc               |    1 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    1 -
 meta/recipes-multimedia/webp/libwebp_0.5.0.bb      |    1 -
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc    |    1 -
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    1 -
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    1 -
 meta/recipes-support/boost/boost.inc               |    1 -
 meta/recipes-support/gmp/gmp.inc                   |    1 -
 .../gnome-desktop-testing_2014.1.bb                |    1 -
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    1 -
 meta/recipes-support/gnupg/gnupg_2.1.10.bb         |    1 -
 meta/recipes-support/libevent/libevent_2.0.22.bb   |    1 -
 meta/recipes-support/libunwind/libunwind.inc       |    1 -
 36 files changed, 37 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a8c41f8..f8848dc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -39,7 +39,6 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
 inherit autotools gettext texinfo
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
 
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index f8c0ebe..12d7beb 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -19,7 +19,6 @@ inherit autotools pkgconfig gettext
 
 #default disable regression tests, some unit test code in non testing code
 #PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index c82e99a..d283b63 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -18,7 +18,6 @@ EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/gdb/gdb_7.10.1.bb b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
index cd52e27..23171dc 100644
--- a/meta/recipes-devtools/gdb/gdb_7.10.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
@@ -3,7 +3,6 @@ require gdb-${PV}.inc
 
 inherit python-dir
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index c284a71..d27f1b9 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -46,7 +46,6 @@ EXTRA_OECONF = "--without-x"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[libbsd] = "ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
 
 do_install_prepend () {
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index bc9b79c..b466891 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF = "--without-x"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[libbsd] = "ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
 
 do_install_prepend () {
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.1.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
index 577f495..67a88d3 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -29,8 +29,6 @@ SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= ""
-
 PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index a678328..f26f56b 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -17,7 +17,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 # There isn't enable/disable option, and lcms is in meta-oe, at least make it explicit when enabled
 # setup.py already has FIXME: add mechanism to explicitly *disable* the use of a library
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[lcms] = ",,lcms"
 
 inherit distutils
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
index 9b807a7..0c3b992 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b11
 # 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb b/meta/recipes-extended/mc/mc_4.8.15.bb
index 6c3a16a..11cf95a 100644
--- a/meta/recipes-extended/mc/mc_4.8.15.bb
+++ b/meta/recipes-extended/mc/mc_4.8.15.bb
@@ -16,7 +16,6 @@ inherit autotools gettext pkgconfig
 #
 # Both Samba (smb) and sftp require package delivered from meta-openembedded
 #
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index 3118686..8c95bc5 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -17,7 +17,6 @@ SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626
 
 UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
 
 inherit autotools gettext pkgconfig
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
index 00d878b..657e98c 100644
--- a/meta/recipes-extended/screen/screen_4.3.1.bb
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -32,7 +32,6 @@ SRC_URI[sha256sum] = "fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915
 
 inherit autotools texinfo
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
 
 EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a25876b..0f271a5 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
 
 inherit autotools
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
 CONFFILES_${PN} = "${sysconfdir}/sudoers"
diff --git a/meta/recipes-extended/tar/tar_1.28.bb b/meta/recipes-extended/tar/tar_1.28.bb
index 8816000..d08abf4 100644
--- a/meta/recipes-extended/tar/tar_1.28.bb
+++ b/meta/recipes-extended/tar/tar_1.28.bb
@@ -1,6 +1,5 @@
 require tar.inc
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[acl] = "--with-posix-acls, --without-posix-acls, acl,"
 
 LICENSE = "GPLv3"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 049b898..662925b 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -20,5 +20,4 @@ RRECOMMENDS_${PN} += "ca-certificates"
 
 BBCLASSEXTEND += "nativesdk"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index cd1df1a..5bf733b 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
                 --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
 
 # Disable PolicyKit by default
-PACKAGECONFIG ??= ""
 # We really don't want PolicyKit for native or uclibc
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_libc-uclibc = ""
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 603aba3..725deb2 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -29,7 +29,6 @@ BINCONFIG = "${bindir}/directfb-config"
 
 inherit autotools binconfig-disabled pkgconfig
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
 PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
 PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e0bd1fe..d04bb28 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,6 @@ inherit cmake pythonnative distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
 do_configure_prepend() {
diff --git a/meta/recipes-graphics/wayland/libinput_1.1.4.bb b/meta/recipes-graphics/wayland/libinput_1.1.4.bb
index 4167679..8ceea7f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.1.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.1.4.bb
@@ -15,7 +15,6 @@ SRC_URI[sha256sum] = "302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index 5049b7e..f7d9bf7 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -23,5 +23,4 @@ BBCLASSEXTEND = "native"
 SRC_URI[md5sum] = "addfb1e897ca8079531669c7c7711726"
 SRC_URI[sha256sum] = "8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
index c0d0148..d397bd0 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb
@@ -16,4 +16,3 @@ SRC_URI[sha256sum] = "cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8a
 
 EXTRA_OECONF += "--disable-xlocale"
 
-PACKAGECONFIG ??= ""
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
index f4e30d9..92a01b9 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
@@ -25,5 +25,4 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI[md5sum] = "18aa5c1279b01f9d18e3299969665b2e"
 SRC_URI[sha256sum] = "81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 6f4e444..2a10be1 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -15,7 +15,6 @@ inherit autotools distro_features_check pkgconfig
 
 EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0returnsnull \
diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 7a417c9..ec5c4b6 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -18,7 +18,6 @@ EXTRA_OECONF = "--without-fop"
 
 UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto --with-xmlto"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 97064b8..b6af243 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -20,7 +20,6 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 
 inherit autotools gettext pkgconfig
diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.0.bb b/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
index c89adac..ce64c99 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
@@ -29,7 +29,6 @@ EXTRA_OECONF = " \
 
 inherit autotools lib_package
 
-PACKAGECONFIG ??= ""
 
 # libwebpdecoder is a subset of libwebp, don't build it unless requested
 PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 04a43c0..42a8f75 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -30,7 +30,6 @@ EXTRA_OECONF = "--enable-xim \
 		--enable-combining --disable-perl \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
 
 do_configure_prepend () {
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 5a23754..69c9d43 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
 SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
 
 PACKAGES += "libaspell libpspell aspell-utils"
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 1e626f1..b8b91b7 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -33,7 +33,6 @@ do_install_append() {
 
 EXTRA_OECONF = "--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[cplusplus] = "--with-cplusplus,--without-cplusplus,icu"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 981e6ee..8734c86 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -24,7 +24,6 @@ BOOST_LIBS = "\
 	"
 
 # optional boost-python library
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = ",,python python3"
 BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)}"
 inherit python-dir
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 6752a39..3d25c10 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -12,5 +12,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index ccb3d3b..0f3250a 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -18,5 +18,4 @@ inherit autotools pkgconfig
 
 PR = "r1"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[journald] = "--with-systemd-journal,--without-systemd-journal,systemd,systemd"
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index b4ccbfe..74a5916 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -99,6 +99,5 @@ FILES_gpgv = "${bindir}/gpgv"
 # Exclude debug files from the main packages
 FILES_${PN} = "${bindir}/* ${datadir}/${BPN} ${libexecdir}/${BPN}/*"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[curl] = "--with-libcurl=${STAGING_LIBDIR},--without-libcurl,curl"
 PACKAGECONFIG[libusb] = "--with-libusb=${STAGING_LIBDIR},--without-libusb,libusb-compat"
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.10.bb b/meta/recipes-support/gnupg/gnupg_2.1.10.bb
index 5a4f2e8..a6c8bda 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.10.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.10.bb
@@ -41,5 +41,4 @@ do_install_append() {
 
 RDEPENDS_${PN} = "gnutls"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
index df8a31c..5df2acd 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -18,7 +18,6 @@ UPSTREAM_CHECK_URI = "http://libevent.org/"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
 inherit autotools
diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 068858b..fad95c1 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -9,7 +9,6 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
 inherit autotools
 
-PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
 
 EXTRA_OECONF_arm = "--enable-debug-frame"
-- 
1.7.9.5


