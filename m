Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lo-0002rU-KC
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TcB6000304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:47 +0800
Message-ID: <585581fe90068ea49f74b2dea7a3db795a9d6533.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 06/11] recipes-extended: replace virtclass-native(sdk) with class-native(sdk)
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
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb            |  4 ++--
 meta/recipes-extended/ghostscript/ghostscript_9.05.bb | 10 +++++-----
 meta/recipes-extended/groff/groff_1.20.1.bb           |  4 ++--
 meta/recipes-extended/gzip/gzip_1.5.bb                |  2 +-
 meta/recipes-extended/perl/libtimedate-perl_1.20.bb   |  2 +-
 meta/recipes-extended/pigz/pigz.inc                   |  2 +-
 meta/recipes-extended/stat/stat_3.3.bb                |  2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb        |  6 +++---
 meta/recipes-extended/unzip/unzip_6.0.bb              |  2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index d03b57d..6e160cd 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -25,7 +25,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "bunzip2 bzcat"
 
 #install binaries to bzip2-native under sysroot for replacement-native
-EXTRA_OECONF_virtclass-native += "--bindir=${STAGING_BINDIR_NATIVE}/${PN}"
+EXTRA_OECONF_class-native += "--bindir=${STAGING_BINDIR_NATIVE}/${PN}"
 do_configure_prepend () {
 	cp ${WORKDIR}/configure.ac ${S}/
 	cp ${WORKDIR}/Makefile.am ${S}/
@@ -42,6 +42,6 @@ FILES_libbz2-staticdev = "${libdir}/*.a"
 SECTION_libbz2-staticdev = "devel"
 RDEPENDS_libbz2-staticdev = "libbz2-dev (= ${EXTENDPKGV})"
 
-PROVIDES_append_virtclass-native = " bzip2-replacement-native"
+PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 1c18b21..1fdcb99 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 PR = "r3"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
 
@@ -30,7 +30,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.05-NOT-check-endian.patch \
            "
 
-SRC_URI_virtclass-native = "${SRC_URI_BASE}"
+SRC_URI_class-native = "${SRC_URI_BASE}"
 
 SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
 SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
@@ -80,18 +80,18 @@ do_install_append () {
     chown -R root:lp ${D}${sysconfdir}/cups
 }
 
-python do_patch_virtclass-native () {
+python do_patch_class-native () {
     pass
 }
 
-do_compile_virtclass-native () {
+do_compile_class-native () {
     mkdir -p obj
     for i in genarch genconf mkromfs echogs gendev genht; do
         oe_runmake obj/aux/$i
     done
 }
 
-do_install_virtclass-native () {
+do_install_class-native () {
     install -d ${D}${bindir}/ghostscript-${PV}
     for i in genarch genconf mkromfs echogs gendev genht; do
         install -m 755 obj/aux/$i ${D}${bindir}/ghostscript-${PV}/$i
diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index c7da1b4..157365b 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "48fa768dd6fdeb7968041dd5ae8e2b02"
 SRC_URI[sha256sum] = "b645878135cb620c6c417c5601bfe96172245af12045540d7344938b4c2cd805"
 
 DEPENDS = "groff-native"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 inherit autotools
 
@@ -44,7 +44,7 @@ do_install_append() {
 	done
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
 	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
 	for i in afmtodit mmroff; do
diff --git a/meta/recipes-extended/gzip/gzip_1.5.bb b/meta/recipes-extended/gzip/gzip_1.5.bb
index 2c6917d..f7b8593 100644
--- a/meta/recipes-extended/gzip/gzip_1.5.bb
+++ b/meta/recipes-extended/gzip/gzip_1.5.bb
@@ -2,7 +2,7 @@ require gzip.inc
 
 PR = "r0"
 
-PROVIDES_append_virtclass-native = " gzip-replacement-native"
+PROVIDES_append_class-native = " gzip-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
index 12439cf..780f774 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
@@ -13,7 +13,7 @@ inherit cpan allarch
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
 
 SRC_URI[md5sum] = "7da7452bce4c684e4238e6d09b390200"
diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 3721c97..c897f15 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -12,7 +12,7 @@ PR = "r1"
 SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz \
            file://ldflags.patch"
 
-PROVIDES_virtclass-native += "gzip-native"
+PROVIDES_class-native += "gzip-native"
 
 DEPENDS = "zlib"
 
diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index b7666f0..73e0873 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -18,7 +18,7 @@ do_install() {
 	install -m 644 stat.1 ${D}${mandir}/man1
 }
 
-#do_install_virtclass-native() {
+#do_install_class-native() {
 #	install -d ${D}${bindir}
 #	install -m 755 stat ${D}${bindir}
 #}
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 50892ce..327faab 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
 PR = "r5"
 
 DEPENDS = "zlib ncurses texinfo-native"
-DEPENDS_virtclass-native = "zlib-native ncurses-native"
+DEPENDS_class-native = "zlib-native ncurses-native"
 
 TARGET_PATCH = "file://use_host_makedoc.patch"
-TARGET_PATCH_virtclass-native = ""
+TARGET_PATCH_class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
            file://texinfo-4.12-zlib.patch \
@@ -44,7 +44,7 @@ do_install_append() {
 	mkdir -p ${D}${datadir}/${tex_texinfo}
 	install -p -m644 doc/texinfo.tex doc/txi-??.tex ${D}${datadir}/${tex_texinfo} 	
 }
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	install -m 755 info/makedoc ${D}${bindir}
 }
 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index e11f9f7..a1547fc 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/unzip60"
 EXTRA_OEMAKE += "STRIP=true LF2=''"
 
 export LD = "${CC}"
-LD_virtclass-native = "${CC}"
+LD_class-native = "${CC}"
 
 do_compile() {
         oe_runmake -f unix/Makefile generic
-- 
1.7.11.2



