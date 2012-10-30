Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lm-0002qi-1y
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TYsn028862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:34 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:45 +0800
Message-ID: <04facf0ad9e9b48a7315ca062ef63cae8a0453e9.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 04/11] recipes-core: replace virtclass-native(sdk) with class-native(sdk)
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
X-List-Received-Date: Tue, 30 Oct 2012 09:43:14 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb      |  4 ++--
 meta/recipes-core/coreutils/coreutils_8.14.bb     |  4 ++--
 meta/recipes-core/dbus/dbus-glib.inc              |  4 ++--
 meta/recipes-core/dbus/dbus.inc                   | 12 ++++++------
 meta/recipes-core/eglibc/eglibc-initial.inc       |  2 +-
 meta/recipes-core/eglibc/eglibc.inc               |  6 +++---
 meta/recipes-core/eglibc/eglibc_2.16.bb           |  2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb       |  4 ++--
 meta/recipes-core/gettext/gettext_0.18.1.1.bb     |  6 +++---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb     |  6 +++---
 meta/recipes-core/glib-2.0/glib.inc               |  6 +++---
 meta/recipes-core/jpeg/jpeg_8d.bb                 |  2 +-
 meta/recipes-core/libxml/libxml2.inc              |  6 +++---
 meta/recipes-core/ncurses/ncurses.inc             |  4 ++--
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb |  2 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb    |  2 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb         |  2 +-
 meta/recipes-core/uclibc/uclibc_git.bb            |  2 +-
 meta/recipes-core/util-linux/util-linux.inc       |  6 +++---
 meta/recipes-core/util-linux/util-linux_2.21.2.bb |  2 +-
 20 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 20d8120..ffdd2af 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
 PR = "r3"
 DEPENDS = "coreutils-native-${PV}"
-DEPENDS_virtclass-native = "gettext-native"
+DEPENDS_class-native = "gettext-native"
 
 inherit autotools gettext
 
@@ -28,7 +28,7 @@ SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            "
 
 SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
-SRC_URI_virtclass-native = "${SRC_URI_BASE}"
+SRC_URI_class-native = "${SRC_URI_BASE}"
 
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
 SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 178bd67..3f58cfd 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
 PR = "r5"
 DEPENDS = "gmp libcap"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 inherit autotools gettext
 
@@ -21,7 +21,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
 
-EXTRA_OECONF_virtclass-native = "--without-gmp"
+EXTRA_OECONF_class-native = "--without-gmp"
 
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 3469a4f..dff30c7 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
 SECTION = "base"
 
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
-DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
+DEPENDS_class-native = "glib-2.0-native dbus-native"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
@@ -24,7 +24,7 @@ PACKAGECONFIG[tests] = "--enable-tests,,,"
 
 EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
-EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
+EXTRA_OECONF_class-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
 PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
 
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 550eb0a..d165cdd 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
 X11DEPENDS = "virtual/libx11 libsm"
 DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
+DEPENDS_class-native = "expat-native virtual/libintl-native"
+DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
 
 INC_PR = "r5"
 
@@ -34,7 +34,7 @@ DEBIANNAME_${PN} = "dbus-1"
 PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
 OLDPKGNAME = "dbus-x11"
-OLDPKGNAME_virtclass-nativesdk = ""
+OLDPKGNAME_class-nativesdk = ""
 
 # for compatibility
 RPROVIDES_${PN} = "${OLDPKGNAME}"
@@ -64,7 +64,7 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--without-x --disable-x11-autolaunch"
+EXTRA_OECONF_X_class-native = "--without-x --disable-x11-autolaunch"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
@@ -105,7 +105,7 @@ do_install() {
 	ln -sf /dev/null ${D}/${systemd_unitdir}/system/dbus-1.service
 }
 
-do_install_virtclass-native() {
+do_install_class-native() {
 	autotools_do_install
 
 	# for dbus-glib-native introspection generation
@@ -117,7 +117,7 @@ do_install_virtclass-native() {
 	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
 }
 
-do_install_virtclass-nativesdk() {
+do_install_class-nativesdk() {
 	autotools_do_install
 }
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 1520efd..c1a090e 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -7,7 +7,7 @@ PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 do_configure () {
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index e1ec6b2..3d136bf 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ require eglibc-ld.inc
 require eglibc-testing.inc
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
@@ -39,7 +39,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
 		       "
 
 GLIBC_EXTRA_OECONF ?= ""
-GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
+GLIBC_EXTRA_OECONF_class-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
 ARM_INSTRUCTION_SET = "arm"
@@ -68,4 +68,4 @@ do_configure_append() {
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
-GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
+GLIBC_ADDONS_class-nativesdk = "${SDK_GLIBC_ADDONS}"
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 56a0a38..aa9256c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -37,7 +37,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
 
-SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
+SRC_URI_append_class-nativesdk = " file://ld-search-order.patch \
             file://relocatable_sdk.patch \
             "
 S = "${WORKDIR}/eglibc-${PV}/libc"
diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 00045d5..db8314b 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
 PR = "r6"
 DEPENDS = "virtual/libiconv"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
-PROVIDES_virtclass-native = ""
+PROVIDES_class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://gettext-vpath.patch \
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 0f6f068..c3265e1 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PR = "r18"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
-DEPENDS_virtclass-native = "gettext-minimal-native"
+DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
-PROVIDES_virtclass-native = "virtual/gettext-native"
+PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
@@ -100,7 +100,7 @@ do_install_append() {
     rm -f ${D}${libdir}/preloadable_libintl.so
 }
 
-do_install_append_virtclass-native () {
+do_install_append_class-native () {
 	rm ${D}${datadir}/aclocal/*
 	rm ${D}${datadir}/gettext/config.rpath
 	rm ${D}${datadir}/gettext/po/Makefile.in.in
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 10c0b61..22c6c7b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -4,8 +4,8 @@ PR = "r6"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
-DEPENDS_virtclass-native += "libffi-native python-argparse-native"
-DEPENDS_virtclass-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
+DEPENDS_class-native += "libffi-native python-argparse-native"
+DEPENDS_class-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
 SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
 
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
 do_configure_prepend() {
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8b099f2..6e2b5d2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -14,8 +14,8 @@ BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
 DEPENDS = "glib-2.0-native zip virtual/libiconv"
-DEPENDS_virtclass-native = "pkgconfig-native gettext-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-libtool"
+DEPENDS_class-native = "pkgconfig-native gettext-native"
+DEPENDS_class-nativesdk = "nativesdk-libtool"
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
@@ -28,7 +28,7 @@ S = "${WORKDIR}/glib-${PV}"
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
-EXTRA_OECONF_virtclass-native = "${CORECONF}"
+EXTRA_OECONF_class-native = "${CORECONF}"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index 6781619..eba5bf4 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;md5=4f46756b064c225fae088903300e5c98"
 SECTION = "libs"
 
 DEPENDS = "libtool-cross"
-DEPENDS_virtclass-native = "libtool-native"
+DEPENDS_class-native = "libtool-native"
 
 PR = "r1"
 
diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 68437ae..9ec507b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
-DEPENDS_virtclass-native = "python-native"
+DEPENDS_class-native = "python-native"
 DEPENDS =+ "zlib"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
@@ -25,8 +25,8 @@ do_configure_prepend () {
 }
 
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_virtclass-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_virtclass-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
 
 # required for pythong binding
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index cce080d..24b19c7 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 INC_PR = "r12"
 
 inherit autotools binconfig multilib_header
@@ -27,7 +27,7 @@ ENABLE_WIDEC ?= "true"
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
 # natives don't generally look in base_libdir
-base_libdir_virtclass-native = "${libdir}"
+base_libdir_class-native = "${libdir}"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
index 211d530..22f56de 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
@@ -9,7 +9,7 @@ PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 
 do_install() {
 	# Install initial headers into the cross dir
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index 6fd7529..c0b7d52 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -9,7 +9,7 @@ PACKAGES = ""
 PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 
 do_install() {
 	# Install initial headers into the cross dir
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index 8deedd3..4071d2a 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -5,7 +5,7 @@ require uclibc-package.inc
 require uclibc-${PV}.inc
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index e8a6d68..a66656d 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -3,7 +3,7 @@ require uclibc-package.inc
 require uclibc-git.inc
 
 STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
 
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d62d406..f2f9a04 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
 
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
-DEPENDS_append_virtclass-native = " lzo-native"
+DEPENDS_append_class-native = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
@@ -73,8 +73,8 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
-RRECOMMENDS_${PN}_virtclass-native = ""
-RDEPENDS_${PN}_virtclass-native = ""
+RRECOMMENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 do_compile () {
 	set -e
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index e64ebe9..24bed27 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -40,4 +40,4 @@ do_remove_lscpu() {
 addtask remove_lscpu before do_configure after do_patch
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
-EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.7.11.2



