Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWMTp-0008C9-7j
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 08:52:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 May 2012 23:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145574243"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2012 23:42:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 23:42:16 -0700
Message-Id: <cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337581961.git.sgw@linux.intel.com>
References: <cover.1337581961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337581961.git.sgw@linux.intel.com>
References: <cover.1337581961.git.sgw@linux.intel.com>
Subject: [RFC v1 1/1] Reorder and -dev
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
X-List-Received-Date: Mon, 21 May 2012 06:52:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/binconfig.bbclass                     |    2 ++
 meta/conf/bitbake.conf                             |    8 +++++---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   10 ++++++++++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    3 ++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +++-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-extended/cups/cups14.inc              |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    4 +++-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 ++--
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 ++++++++++----
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++++++++----
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |    2 +-
 meta/recipes-graphics/freetype/freetype_2.4.8.bb   |    5 +----
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 ++++--
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +---
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 meta/recipes-support/apr/apr_1.4.6.bb              |    2 +-
 meta/recipes-support/curl/curl_7.24.0.bb           |    2 +-
 meta/recipes-support/db/db_5.1.19.bb               |    1 +
 meta/recipes-support/gnutls/gnutls.inc             |    5 ++---
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    2 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 ++---
 meta/recipes-support/icu/icu-3.6.inc               |    2 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    1 +
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 ----
 .../libgpg-error/libgpg-error_1.10.bb              |    6 +-----
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    5 +----
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 ++-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |    5 +----
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +--
 41 files changed, 83 insertions(+), 69 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 3deb541..60012c8 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -1,3 +1,5 @@
+FILES_${PN}-dev += "${bindir}/*-config"
+ 
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
 	s = "-e ''"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7073018..a8485c3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -253,7 +253,7 @@ SOLIBSDEV_darwin = ".dylib"
 SOLIBSDEV_darwin8 = ".dylib"
 SOLIBSDEV_darwin9 = ".dylib"
 
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
 PACKAGES_DYNAMIC = "${PN}-locale-*"
 FILES = ""
 
@@ -261,7 +261,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${BPN} ${libdir}/${BPN}/* \
+            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -272,7 +272,9 @@ SECTION_${PN}-doc = "doc"
 
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
-                ${datadir}/aclocal ${base_libdir}/*.o"
+                ${datadir}/aclocal ${base_libdir}/*.o \
+                ${libdir}/${BPN}/*.la \
+                ${base_libdir}/*${SOLIBSDEV} ${base_libdir}/*.la"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 92d65c1..098b6d4 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -6,8 +6,12 @@ LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
+<<<<<<< Updated upstream
 PR = "r1"
 RDEPENDS_${PN} = "grep"
+=======
+PR = "r2"
+>>>>>>> Stashed changes
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
@@ -20,5 +24,11 @@ do_configure_prepend () {
 	autoreconf -f -i -s
 }
 
+<<<<<<< Updated upstream
 SRC_URI[md5sum] = "1742a556089c36c3a89eb1b957da5a60"
 SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
+=======
+FILES_${PN} += "${libdir}/${BPN}/*"
+FILES_${PN}-dbg += "${libdir}/${BPN}/bin/.debug \
+		    ${datadir}/doc/pm-utils/README.debugging"
+>>>>>>> Stashed changes
diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 427078f..117239c 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 7d97567..20208d7 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,7 +20,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX} ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 340ec99..bb60b57 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r10"
+PR = "r11"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 0b7dfa3..50c5bbe 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
-PR = "r4"
+PR = "r5"
 DEPENDS = "virtual/libiconv"
 DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -51,6 +51,7 @@ do_configure_prepend() {
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
 
 PACKAGES =+ "libgettextlib libgettextsrc"
+FILES_${PN} = "${libdir}/${BPN}/*"
 FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
 FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5685bbe..0d01d0c 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r12"
+PR = "r13"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -60,6 +60,8 @@ FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
+FILES_${PN} += "${libdir}/${BPN}/*"
+
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
                          ${bindir}/envsubst \
diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 2eecbd3..459a70b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -39,7 +39,7 @@ python populate_packages_prepend () {
 
 PACKAGES += "${PN}-utils"
 
-FILES_${PN}-dev += "${bindir}/*-config ${libdir}/xml2Conf.sh"
+FILES_${PN}-dev += "${libdir}/xml2Conf.sh"
 FILES_${PN}-utils += "${bindir}/*"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ae99e2c..2c9ad50 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r8"
+INC_PR = "r9"
 
 inherit autotools binconfig multilib_header
 
diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 7c19682..c819359 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -54,6 +54,7 @@ fakeroot do_install () {
 
    # This directory gets installed with perms 511, which makes packaging fail
    chmod 0711 "${D}/${localstatedir}/run/cups/certs"
+   rmdir ${D}/${libdir}/${BPN}/driver
 }
 
 python do_package_append() {
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index ec555d7..9825138 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r3"
+PR = "r4"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index 6cb72bf..191f78c 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -4,7 +4,7 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -40,5 +40,7 @@ do_install_append_virtclass-native() {
 		-M${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/tmac
 }
 
+FILES_${PN} += "${libdir}/${BPN}/site-tmac \
+                ${libdir}/${BPN}/groffer/"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 40f671e..f17bc0f 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
-PR = "r7"
+PR = "r8"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
@@ -31,6 +31,6 @@ do_install() {
 	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
 }
 
-FILES_${PN} += "${datadir}/slsh/"
+FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 1a5ee05..e2ec92c 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r6"
+PR = "r7"
 
 inherit autotools gnome pkgconfig
 
@@ -38,6 +38,12 @@ pkg_postinst_${PN} () {
 	test -x ${bindir}/glib-compile-schemas && glib-compile-schemas  ${datadir}/glib-2.0/schemas
 }
 
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${base_libdir}/security/*.so"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/ ${base_libdir}/security/*.la"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/ ${base_libdir}/security/.debug"
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
+                ${libdir}/${BPN}/standalone/*.so"
+
+FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
+                    ${libdir}/${BPN}/devel/*.{SOLIBSDEV} \
+                    ${libdir}/${BPN}/standalone/*.la"
+
+FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
+                    ${libdir}/${BPN}/devel/.debug/"
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 5821dc4..6ab63bb 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
@@ -12,12 +12,16 @@ PARALLEL_MAKEINST=""
 
 inherit gnome pkgconfig
 
-FILES_${PN} += "${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug/ ${libdir}/gthumb/extensions/.debug/"
-
 SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
 SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
 
 do_install_append () {
 	rm ${D}${libdir}/${BPN}/extensions/*.a
 }
+
+FILES_${PN} += "${datadir}/icons"
+FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
+                ${libdir}/${BPN}/extensions/*.extension"
+FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
+FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
+
diff --git a/meta/recipes-graphics/directfb/directfb_1.4.15.bb b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
index 98d6b82..955bc96 100644
--- a/meta/recipes-graphics/directfb/directfb_1.4.15.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
@@ -1,7 +1,7 @@
 require directfb.inc
 
 RV = "1.4-6"
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "sysfsutils"
 
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.8.bb b/meta/recipes-graphics/freetype/freetype_2.4.8.bb
index bce01cf..2a14090 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.8.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.8.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
 
 SECTION = "libs"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
@@ -49,8 +49,5 @@ do_compile_prepend() {
 	${BUILD_CC} -o objs/apinames src/tools/apinames.c
 }
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev += "${bindir}"
-
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 8b39442..2c7a5cc 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -18,7 +18,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            tslib"
 DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index b128d77..b51339e 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
@@ -35,7 +35,9 @@ PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
 PACKAGES =+ "alsa-server${PKGSUFFIX} libasound${PKGSUFFIX} alsa-conf-base${PKGSUFFIX} alsa-conf${PKGSUFFIX} alsa-doc${PKGSUFFIX} alsa-dev${PKGSUFFIX}"
-FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
+FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
+FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debu*"
+FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound${PKGSUFFIX} = "${libdir}/libasound.so.*"
 FILES_alsa-server${PKGSUFFIX} = "${bindir}/*"
 FILES_alsa-conf${PKGSUFFIX} = "${datadir}/alsa/"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
index c24e691..d33a9f5 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
                     file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
 DEPENDS = "zlib"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
@@ -18,8 +18,6 @@ inherit autotools binconfig pkgconfig
 PACKAGES =+ "${PN}12"
 
 FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev += " ${bindir} ${sbindir}"
 RPROVIDES_${PN}-dev += "${PN}12-dev"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index deb608f..de535ef 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index c0ab4f1..1280040 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
index 12e95c9..73fc7e5 100644
--- a/meta/recipes-support/curl/curl_7.24.0.bb
+++ b/meta/recipes-support/curl/curl_7.24.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
diff --git a/meta/recipes-support/db/db_5.1.19.bb b/meta/recipes-support/db/db_5.1.19.bb
index 7e84646..6fc2a31 100644
--- a/meta/recipes-support/db/db_5.1.19.bb
+++ b/meta/recipes-support/db/db_5.1.19.bb
@@ -49,6 +49,7 @@ PACKAGES += " ${PN}-bin"
 
 # Package contents
 FILES_${PN} = "${libdir}/libdb-5*so*"
+FILES_${PN}-dev = "${includedir} ${libdir}/*.la ${libdir}/libdb.so"
 FILES_${PN}-bin = "${bindir}/*"
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index f489fb6..b16dd21 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -37,7 +37,6 @@ do_configure_prepend() {
 
 PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-bin ${PN}-xx"
 
-FILES_${PN} = "${libdir}/libgnutls.so.*"
 FILES_${PN}-bin = "${bindir}/gnutls-serv \
                    ${bindir}/gnutls-cli \
                    ${bindir}/srptool \
@@ -46,7 +45,7 @@ FILES_${PN}-bin = "${bindir}/gnutls-serv \
                    ${bindir}/certtool \
                    ${bindir}/gnutls-srpcrypt"
 
-FILES_${PN}-dev += "${bindir}/*-config ${bindir}/gnutls-cli-debug"
+FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES_${PN}-extra = "${libdir}/libgnutls-extra.so.*"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
index aae409e..487fba7 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
 
diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
index 4bcb57a..a476ab7 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
 SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
 DEPENDS = "libgpg-error libassuan pth"
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
@@ -24,8 +24,7 @@ inherit autotools binconfig
 PACKAGES =+ "${PN}-pth ${PN}-pthread"
 FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
-FILES_${PN} = "${libdir}/libgpgme.so.*"
-FILES_${PN}-dev += "${bindir}/gpgme-config ${datadir}/common-lisp/source/gpgme/*"
+FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
 do_install_append() {
 	rmdir ${D}/usr/libexec
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index e3f9dd2..23447d3 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -46,6 +46,8 @@ do_install_append() {
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
 
+FILES_${PN}-dev += "${libdir}/${BPN}/"
+
 FILES_libicudata = "${libdir}/libicudata.so.*"
 FILES_libicuuc = "${libdir}/libicuuc.so.*"
 FILES_libicui18n = "${libdir}/libicui18n.so.*"
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
index f5a3d8c..d7be522 100644
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ b/meta/recipes-support/icu/icu_3.6.bb
@@ -1,6 +1,6 @@
 require icu-3.6.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
 SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
diff --git a/meta/recipes-support/libassuan/libassuan_2.0.3.bb b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
index 2a8963e..822d0c8 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/assuan.c;endline=20;md5=fbd7f2a44aab170430d59380f94f85f8 \
                     file://src/assuan-defs.h;endline=20;md5=20cd55535260ca1779edae5c7b80b21e"
+PR = "r1"
 
 DEPENDS = "libgpg-error"
 
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index a890188..5f06315 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -28,8 +28,4 @@ do_install_append() {
 
 ARM_INSTRUCTION_SET = "arm"
 
-# move libgcrypt-config into -dev package
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir} ${libdir}/pkgconfig/*.pc"
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
index 95f9e56..89be05b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
@@ -18,10 +18,6 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "736a03daa9dc5873047d4eb4a9c22a16"
 SRC_URI[sha256sum] = "520629b4568b5c29b1991c8ffc267c8bdee5f223c7333c42a651b56f9b1c5431"
 
-# move libgpg-error-config into -dev package
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/*"
-
 inherit autotools binconfig pkgconfig gettext
 
 do_install_append() {
diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
index 1d8d287..4e8c326 100644
--- a/meta/recipes-support/libksba/libksba_1.2.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 DEPENDS = "libgpg-error"
+PR = "r1"
 
 inherit autotools binconfig
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.21.bb
index f5fa4ef..206a556 100644
--- a/meta/recipes-support/libpcre/libpcre_8.21.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
@@ -5,7 +5,7 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r1"
+PR = "r2"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=2f00d186a775c8002422a5315079d96b"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
@@ -50,7 +50,4 @@ python populate_packages_prepend () {
 	do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.+', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True)
 }
 
-FILES_${PN} = "${libdir}/libpcre.so.*"
-FILES_${PN}-dev += "${bindir}/*"
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index e3721a8..7e3cf27 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -23,8 +23,9 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
 	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
 
+FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
 FILES_${PN}-dev += "${datadir}/cmake"
-FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
+FILES_${PN}-dbg += "${libdir}/${BPN}/${PV}/plugins/.debug/ ${libdir}/${BPN}/${PV}/modules/.debug/"
 
 do_configure_prepend() {
 	export HOST_SYS=${HOST_SYS}
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
index 893bd68..98d6a9a 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
@@ -16,7 +16,7 @@ PROVIDES = "libusb virtual/libusb0"
 BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
            file://0.1.0-beta1-gcc3.4-fix.patch"
@@ -34,5 +34,3 @@ do_install_append() {
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
 }
-
-FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 8986e20..ac3975c 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.29.6.bb
index 170a47c..abf26ef 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r2"
+PR = "r3"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 61865b7..e9ee2f0 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222cafd37f24370a77b1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz"
 
@@ -18,6 +18,3 @@ do_configure() {
 	gnu-configize
 	oe_runconf
 }
-
-FILES_${PN} = "${libdir}/libpth.so.*"
-FILES_${PN}-dev += "${bindir}/pth-config"
diff --git a/meta/recipes-support/taglib/taglib_1.6.3.bb b/meta/recipes-support/taglib/taglib_1.6.3.bb
index 97980f7..bda7d02 100644
--- a/meta/recipes-support/taglib/taglib_1.6.3.bb
+++ b/meta/recipes-support/taglib/taglib_1.6.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=db979804f025cf55aabec7129cb671ed \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=39dcdd772f378a0f8c9a41bc929eccce"
 
-PR = "r1"
+PR = "r2"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
            file://configuretweak.patch \
@@ -20,7 +20,6 @@ S = "${WORKDIR}/taglib-${PV}"
 inherit autotools pkgconfig binconfig
 
 PACKAGES =+ "${PN}-c"
-FILES_${PN}-dbg += "${bindir}/taglib-config"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
 do_configure_prepend () {
-- 
1.7.7.6



