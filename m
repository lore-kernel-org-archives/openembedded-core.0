Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1540F701D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 10:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6MAEWBB028887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 03:14:32 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 03:14:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 03:14:28 -0700
Message-ID: <1406024072-31259-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406022752.git.liezhi.yang@windriver.com>
References: <cover.1406022752.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03 - 40 ] fix rdepends on bash perl and python
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
X-List-Received-Date: Tue, 22 Jul 2014 10:14:33 -0000
Content-Type: text/plain

Subject: [PATCH 03/40] groff: add perl to RDEPENDS_groff

The following files are perl scripts:

/usr/lib/groff/groffer/perl_test.pl
/usr/lib/groff/groffer/man.pl
/usr/lib/groff/groffer/func.pl
/usr/bin/afmtodit
/usr/bin/roff2dvi
/usr/bin/groffer
/usr/bin/roff2x
/usr/bin/grog
/usr/bin/roff2ps
/usr/bin/roff2pdf
/usr/bin/chem
/usr/bin/roff2html
/usr/bin/gropdf
/usr/bin/mmroff
/usr/bin/roff2text
/usr/bin/pdfmom

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 63f0425..5a52d67 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -64,3 +64,5 @@ FILES_${PN} += "${libdir}/${BPN}/site-tmac \
                 ${libdir}/${BPN}/groffer/"
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "perl"
-- 

================
Subject: [PATCH 04/40] attr: add perl to RDEPENDS_attr-ptest

These are perl scripts:
/usr/lib/attr/ptest/test/run
/usr/lib/attr/ptest/test/sort-getfattr-output

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/attr/attr.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c37d34f..981e825 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -34,4 +34,4 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix perl"
-- 

================
Subject: [PATCH 05/40] git: add perl to RDEPENDS_gitweb

Perl script:
/usr/share/gitweb/gitweb.cgi

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 7633577..affe32b 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -109,6 +109,6 @@ FILES_${PN}-tk = " \
 
 PACKAGES =+ "gitweb"
 FILES_gitweb = "${datadir}/gitweb/"
-
+RDEPENDS_gitweb += "perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 

================
Subject: [PATCH 06/40] syslinux: add perl to RDEPENDS_syslinux-misc

Perl scripts:
syslinux-misc/usr/bin/isohybrid.pl
syslinux-misc/usr/bin/pxelinux-options
syslinux-misc/usr/bin/keytab-lilo
syslinux-misc/usr/bin/sha1pass
syslinux-misc/usr/bin/syslinux2ansi
syslinux-misc/usr/bin/mkdiskimage
syslinux-misc/usr/bin/lss16toppm
syslinux-misc/usr/bin/ppmtolss16

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index e8a1fd4..5b26e79 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -61,6 +61,7 @@ do_install() {
 PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
 RDEPENDS_${PN} += "mtools"
+RDEPENDS_${PN}-misc += "perl"
 
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
-- 

================
Subject: [PATCH 07/40] texi2html: add perl to RDEPENDS_texi2html

Perl script:
texi2html/usr/bin/texi2html

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/texi2html/texi2html_5.0.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index aa5f1fd..7de7e21 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -12,6 +12,8 @@ SRC_URI     = "${SAVANNAH_GNU_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
 SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89d9f9fa"
 
+RDEPENDS_${PN} += "perl"
+
 inherit autotools gettext texinfo
 
 do_configure_prepend() {
-- 

================
Subject: [PATCH 08/40] gst-plugins-package: add perl to
 RDEPENDS_gst-plugins-base-apps

Perl script:
gst-plugins-base-apps/usr/bin/gst-visualise-0.10

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gstreamer/gst-plugins-package.inc              |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 0503b34..153be62 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -49,6 +49,7 @@ ALLOW_EMPTY_${PN}-staticdev = "1"
 
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
+RDEPENDS_${PN}-apps += "perl"
 
 FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
 FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-- 

================
Subject: [PATCH 09/40] foomatic-filters: add perl to
 RDEPENDS_foomatic-filters

Perl script:
foomatic-filters/usr/lib/cups/backend/beh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../foomatic/foomatic-filters_4.0.17.bb            |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 790c981..44f17a4 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
+RDEPENDS_${PN} += "perl"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
-- 

================
Subject: [PATCH 10/40] icon-naming-utils: add perl to
 RDEPENDS_icon-naming-utils

Perl script:
icon-naming-utils/usr/lib/icon-naming-utils/icon-name-mapping

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 18e7fc0..f0140b6 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -12,6 +12,8 @@ LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
 PR = "r4"
 
+RDEPENDS_${PN} += "perl"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
-- 

================
Subject: [PATCH 11/40] rpm: add perl to RDEPENDS_rpm-build

Perl scripts:
rpm-build/usr/lib/rpm/osgideps.pl
rpm-build/usr/lib/rpm/perl.prov
rpm-build/usr/lib/rpm/perldeps.pl
rpm-build/usr/lib/rpm/perl.req
rpm-build/usr/lib/rpm/bin/api-sanity-autotest.pl

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb |    4 +---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb  |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 27d01dd..d2dec5f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -274,8 +274,6 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
-RDEPENDS_${PN}-build += "bash"
-
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${bindir}/rpmbuild.real \
@@ -349,7 +347,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-build = "file"
+RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 8fec656..0c9ef5b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -261,8 +261,6 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
-RDEPENDS_${PN}-build += "bash"
-
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${bindir}/rpmbuild.real \
@@ -336,7 +334,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-build = "file"
+RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
-- 

================
Subject: [PATCH 12/40] opensp: add perl to RDEPENDS_opensp

Perl script:
opensp/usr/share/OpenSP/gensyntax.pl

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/opensp/opensp_1.5.2.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opensp/opensp_1.5.2.bb b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
index a1f115c..3f833f2 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.2.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
@@ -18,6 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/OpenSP-${PV}.tar.gz \
 SRC_URI[md5sum] = "670b223c5d12cee40c9137be86b6c39b"
 SRC_URI[sha256sum] = "57f4898498a368918b0d49c826aa434bb5b703d2c3b169beb348016ab25617ce"
 
+RDEPENDS_${PN} += "perl"
+
 S = "${WORKDIR}/OpenSP-${PV}"
 
 inherit autotools gettext
-- 

================
Subject: [PATCH 13/40] aspell: add perl to RDEPENDS_aspell-utils

Perl script:
aspell-utils/usr/bin/aspell-import

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/aspell/aspell_0.60.6.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 56dabd3..927029e 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -10,6 +10,8 @@ SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
 SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 
+RDEPENDS_${PN}-utils += "perl"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
 
-- 

================
Subject: [PATCH 14/40] glib-2.0: add perl to RDEPENDS_glib-2.0-utils

Perl script:
glib-2.0-utils/usr/bin/glib-mkenums

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2eda8a1..fe32601 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,6 +25,8 @@ PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
+RDEPENDS_${PN}-utils += "perl"
+
 inherit autotools gettext gtk-doc pkgconfig ptest
 
 S = "${WORKDIR}/glib-${PV}"
-- 

================
Subject: [PATCH 15/40] lttng-tools: add perl bash python to
 RDEPENDS_lttng-tools-ptest

Perl script:
lttng-tools-ptest/usr/lib/lttng-tools/ptest/tests/utils/babelstats.pl

Python script:
lttng-tools-ptest/usr/lib/lttng-tools/ptest/tests/regression/run-report.py

Bash script:
[snip]
47 ones

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index db8b65b..0474578 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust"
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl bash python"
 
 SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
 PV = "v2.3.1"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
index aab9bf6..34b9869 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust"
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl bash python"
 
 SRCREV = "8e3234eea2d81f8a962214c570532f8e096a9a8d"
 PV = "v2.4.0"
-- 

================
Subject: [PATCH 16/40] quilt: add bash and perl to RDEPENDS

Perl scripts:
quilt/usr/share/quilt/scripts/edmail is a perl script, but perl is not in RDEPEND_quilt
quilt/usr/share/quilt/scripts/remove-trailing-ws is a perl script, but perl is not in RDEPEND_quilt
quilt/usr/share/quilt/scripts/dependency-graph is a perl script, but perl is not in RDEPEND_quilt
guards/usr/bin/guards is a perl script, but perl is not in RDEPEND_guards

Bash scripts:
quilt-ptest/usr/lib/quilt/ptest/quilt/unapplied
quilt-ptest/usr/lib/quilt/ptest/quilt/push
quilt-ptest/usr/lib/quilt/ptest/quilt/fork
quilt-ptest/usr/lib/quilt/ptest/quilt/patches
quilt-ptest/usr/lib/quilt/ptest/quilt/upgrade
quilt-ptest/usr/lib/quilt/ptest/quilt/delete
quilt-ptest/usr/lib/quilt/ptest/quilt/applied
quilt-ptest/usr/lib/quilt/ptest/quilt/rename
quilt-ptest/usr/lib/quilt/ptest/quilt/pop
quilt-ptest/usr/lib/quilt/ptest/quilt/new
quilt-ptest/usr/lib/quilt/ptest/quilt/remove
quilt-ptest/usr/lib/quilt/ptest/quilt/series
quilt-ptest/usr/lib/quilt/ptest/quilt/setup
quilt-ptest/usr/lib/quilt/ptest/quilt/grep
quilt-ptest/usr/lib/quilt/ptest/quilt/previous
quilt-ptest/usr/lib/quilt/ptest/quilt/mail
quilt-ptest/usr/lib/quilt/ptest/quilt/edit
quilt-ptest/usr/lib/quilt/ptest/quilt/top
quilt-ptest/usr/lib/quilt/ptest/quilt/revert
quilt-ptest/usr/lib/quilt/ptest/quilt/diff
quilt-ptest/usr/lib/quilt/ptest/quilt/graph
quilt-ptest/usr/lib/quilt/ptest/quilt/refresh
quilt-ptest/usr/lib/quilt/ptest/quilt/annotate
quilt-ptest/usr/lib/quilt/ptest/quilt/fold
quilt-ptest/usr/lib/quilt/ptest/quilt/next
quilt-ptest/usr/lib/quilt/ptest/quilt/add
quilt-ptest/usr/lib/quilt/ptest/quilt/files
quilt-ptest/usr/lib/quilt/ptest/quilt/import
quilt-ptest/usr/lib/quilt/ptest/quilt/header
quilt-ptest/usr/lib/quilt/ptest/quilt/snapshot
quilt-ptest/usr/lib/quilt/ptest/quilt/scripts/inspect
quilt-ptest/usr/lib/quilt/ptest/quilt/scripts/backup-files
quilt-ptest/usr/lib/quilt/ptest/bin/quilt
quilt-ptest/usr/lib/quilt/ptest/bin/patch-wrapper
quilt-ptest/usr/lib/quilt/ptest/compat/awk
quilt-ptest/usr/lib/quilt/ptest/compat/sendmail

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/quilt/quilt-0.63.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt-0.63.inc b/meta/recipes-devtools/quilt/quilt-0.63.inc
index f375785..50593a9 100644
--- a/meta/recipes-devtools/quilt/quilt-0.63.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.63.inc
@@ -26,7 +26,8 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash perl"
+RDEPENDS_guards = "perl"
 
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
@@ -55,5 +56,5 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
-                        perl-module-text-parsewords \
+                        perl-module-text-parsewords bash \
 "
-- 

================
Subject: [PATCH 17/40] udev: add perl to RDEPENDS_udev-ptest

Perl scripts:
udev-ptest/usr/lib/udev/ptest/test/udev-test.pl

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/udev/udev.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 11204aa..280da10 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://init"
 
 inherit autotools pkgconfig update-rc.d ptest
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl"
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
-- 

================
Subject: [PATCH 18/40] apt: add bash to RDEPENDS_apt

Bash scripts:
apt/usr/lib/dpkg/methods/apt/update
apt/usr/lib/dpkg/methods/apt/install

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt_0.9.9.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_0.9.9.4.bb b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
index ae9ed6c..86ffe66 100644
--- a/meta/recipes-devtools/apt/apt_0.9.9.4.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.9.4.bb
@@ -1,5 +1,5 @@
 DEPENDS = "curl db"
-RDEPENDS_${PN} = "dpkg"
+RDEPENDS_${PN} = "dpkg bash"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-- 

================
Subject: [PATCH 19/40] lsbtest: add bash to RDEPENDS_lsbtest

Bash scripts:
lsbtest/usr/bin/LSB_Test.sh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index f61251e..5a59285 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://LSB_Test.sh \
 		   file://packages_list \
 		   file://session \
 		   "
-RDEPENDS_${PN} = "rpm"
+RDEPENDS_${PN} = "rpm bash"
 
 S = "${WORKDIR}"
 
-- 

================
Subject: [PATCH 20/40] oprofile: add bash to RDEPENDS_oprofile-ptest

Bash script:
oprofile-ptest/usr/lib/oprofile/ptest/run-ptest

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 6958203..1ba4218 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -27,6 +27,8 @@ SRC_URI = "file://opstart.patch \
 
 inherit autotools-brokensep pkgconfig ptest
 
+RDEPENDS_${PN}-ptest += "bash"
+
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
-- 

================
Subject: [PATCH 21/40] pax-utils: add bash to RDEPENDS_pax-utils

Bash script:
pax-utils/usr/bin/lddtree

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
index e79347f..79e58ba 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 SRC_URI[md5sum] = "bc42279c5aff3682c12be40f72805cec"
 SRC_URI[sha256sum] = "844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9"
 
+RDEPENDS_${PN} += "bash"
+
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
 }
-- 

================
Subject: [PATCH 22/40] gzip: add bash to RDEPENDS_gzip

Bash scripts:
gzip/bin/zcat.gzip
gzip/bin/gunzip.gzip
gzip/bin/uncompress
gzip/usr/bin/zfgrep
gzip/usr/bin/gzexe
gzip/usr/bin/zdiff
gzip/usr/bin/zegrep
gzip/usr/bin/zforce
gzip/usr/bin/zmore
gzip/usr/bin/zcmp
gzip/usr/bin/zless
gzip/usr/bin/znew
gzip/usr/bin/zgrep

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/gzip/gzip.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index eeeafe0..1b69574 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
+RDEPENDS_${PN} += "bash"
+
 inherit autotools texinfo
 
 EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
-- 

================
Subject: [PATCH 23/40] dtc: add bash to RDEPENDS_dtc

Bash script:
dtc-misc/usr/bin/dtdiff

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/dtc/dtc.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 3eca25f..5144f38 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -16,3 +16,4 @@ S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-misc"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
+RDEPENDS_${PN}-misc += "bash"
-- 

================
Subject: [PATCH 24/40] pm-utils: add bash to RDEPENDS_pm-utils

Bash script:
pm-utils/usr/lib/pm-utils/sleep.d/98video-quirk-db-handler

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 21d2704..8d35187 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4
 
 inherit pkgconfig autotools
 
-RDEPENDS_${PN} = "grep"
+RDEPENDS_${PN} = "grep bash"
 
 do_configure_prepend () {
 	( cd ${S}; autoreconf -f -i -s )
-- 

================
Subject: [PATCH 25/40] grep: add bash to RDEPENDS_grep

Bash scripts:
grep/bin/egrep.grep
grep/bin/fgrep.grep

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/grep/grep_2.19.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/grep/grep_2.19.bb b/meta/recipes-extended/grep/grep_2.19.bb
index f38a9a6..7f7b598 100644
--- a/meta/recipes-extended/grep/grep_2.19.bb
+++ b/meta/recipes-extended/grep/grep_2.19.bb
@@ -10,6 +10,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 SRC_URI[md5sum] = "ac732142227d9fe9567d71301e127979"
 SRC_URI[sha256sum] = "6388295be48cfcaf7665d9cd3914e6625ea000e9414132bfefd45cf1d8eec34d"
 
+RDEPENDS_${PN} += "bash"
+
 inherit autotools gettext texinfo
 
 EXTRA_OECONF = "--disable-perl-regexp"
-- 

================
Subject: [PATCH 26/40] kconfig-frontends: add bash to
 RDEPENDS_kconfig-frontends

Bash script:
kconfig-frontends/usr/bin/kconfig-tweak

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../kconfig-frontends_3.12.0.0.bb                  |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index 2f57527..b0b6fa7 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "b939280dcc83f8feabd87a1d5f9b00c2"
 SRC_URI[sha256sum] = "ea2615a62c74bea6ce3b38402f00c7513858f307f6ba7aa9fdbf0bbc12bcf407"
 
+RDEPENDS_${PN} += "python bash"
+
 S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools
-- 

================
Subject: [PATCH 27/40] xz: add bash to RDEPENDS_xz

Bash scripts:
xz/usr/bin/xzless
xz/usr/bin/xzgrep
xz/usr/bin/xzmore
xz/usr/bin/xzdiff

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xz/xz_5.1.3alpha.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
index b8501a5..a4f51d6 100644
--- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "bbb2daa876c87fb2cf9fe4590af9694e"
 SRC_URI[sha256sum] = "9f94506e301d5b6863921bba861a99ba00de384dafb4e5f409679a93e41613d4"
 
+RDEPENDS_${PN} += "bash"
+
 inherit autotools gettext
 
 PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
-- 

================
Subject: [PATCH 28/40] libpam: add bash to RDEPENDS_libpam-xtests

Bash scripts:
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_limits1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/run-xtests.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack5.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_pwhistory1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_succeed_if1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_unix2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack3.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access4.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_substack1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_access2.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_assemble_line1.sh
libpam-xtests/usr/share/Linux-PAM/xtests/tst-pam_group1.sh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3190aaf..789890d 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -72,8 +72,16 @@ libpam_suffix = "suffix${@get_multilib_bit(d)}"
 RPROVIDES_${PN} += "libpam-${libpam_suffix}"
 RPROVIDES_${PN}-runtime += "libpam-runtime-${libpam_suffix}"
 
-RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
-RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} \
+    pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} \
+    pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix} \
+    "
+RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} \
+    pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} \
+    pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
+    pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
+    coreutils bash \
+    "
 RRECOMMENDS_${PN} = "libpam-runtime-${libpam_suffix}"
 
 python populate_packages_prepend () {
-- 

================
Subject: [PATCH 29/40] valgrind: add bash to RDEPENDS_valgrind-ptest

Bash script:
valgrind-ptest/usr/lib/valgrind/ptest/run-ptest

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 3c6aa13..a18cc23 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -48,7 +48,7 @@ FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " sed perl eglibc-utils"
+RDEPENDS_${PN}-ptest += " sed perl eglibc-utils bash"
 
 do_compile_ptest() {
     oe_runmake check
-- 

================
Subject: [PATCH 30/40] ltp: add bash and python to RDEPENDS_ltp

Bash scripts:
[snip]
228 ones

Python scripts:
ltp/opt/ltp/testcases/bin/lib/sched_mc.py
ltp/opt/ltp/testcases/bin/cpu_consolidation.py
ltp/opt/ltp/testcases/bin/sched_domain.py
ltp/opt/ltp/testcases/bin/ilb_test.py
ltp/opt/ltp/bin/execltp

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20140422.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 30761fd..874347c 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -65,7 +65,7 @@ do_install(){
     find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs bash python"
 
 FILES_${PN}-dbg += "\
     /opt/ltp/runtest/.debug \
-- 

================
Subject: [PATCH 31/40] piglit: add bash to RDEPENDS_piglit

Bash scripts:
piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-read.sh
piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-write.sh
piglit/usr/lib/piglit/tests/spec/arb_shader_texture_lod/compiler/make_tex_lod_tests.sh
piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct-const.sh
piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct.sh
piglit/usr/lib/piglit/tests/spec/glsl-1.20/compiler/built-in-functions/outerProduct-invalid-parameters.sh
piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_lod_tests.sh
piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_rect_tests.sh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7417cd5..15026a0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -45,4 +45,7 @@ do_install() {
 
 FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
 
-RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
+RDEPENDS_${PN} = "python waffle python-json python-subprocess \
+    python-multiprocessing python-textutils python-netserver python-shell \
+    mesa-demos bash \
+    "
-- 

================
Subject: [PATCH 32/40] usbutils: add python to RDEPENDS_usbutils

Python scripts:
usbutils/usr/bin/lsusb.py

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/usbutils/usbutils_007.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_007.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
index b93b2bd..56113da 100644
--- a/meta/recipes-bsp/usbutils/usbutils_007.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_007.bb
@@ -28,4 +28,4 @@ PACKAGES += "${PN}-ids"
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 FILES_${PN}-ids = "${datadir}/usb*"
 
-RDEPENDS_${PN} = "${PN}-ids"
+RDEPENDS_${PN} = "${PN}-ids python"
-- 

================
Subject: [PATCH 33/40] libxml2: add python to RDEPENDS_libxml2-ptest

Python scripts:
[snip]
47 ones

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 9aa640b..9bb7c9b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -28,6 +28,8 @@ inherit autotools pkgconfig binconfig-disabled pythonnative ptest
 
 RDEPENDS_${PN}-ptest_append_libc-glibc += "eglibc-gconv-ebcdic-us eglibc-gconv-ibm1141"
 
+RDEPENDS_${PN}-ptest += "python"
+
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
-- 

================
Subject: [PATCH 34/40] builder: add python to RDEPENDS_builder

Python script:
builder/etc/mini_x/please_wait_dialog.py

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 78d41e5..f0c0963 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "file://builder_hob_start.sh \
 
 S = "${WORKDIR}"
 
-RDEPENDS_${PN} = "mini-x-session"
+RDEPENDS_${PN} = "mini-x-session python"
 
 inherit useradd
 
-- 

================
Subject: [PATCH 35/40] lttng-ust: add python to RDEPENDS_lttng-ust-bin

Python script:
lttng-ust-bin/usr/bin/lttng-gen-tp

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
index 44e3e2b..d721bb6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
 inherit autotools lib_package
 
 DEPENDS = "liburcu util-linux"
-RDEPENDS_${PN} = "python"
+RDEPENDS_${PN}-bin = "python"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "lttng2-ust"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
index 1629554..f4ee7f5 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
 inherit autotools lib_package
 
 DEPENDS = "liburcu util-linux"
+RDEPENDS_${PN}-bin = "python"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "lttng2-ust"
-- 

================
Subject: [PATCH 36/40] libevent: add python to RDEPENDS_libevent

Python script:
libevent/usr/bin/event_rpcgen.py

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libevent/libevent_2.0.21.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.0.21.bb b/meta/recipes-support/libevent/libevent_2.0.21.bb
index 5a1ff3b..30e34d9 100644
--- a/meta/recipes-support/libevent/libevent_2.0.21.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.21.bb
@@ -24,3 +24,5 @@ inherit autotools
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.0.so"
+
+RDEPENDS_${PN} += "python"
-- 

================
Subject: [PATCH 37/40] gconf: add python to RDEPENDS_gconf

Python script:
gconf/usr/bin/gsettings-schema-convert

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..ff4ad55 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -45,7 +45,7 @@ do_install_append_class-native() {
 }
 
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)} python"
 RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/GConf/* \
-- 

================
Subject: [PATCH 38/40] blktrace: add python to RDEPENDS_blktrace

Python script:
blktrace/usr/bin/bno_plot.py

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7a32993..5d89a20 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -12,6 +12,8 @@ PV = "1.0.5+git${SRCPV}"
 SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch"
 
+RDEPENDS_${PN} += "python"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "\
-- 

================
Subject: [PATCH 39/40] dpkg: add perl to RDEPENDS_perl

Perl scripts:
dpkg/usr/lib/dpkg/parsechangelog/debian
dpkg/usr/bin/dpkg-parsechangelog
dpkg/usr/bin/dpkg-buildflags
dpkg/usr/bin/dpkg-gencontrol
dpkg/usr/bin/dpkg-shlibdeps
dpkg/usr/bin/dpkg-mergechangelogs
dpkg/usr/bin/dpkg-source
dpkg/usr/bin/dpkg-checkbuilddeps
dpkg/usr/bin/dpkg-buildpackage
dpkg/usr/bin/dpkg-gensymbols
dpkg/usr/bin/dpkg-scanpackages
dpkg/usr/bin/dpkg-vendor
dpkg/usr/bin/dpkg-name
dpkg/usr/bin/dpkg-genchanges
dpkg/usr/bin/dpkg-distaddfile
dpkg/usr/bin/dpkg-scansources
dpkg/usr/bin/dpkg-architecture

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 929906d..ea6b171 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -7,7 +7,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 

================
Subject: [PATCH 40/40] gnu-config: add perl to RDEPENDS_gnu-config

Perl script:
gnu-config/usr/bin/gnu-configize

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-config/gnu-config_20120814.bb              |    2 ++
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index d67466a..af4afd6 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
 SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
 SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
 
+RDEPENDS_${PN} += "perl"
+
 do_compile() {
 	:
 }
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 00fa759..d1b0a59 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
 
 S = "${WORKDIR}/git"
 
+RDEPENDS_${PN} += "perl"
+
 do_compile() {
 	:
 }
-- 

================

