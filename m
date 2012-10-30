Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Ln-0002rN-Cm
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TZGa028865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:35 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:46 +0800
Message-ID: <f61fc0f110760b66e72100fb7cfe6bba86b1b50e.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 05/11] recipes-devtools: replace virtclass-native(sdk) with class-native(sdk)
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
 meta/recipes-devtools/autoconf/autoconf.inc                  |  6 +++---
 meta/recipes-devtools/autoconf/autoconf_2.69.bb              |  2 +-
 meta/recipes-devtools/automake/automake_1.12.3.bb            |  8 ++++----
 meta/recipes-devtools/binutils/binutils_2.22.bb              |  4 ++--
 meta/recipes-devtools/bison/bison_2.3.bb                     |  6 +++---
 meta/recipes-devtools/bison/bison_2.5.1.bb                   |  6 +++---
 meta/recipes-devtools/chrpath/chrpath_0.14.bb                |  4 ++--
 meta/recipes-devtools/dpkg/dpkg.inc                          | 10 +++++-----
 meta/recipes-devtools/elfutils/elfutils_0.148.bb             |  6 +++---
 meta/recipes-devtools/file/file_5.11.bb                      |  4 ++--
 meta/recipes-devtools/flex/flex.inc                          |  2 +-
 meta/recipes-devtools/git/git.inc                            |  4 ++--
 meta/recipes-devtools/gnu-config/gnu-config_20120814.bb      |  2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb           |  2 +-
 meta/recipes-devtools/guile/guile_2.0.6.bb                   |  2 +-
 meta/recipes-devtools/insserv/insserv_1.14.0.bb              |  2 +-
 meta/recipes-devtools/intltool/intltool.inc                  |  8 ++++----
 meta/recipes-devtools/intltool/intltool_0.50.0.bb            |  2 +-
 meta/recipes-devtools/opensp/opensp_1.5.2.bb                 |  4 ++--
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb           |  4 ++--
 meta/recipes-devtools/opkg/opkg.inc                          |  8 ++++----
 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb        |  2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb                    |  2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc                |  8 ++++----
 meta/recipes-devtools/pseudo/pseudo.inc                      | 12 ++++++------
 meta/recipes-devtools/python/python-pygobject_2.27.91.bb     |  4 ++--
 meta/recipes-devtools/python/python-setuptools_0.6c11.bb     |  2 +-
 meta/recipes-devtools/python/python_2.7.3.bb                 |  2 +-
 meta/recipes-devtools/qemu/qemu.inc                          | 12 ++++++------
 meta/recipes-devtools/qemu/qemu_1.2.0.bb                     |  6 +++---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb                       |  6 +++---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb                  |  2 +-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb                    |  6 +++---
 .../unfs-server/unfs-server_2.1+2.2beta47.bb                 |  4 ++--
 34 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index ff375cd..2c46117 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -6,8 +6,8 @@ LICENSE = "GPLv3"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS += "m4-native"
-DEPENDS_virtclass-native = "m4-native gnu-config-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
+DEPENDS_class-native = "m4-native gnu-config-native"
+DEPENDS_class-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 RDEPENDS_${PN} = "m4 gnu-config \
 		  perl \
 		  perl-module-carp \
@@ -25,7 +25,7 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-io-file \
 		  perl-module-posix \
 		 "
-RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index a4afd33..730c89e 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -21,7 +21,7 @@ SRC_URI += "file://autoreconf-include.patch \
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
 SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
 
-SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
+SRC_URI_append_class-native = " file://fix_path_xtra.patch"
 
 EXTRA_OECONF += "ac_cv_path_M4=m4"
 
diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb b/meta/recipes-devtools/automake/automake_1.12.3.bb
index 362500c..aaa5ee5 100644
--- a/meta/recipes-devtools/automake/automake_1.12.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
@@ -1,7 +1,7 @@
 require automake.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
-DEPENDS_virtclass-native = "autoconf-native"
+DEPENDS_class-native = "autoconf-native"
 
 RDEPENDS_${PN} += "\
     autoconf \
@@ -14,11 +14,11 @@ RDEPENDS_${PN} += "\
     perl-module-threads \
     perl-module-vars "
 
-RDEPENDS_${PN}_virtclass-native = "autoconf-native perl-native-runtime"
+RDEPENDS_${PN}_class-native = "autoconf-native perl-native-runtime"
 
 PATHFIXPATCH = "file://path_prog_fixes.patch"
-PATHFIXPATCH_virtclass-native = ""
-PATHFIXPATCH_virtclass-nativesdk = ""
+PATHFIXPATCH_class-native = ""
+PATHFIXPATCH_class-nativesdk = ""
 
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index b8250d8..17eeb9c 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -8,9 +8,9 @@ EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-shared \
                 "
 
-EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
+EXTRA_OECONF_class-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
 
-do_install_virtclass-native () {
+do_install_class-native () {
 	autotools_do_install
 
 	# Install the libiberty header
diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 86edf3e..027782c 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -19,8 +19,8 @@ SRC_URI = "${BASE_SRC_URI}"
 SRC_URI[md5sum] = "22327efdd5080e2b1acb6e560a04b43a"
 SRC_URI[sha256sum] = "52f78aa4761a74ceb7fdf770f3554dd84308c3b93c4255e3a5c17558ecda293e"
 
-DEPENDS_virtclass-native = "gettext-native"
-SRC_URI_virtclass-native = "${BASE_SRC_URI}"
+DEPENDS_class-native = "gettext-native"
+SRC_URI_class-native = "${BASE_SRC_URI}"
 
 inherit autotools gettext
 acpaths = "-I ${S}/m4"
@@ -30,7 +30,7 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/runtime-po/
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/bison \
 		M4=${STAGING_BINDIR_NATIVE}/m4 \
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
diff --git a/meta/recipes-devtools/bison/bison_2.5.1.bb b/meta/recipes-devtools/bison/bison_2.5.1.bb
index 47b4a6c..5fe5113 100644
--- a/meta/recipes-devtools/bison/bison_2.5.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.1.bb
@@ -21,13 +21,13 @@ SRC_URI[md5sum] = "8fedf916f1aa2c4a31441d8f8bbc603c"
 SRC_URI[sha256sum] = "48dc3649231b75ac160d73528000ec89b6cd8d3b87cb7d0713f72ef4610442d4"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt "
-DEPENDS_virtclass-native = "gettext-minimal-native"
-SRC_URI_virtclass-native = "${BASE_SRC_URI}"
+DEPENDS_class-native = "gettext-minimal-native"
+SRC_URI_class-native = "${BASE_SRC_URI}"
 
 inherit autotools gettext
 acpaths = "-I ${S}/m4"
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/bison \
 		M4=${STAGING_BINDIR_NATIVE}/m4 \
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
index bb9b4b6..533e974 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.14.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
@@ -18,9 +18,9 @@ inherit autotools
 
 # We don't have a staged chrpath-native for ensuring our binary is
 # relocatable, so use the one we've just built
-CHRPATH_BIN_virtclass-native = "${S}/chrpath"
+CHRPATH_BIN_class-native = "${S}/chrpath"
 
-PROVIDES_append_virtclass-native = " chrpath-replacement-native"
+PROVIDES_append_class-native = " chrpath-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 723d1b2..27f69ef 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -8,9 +8,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
            file://ignore_extra_fields.patch"
 
 DEPENDS = "zlib bzip2 perl"
-DEPENDS_virtclass-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
+DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
@@ -19,7 +19,7 @@ PARALLEL_MAKE = ""
 inherit autotools gettext perlnative
 
 export PERL_LIBDIR = "${libdir}/perl"
-PERL_LIBDIR_virtclass-native = "${libdir}/perl-native/perl"
+PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
 
 EXTRA_OECONF = "--without-static-progs \
 		--without-dselect \
@@ -58,7 +58,7 @@ do_install_append () {
 
 # Create a wrapper for the perl script to avoid the "bad interpreter"
 # error when the tmpdir is longer than 150.
-do_install_append_virtclass-native () {
+do_install_append_class-native () {
 	tmp=`find ${D}${bindir} -type f -exec grep -m 1 -l '#!/.*/perl-native/perl' {} \;`
 	for i in $tmp; do
 		create_wrapper $i ${STAGING_BINDIR_NATIVE}/perl-native/perl
@@ -66,7 +66,7 @@ do_install_append_virtclass-native () {
 }
 
 PROV = "virtual/update-alternatives"
-PROV_virtclass-native = ""
+PROV_class-native = ""
 
 PROVIDES += "${PROV}"
 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 5d45f3a..45931b0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -46,7 +46,7 @@ SRC_URI += "\
 inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
-EXTRA_OECONF_append_virtclass-native = " --without-bzlib"
+EXTRA_OECONF_append_class-native = " --without-bzlib"
 EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_configure_prepend() {
@@ -60,8 +60,8 @@ do_configure_prepend() {
 # build only libelf for uclibc case
 
 EXTRA_OEMAKE_libc-uclibc = "-C libelf"
-EXTRA_OEMAKE_virtclass-native = ""
-EXTRA_OEMAKE_virtclass-nativesdk = ""
+EXTRA_OEMAKE_class-native = ""
+EXTRA_OEMAKE_class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/file/file_5.11.bb b/meta/recipes-devtools/file/file_5.11.bb
index 540c2b2..be6a863 100644
--- a/meta/recipes-devtools/file/file_5.11.bb
+++ b/meta/recipes-devtools/file/file_5.11.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
 
 DEPENDS = "zlib file-native"
-DEPENDS_virtclass-native = "zlib-native"
+DEPENDS_class-native = "zlib-native"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
@@ -29,7 +29,7 @@ do_configure_prepend() {
 
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_cmdline_wrapper ${D}/${bindir}/file \
 		--magic-file ${datadir}/misc/magic.mgc
 }
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 01f7571..472813b 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -10,6 +10,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
 
 inherit autotools gettext
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
 }
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4a0c4aa..55e1482 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "openssl curl zlib expat"
 
-PROVIDES_append_virtclass-native = " git-replacement-native"
+PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
@@ -31,7 +31,7 @@ do_install () {
 	rm -rf ${D}${libdir}/perl-native
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/git \
 		GIT_EXEC_PATH=${libexecdir}/git-core \
 		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index dd9248f..97c66b3 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=b79a4663475f4d724846463277817e0d"
 
-DEPENDS_virtclass-native = "perl-native-runtime"
+DEPENDS_class-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 73efbb0..8112690 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=0e6ca0501b27177f3bc640f7225e3ead"
 
-DEPENDS_virtclass-native = "perl-native-runtime"
+DEPENDS_class-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-devtools/guile/guile_2.0.6.bb b/meta/recipes-devtools/guile/guile_2.0.6.bb
index a9df4f7..b5f55af 100644
--- a/meta/recipes-devtools/guile/guile_2.0.6.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.6.bb
@@ -56,7 +56,7 @@ do_compile_append() {
 	fi
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
 
 	create_wrapper ${D}/${bindir}/guile \
diff --git a/meta/recipes-devtools/insserv/insserv_1.14.0.bb b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
index c424a15..1d1f59d 100644
--- a/meta/recipes-devtools/insserv/insserv_1.14.0.bb
+++ b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
@@ -21,7 +21,7 @@ do_install () {
 	install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
 }
 
-do_install_virtclass-native () {
+do_install_class-native () {
     oe_runmake 'DESTDIR=${D}/${STAGING_DIR_NATIVE}' install
     install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
 }
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 59974d8..bf0e45b 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -8,11 +8,11 @@ S = "${WORKDIR}/intltool-${PV}"
 
 DEPENDS = "libxml-parser-perl-native"
 RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
-DEPENDS_virtclass-native = "libxml-parser-perl-native"
+DEPENDS_class-native = "libxml-parser-perl-native"
 # gettext is assumed to exist on the host
-RDEPENDS_${PN}_virtclass-native = "libxml-parser-perl-native"
+RDEPENDS_${PN}_class-native = "libxml-parser-perl-native"
 RRECOMMENDS_${PN} = "perl-modules"
-RRECOMMENDS_${PN}_virtclass-native = ""
+RRECOMMENDS_${PN}_class-native = ""
 
 FILES_${PN}-dev = ""
 FILES_${PN} += "${datadir}/aclocal"
@@ -22,6 +22,6 @@ INSANE_SKIP_${PN} += "dev-deps"
 inherit autotools pkgconfig perlnative
 
 export PERL = "${bindir}/env perl"
-PERL_virtclass-native = "/usr/bin/env nativeperl"
+PERL_class-native = "/usr/bin/env nativeperl"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
index fa9850f..f890e92 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://intltool-nowarn-0.50.0.patch \
 # in the intltool.m4 via the remove-xml-check.patch
 NATIVEPATCHES = "file://noperlcheck.patch \
                  file://remove-xml-check.patch"
-NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch" 
+NATIVEPATCHES_class-native = "file://use-nativeperl.patch" 
 
 SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
 SRC_URI[sha256sum] = "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"
diff --git a/meta/recipes-devtools/opensp/opensp_1.5.2.bb b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
index ecf8a37..7edd59d 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.2.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
@@ -22,7 +22,7 @@ inherit autotools gettext
 
 EXTRA_OECONF = "--disable-doc-build"
 
-EXTRA_OECONF_virtclass-native = "\
+EXTRA_OECONF_class-native = "\
 	--disable-doc-build \
 	--enable-default-catalog=${sysconfdir}/sgml/catalog \
 	--enable-default-search-path=${datadir}/sgml \
@@ -41,7 +41,7 @@ do_install_append() {
 	ln -sf osx sgml2xml
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	for util in nsgmls sgmlnorm spam spcat spent sx; do
 		create_cmdline_wrapper ${D}/${bindir}/$util \
 		    -D ${sysconfdir}/sgml
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index a3c6702..c74febc 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 SRCREV = "f1a9d6701993a6f6b1930b4c2bdb71525aa25320"
 PV = "0.1.8+git${SRCPV}"
 
@@ -15,7 +15,7 @@ SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
 S = "${WORKDIR}/git"
 
 # Avoid circular dependencies from package_ipk.bbclass
-PACKAGES_virtclass-native = ""
+PACKAGES_class-native = ""
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 28cc6a6..b3d587c 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -27,15 +27,15 @@ EXTRA_OECONF += " --disable-gpg \
 
 target_localstatedir := "${localstatedir}"
 EXTRA_OECONF += "--with-opkglibdir=${localstatedir}/lib"
-EXTRA_OECONF_virtclass-native = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
-EXTRA_OECONF_virtclass-nativesdk = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
+EXTRA_OECONF_class-native = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
+EXTRA_OECONF_class-nativesdk = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
 
 PROVIDES += "virtual/update-alternatives"
 RPROVIDES_update-alternatives-cworth += "update-alternatives"
 RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
-RDEPENDS_${PN}_virtclass-native = ""
-RDEPENDS_${PN}_virtclass-nativesdk = ""
+RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
 RREPLACES_${PN} = "opkg-nogpg"
 
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 33b4d83..66df915 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -29,7 +29,7 @@ do_compile() {
 	cpan_do_compile
 }
 
-do_compile_virtclass-native() {
+do_compile_class-native() {
 	cpan_do_compile
 }
 
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 1e1eb04..bfc34d5 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -312,7 +312,7 @@ python populate_packages_prepend () {
 }
 
 PACKAGES_DYNAMIC += "^perl-module-.*"
-PACKAGES_DYNAMIC_virtclass-nativesdk += "^nativesdk-perl-module-.*"
+PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 8a8320e..83a9cdf 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -9,8 +9,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0 popt"
-DEPENDS_virtclass-native = ""
-DEPENDS_virtclass-nativesdk = ""
+DEPENDS_class-native = ""
+DEPENDS_class-nativesdk = ""
 
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
            file://autofoo.patch \
@@ -22,8 +22,8 @@ S = "${WORKDIR}/pkg-config-${PV}/"
 inherit autotools
 
 EXTRA_OECONF = "--with-installed-glib --with-installed-popt --disable-legacy-scripts"
-EXTRA_OECONF_virtclass-native = "--disable-legacy-scripts"
-EXTRA_OECONF_virtclass-nativesdk = "--disable-legacy-scripts"
+EXTRA_OECONF_class-native = "--disable-legacy-scripts"
+EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts"
 
 acpaths = "-I ."
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 095e6e0..98f706c 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -9,9 +9,9 @@ SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
-SRC_URI_append_virtclass-nativesdk = " file://symver.patch"
+SRC_URI_append_class-nativesdk = " file://symver.patch"
 
-SRC_URI_append_virtclass-native = " file://symver.patch"
+SRC_URI_append_class-native = " file://symver.patch"
 
 FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
@@ -40,7 +40,7 @@ do_compile () {
 # Two below are the same
 # If necessary compile for the alternative machine arch.  This is only 
 # necessary in a native build.
-do_compile_prepend_virtclass-native () {
+do_compile_prepend_class-native () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
                 # ... and we really, really, hope that the native host is
@@ -58,7 +58,7 @@ do_compile_prepend_virtclass-native () {
 	fi
 }
 
-do_compile_prepend_virtclass-nativesdk () {
+do_compile_prepend_class-nativesdk () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
                 # ... and we really, really, hope that the native host is
@@ -77,14 +77,14 @@ do_install () {
 # Two below are the same
 # If necessary install for the alternative machine arch.  This is only 
 # necessary in a native build.
-do_install_append_virtclass-native () {
+do_install_append_class-native () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
 }
 
-do_install_append_virtclass-nativesdk () {
+do_install_append_class-nativesdk () {
 	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index d08668e..daf570d 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native glib-2.0"
-DEPENDS_virtclass-native = "glib-2.0-native"
-RDEPENDS_virtclass-native = ""
+DEPENDS_class-native = "glib-2.0-native"
+RDEPENDS_class-native = ""
 PR = "r5"
 
 MAJ_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 24dd9e5..8608104 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbc
 SRCNAME = "setuptools"
 PR = "ml5"
 DEPENDS += "python"
-DEPENDS_virtclass-native += "python-native"
+DEPENDS_class-native += "python-native"
 
 SRC_URI = "\
   http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz\
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 3eb36fc..3a17c85 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -148,7 +148,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
 RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
-RRECOMMENDS_${PN}-crypt_virtclass-nativesdk = "nativesdk-openssl"
+RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 28ff760..95556ba 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,8 +9,8 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 require qemu-targets.inc
 
 SDL ?= "--disable-sdl"
-SDL_virtclass-native ?= ""
-SDL_virtclass-nativesdk ?= ""
+SDL_class-native ?= ""
+SDL_class-nativesdk ?= ""
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez"
 
@@ -40,10 +40,10 @@ do_install () {
 
 PACKAGECONFIG ??= ""
 
-DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0"
-RDEPENDS_virtclass-nativesdk = "nativesdk-libsdl"
-EXTRA_OECONF_virtclass-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
+DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native"
+DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0"
+RDEPENDS_class-nativesdk = "nativesdk-libsdl"
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
 				"
 
diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 5cc142a..af5eb03 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -20,11 +20,11 @@ SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e
 
 PR = "r4"
 
-SRC_URI_append_virtclass-nativesdk = "\
+SRC_URI_append_class-nativesdk = "\
     file://relocatable_sdk.patch \
     "
 
-do_configure_prepend_virtclass-nativesdk() {
+do_configure_prepend_class-nativesdk() {
 	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
 		# Undo the -lX11 added by linker-flags.patch
 		sed -i 's/-lX11//g' Makefile.target
@@ -45,7 +45,7 @@ do_install_append() {
 }
 # END of qemu-mips workaround
 
-do_configure_prepend_virtclass-native() {
+do_configure_prepend_class-native() {
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
 	sed -i 's/-lX11//g' Makefile.target
 }
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index e838f40..3268160 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -91,13 +91,13 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
-rpm_macros_virtclass-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
-PACKAGECONFIG_virtclass-native ??= "db bzip2 zlib beecrypt openssl libelf python"
+PACKAGECONFIG_class-native ??= "db bzip2 zlib beecrypt openssl libelf python"
 PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
@@ -431,7 +431,7 @@ do_install_append() {
 	rm -f ${D}/usr/lib/rpm/bin/api-sanity-checker.pl
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
 		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
index ea542e1..48c52c0 100644
--- a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
+++ b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
@@ -19,7 +19,7 @@ do_install() {
 	install -m 0755 rpmresolve ${D}${bindir}
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/rpmresolve \
 			RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
 			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index fab6057..b8f1e9a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -23,13 +23,13 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI[md5sum] = "b01a9691c83990b3db0ce62d1012ca67"
 SRC_URI[sha256sum] = "8addc385fa6b5be4605e6d68fbdc4c0e674c5af1dc1c95ec5420390c4b08042a"
 
-SRC_URI_virtclass-native = "${BASE_SRC_URI}"
+SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/tcl${PV}/unix"
 
 inherit autotools
 
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 EXTRA_OECONF = "--enable-threads --disable-rpath"
 
@@ -71,6 +71,6 @@ FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tcl-lib"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index 7480638..f65e92b 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 RDEPENDS_${PN} = "pseudo"
-RDEPENDS_${PN}_virtclass-native = "pseudo-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-pseudo"
+RDEPENDS_${PN}_class-native = "pseudo-native"
+RDEPENDS_${PN}_class-nativesdk = "nativesdk-pseudo"
 BASEPV = "2.2beta47"
 PR = "r1"
 
-- 
1.7.11.2



