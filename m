Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E7CE571D77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878818"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:26 +0300
Message-Id: <bfc6468502d1068a9e013d47a039c5ddbbd2a7ef.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 23/26] Remove the SGML stack
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:22 -0000

It is not used for anything, and is something of a pain to maintain.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../docbook-dsssl-stylesheets-native_1.79.bb       |  71 ------------
 .../docbook-sgml-dtd-3.1-native_3.1.bb             |  26 -----
 .../docbook-sgml-dtd-4.1-native_4.1.bb             |  26 -----
 .../docbook-sgml-dtd-4.5-native.bb                 |  18 ---
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |  70 ------------
 .../docbook-sgml-dtd/files/LICENSE-OASIS           |  16 ---
 .../docbook-utils/docbook-utils-0.6.14/re.patch    |  29 -----
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |  63 -----------
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |  26 -----
 .../linuxdoc-tools/disable_dvips_doc.patch         |  33 ------
 .../linuxdoc-tools/disable_sgml2rtf.patch          |  64 -----------
 .../linuxdoc-tools/disable_tex_doc.patch           |  29 -----
 .../linuxdoc-tools/disable_txt_doc.patch           |  36 ------
 .../openjade/openjade-1.3.2/fix-regex.patch        |  32 ------
 .../openjade/openjade-1.3.2/makefile.patch         |  39 -------
 .../openjade/openjade-1.3.2/msggen.pl.patch        |  44 --------
 .../openjade/openjade-1.3.2/no-libtool.patch       |  20 ----
 .../openjade/openjade-1.3.2/reautoconf.patch       |  83 --------------
 .../user-declared-default-constructor.patch        |  92 ----------------
 .../openjade/openjade-native_1.3.2.bb              | 121 ---------------------
 .../opensp-1.5.2/obsolete_automake_macros.patch    |  15 ---
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  59 ----------
 .../sgml-common/sgml-common-0.6.3/autohell.patch   |  61 -----------
 .../sgml-common/sgml-common-0.6.3/license.patch    |  29 -----
 .../sgml-common/sgml-common-native_0.6.3.bb        |  70 ------------
 .../sgml-common/sgml-common_0.6.3.bb               |  68 ------------
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |  21 ----
 27 files changed, 1261 deletions(-)
 delete mode 100644 meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/files/LICENSE-OASIS
 delete mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
 delete mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
 delete mode 100644 meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/opensp/opensp_1.5.2.bb
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
 delete mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb

diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
deleted file mode 100644
index b7791f3..0000000
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "DSSSL stylesheets used to transform SGML and XML DocBook files"
-HOMEPAGE = "http://docbook.sourceforge.net"
-# Simple persmissive
-LICENSE = "DSSSL"
-LIC_FILES_CHKSUM = "file://README;beginline=41;endline=74;md5=875385159b2ee76ecf56136ae7f542d6"
-
-DEPENDS = "sgml-common-native"
-
-PR = "r4"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-dsssl-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "bc192d23266b9a664ca0aba4a7794c7c"
-SRC_URI[sha256sum] = "2f329e120bee9ef42fbdd74ddd60e05e49786c5a7953a0ff4c680ae6bdf0e2bc"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
-UPSTREAM_CHECK_REGEX = "/docbook-dsssl/(?P<pver>(\d+[\.\-_]*)+)/"
-
-S = "${WORKDIR}/docbook-dsssl-${PV}"
-
-inherit native
-
-SSTATEPOSTINSTFUNCS += "docbook_dsssl_stylesheets_sstate_postinst"
-SYSROOT_PREPROCESS_FUNCS += "docbook_dsssl_sysroot_preprocess"
-CLEANFUNCS += "docbook_dsssl_stylesheets_sstate_clean"
-
-
-do_install () {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-dsssl.html
-	# for details.
-	install -d ${D}${bindir}
-	install -m 0755 bin/collateindex.pl ${D}${bindir}
-
-	install -d ${D}${datadir}/sgml/docbook/dsssl-stylesheets-${PV}
-	install -m 0644 catalog ${D}${datadir}/sgml/docbook/dsssl-stylesheets-${PV}
-	cp -v -R * ${D}${datadir}/sgml/docbook/dsssl-stylesheets-${PV}
-
-	install -d ${D}${sysconfdir}/sgml
-	echo "CATALOG ${datadir}/sgml/docbook/dsssl-stylesheets-${PV}/catalog" > \
-		 ${D}${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
-	echo "CATALOG ${datadir}/sgml/docbook/dsssl-stylesheets-${PV}/common/catalog" >> \
-		${D}${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
-}
-
-docbook_dsssl_stylesheets_sstate_postinst () {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Ensure that the catalog file sgml-docbook.cat is properly
-		# updated when the package is installed from sstate cache.
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
-			--add ${sysconfdir}/sgml/sgml-docbook.bak \
-			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
-			--add ${sysconfdir}/sgml/sgml-docbook.cat \
-			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
-	fi
-}
-
-docbook_dsssl_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl
-}
-
-docbook_dsssl_stylesheets_sstate_clean () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is removed from sstate cache.
-	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
-	for f in $files; do
-		[ ! -f $f ] || sed -i '/\/sgml\/dsssl-docbook-stylesheets.cat/d' $f
-	done
-}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
deleted file mode 100644
index a3ee5d8..0000000
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require docbook-sgml-dtd-native.inc
-
-LICENSE = "OASIS"
-LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
-
-DTD_VERSION = "3.1"
-
-PR = "${INC_PR}.0"
-
-# Note: the upstream sources are not distributed with a license file.
-# LICENSE-OASIS is included as a "patch" to workaround this. When
-# upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://www.docbook.org/sgml/3.1/docbk31.zip \
-           file://LICENSE-OASIS"
-
-SRC_URI[md5sum] = "432749c0c806dbae81c8bcb70da3b5d3"
-SRC_URI[sha256sum] = "20261d2771b9a052abfa3d8fab1aa62be05791a010281c566f9073bf0e644538"
-
-UPSTREAM_CHECK_URI = "http://www.docbook.org/sgml/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>3\..+)/"
-
-do_compile() {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd-3.html
-	# for details.
-	sed -i -e '/ISO 8879/d' -e 's|DTDDECL "-//OASIS//DTD DocBook V3.1//EN"|SGMLDECL|g' docbook.cat
-}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
deleted file mode 100644
index be59680..0000000
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require docbook-sgml-dtd-native.inc
-
-LICENSE = "OASIS"
-LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
-
-DTD_VERSION = "4.1"
-
-PR = "${INC_PR}.0"
-
-# Note: the upstream sources are not distributed with a license file.
-# LICENSE-OASIS is included as a "patch" to workaround this. When
-# upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://docbook.org/sgml/4.1/docbk41.zip \
-           file://LICENSE-OASIS"
-
-SRC_URI[md5sum] = "489f6ff2a2173eb1e14216c10533ede2"
-SRC_URI[sha256sum] = "deaafcf0a3677692e7ad4412c0e41c1db3e9da6cdcdb3dd32b2cc1f9c97d6311"
-
-UPSTREAM_CHECK_URI = "http://www.docbook.org/sgml/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>4\.1(\.\d+)*)/"
-
-do_compile() {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
-	# for details.
-	sed -i -e '/ISO 8879/d' -e '/gml/d' docbook.cat
-}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
deleted file mode 100644
index ae723c7..0000000
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require docbook-sgml-dtd-native.inc
-
-LICENSE = "OASIS"
-LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
-
-DTD_VERSION = "4.5"
-
-PR = "${INC_PR}.0"
-PV = "4.5"
-
-SRC_URI[md5sum] = "07c581f4bbcba6d3aac85360a19f95f7"
-SRC_URI[sha256sum] = "8043e514e80c6c19cb146b5d37937d1305bf3abf9b0097c36df7f70f611cdf43"
-
-do_compile() {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
-	# for details.
-	sed -i -e '/ISO 8879/d' -e'/gml/d' docbook.cat
-}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
deleted file mode 100644
index af50987..0000000
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ /dev/null
@@ -1,70 +0,0 @@
-# The DTDs of the various versions have to be installed in parallel and
-# should not replace each other. The installation step is common for
-# all versions and just differs in ${DTD_VERSION} which is set in each
-# version recipe.
-#
-# The DTDs do have some quirks (see LFS documentation).
-SUMMARY = "Document type definitions for verification of SGML data files"
-DESCRIPTION = "Document type definitions for verification of SGML data \
-files against the DocBook rule set"
-HOMEPAGE = "http://www.docbook.org/sgml/"
-
-DEPENDS = "sgml-common-native"
-
-# Note: the upstream sources are not distributed with a license file.
-# LICENSE-OASIS is included as a "patch" to workaround this. When
-# upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://www.docbook.org/sgml/${DTD_VERSION}/docbook-${DTD_VERSION}.zip \
-           file://LICENSE-OASIS"
-
-# The .zip file extracts to the current dir
-S = "${WORKDIR}"
-
-INC_PR = "r3"
-
-SSTATEPOSTINSTFUNCS += "docbook_sgml_dtd_sstate_postinst"
-SYSROOT_PREPROCESS_FUNCS += "docbook_sgml_dtd_sysroot_preprocess"
-
-inherit native
-
-do_install () {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
-	# for details.
-	install -d -m 755 ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}
-	install docbook.cat ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog
-	cp -PpRr *.dtd *.mod *.dcl ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}
-
-	install -d ${D}${sysconfdir}/sgml
-	echo "CATALOG ${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog" > \
-		${D}${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
-}
-
-docbook_sgml_dtd_sstate_postinst () {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Ensure that the catalog file sgml-docbook.cat is properly
-		# updated when the package is installed from sstate cache.
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION} \
-			--add ${sysconfdir}/sgml/sgml-docbook.bak \
-			${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION} \
-			--add ${sysconfdir}/sgml/sgml-docbook.cat \
-			${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
-	fi
-}
-
-docbook_sgml_dtd_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION}
-}
-
-CLEANFUNCS += "docbook_sgml_dtd_sstate_clean"
-
-docbook_sgml_dtd_sstate_clean () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is removed from sstate cache.
-	files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
-	for f in $files; do
-		[ ! -f $f ] || sed -i '/\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat/d' $f
-	done
-}
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/files/LICENSE-OASIS b/meta/recipes-devtools/docbook-sgml-dtd/files/LICENSE-OASIS
deleted file mode 100644
index 6da7f5b..0000000
--- a/meta/recipes-devtools/docbook-sgml-dtd/files/LICENSE-OASIS
+++ /dev/null
@@ -1,16 +0,0 @@
-Permission to use, copy, modify and distribute the DocBook XML DTD
-and its accompanying documentation for any purpose and without fee
-is hereby granted in perpetuity, provided that the above copyright
-notice and this paragraph appear in all copies.  The copyright
-holders make no representation about the suitability of the DTD for
-any purpose.  It is provided "as is" without expressed or implied
-warranty.
-
-If you modify the DocBook DTD in any way, except for declaring and
-referencing additional sets of general entities and declaring
-additional notations, label your DTD as a variant of DocBook.  See
-the maintenance documentation for more information.
-
-Please direct all questions, bug reports, or suggestions for 
-changes to the docbook@lists.oasis-open.org mailing list. For more
-information, see http://www.oasis-open.org/docbook/.
diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
deleted file mode 100644
index db079d6..0000000
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-
-Fix runtime error occurred e.g. with docbook-to-man calls:
-
-  grep: character class syntax is [[:space:]], not [:space:]
-  grep: character class syntax is [[:space:]], not [:space:]
-  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
-
-See also:
-
-   <https://qa.mandriva.com/show_bug.cgi?id=61127>
-
-Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
-
-diff -Nurd docbook-utils-0.6.14-orig/bin/jw.in docbook-utils-0.6.14/bin/jw.in
---- docbook-utils-0.6.14-orig/bin/jw.in	2012-03-29 07:50:00.789564826 +0200
-+++ docbook-utils-0.6.14/bin/jw.in	2012-03-29 07:52:10.371302967 +0200
-@@ -80,9 +80,9 @@
- SGML_CATALOGS_DIR="/etc/sgml"
- if [ -f "$SGML_CONF" ]
- then
--  RE='^[:space:]*SGML_BASE_DIR[:space:]*=[:space:]*'
-+  RE='^[[:space:]]*SGML_BASE_DIR[[:space:]]*=[[:space:]]*'
-   SGML_BASE_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
--  RE='^[:space:]*SGML_CATALOGS_DIR[:space:]*=[:space:]*'
-+  RE='^[[:space:]]*SGML_CATALOGS_DIR[[:space:]]*=[[:space:]]*'
-   SGML_CATALOGS_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
- fi
- 
diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
deleted file mode 100644
index c3a5f3b..0000000
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Utilities for formatting and manipulating DocBook documents"
-DESCRIPTION = "A collection of all the free software tools you need to \
-work on and format DocBook documents."
-HOMEPAGE = "http://sources.redhat.com/docbook-tools/"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
-
-PR = "r3"
-
-SRC_URI = "\
-	ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz \
-	file://re.patch \
-"
-
-SRC_URI[md5sum] = "6b41b18c365c01f225bc417cf632d81c"
-SRC_URI[sha256sum] = "48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9"
-
-inherit autotools native
-
-do_configure_prepend() {
-	# Fix hard-coded references to /etc/sgml
-	if [ ! -e ${S}/.sed_done ]; then
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/bin/jw.in
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/doc/man/Makefile.am
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/doc/HTML/Makefile.am
-
-		# Point jw to the native sysroot catalog
-		sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' ${S}/bin/jw.in
-		touch ${S}/.sed_done
-	fi
-}
-do_unpack[cleandirs] += "${S}"
-
-do_install() {
-	install -d ${D}${bindir}
-	# Install the binaries and a bunch of other commonly used names for them.
-	for doctype in html ps dvi man pdf rtf tex texi txt
-	do
-		install -m 0755 ${S}/bin/docbook2$doctype ${D}${bindir}/
-		ln -sf docbook2x-$doctype ${D}${bindir}/db2$doctype
-		ln -sf docbook2$doctype ${D}${bindir}/db2$doctype
-		ln -sf docbook2$doctype ${D}${bindir}/docbook-to-$doctype
-	done
-
-	install -m 0755 ${B}/bin/jw ${D}${bindir}/
-	for i in backends/dvi backends/html \
-		backends/pdf backends/ps backends/rtf backends/tex \
-		backends/txt \
-		helpers/docbook2man-spec.pl helpers/docbook2texi-spec.pl \
-		docbook-utils.dsl
-	do
-		install -d ${D}${datadir}/sgml/docbook/utils-${PV}/`dirname $i`
-		install ${S}/$i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
-	done
-	for i in backends/man backends/texi frontends/docbook
-	do
-		install -d ${D}${datadir}/sgml/docbook/utils-${PV}/`dirname $i`
-		install ${B}/$i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
-	done
-
-}
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
deleted file mode 100644
index a5deb2e..0000000
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Convert LinuxDoc SGML source into other formats"
-HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
-
-DEPENDS = "groff-native openjade-native"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/l/${BPN}/${BPN}_${PV}.orig.tar.gz \
-           file://disable_sgml2rtf.patch \
-           file://disable_txt_doc.patch \
-           file://disable_tex_doc.patch \
-           file://disable_dvips_doc.patch"
-
-SRC_URI[md5sum] = "1d13d500918a7a145b0edc2f16f61dd1"
-SRC_URI[sha256sum] = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6bfd4101"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/"
-inherit autotools-brokensep native
-
-do_configure () {
-	oe_runconf
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' 'TMPDIR=${T}' install
-}
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
deleted file mode 100644
index 490b367..0000000
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Disable building documentation which requires the dvips utility.
-This patch should be dropped once we include a native version of
-dvips.
-
-Upstream-Status: Inappropriate [Other]
-Temporary workaround which disables documentation.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
---- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2011-02-25 15:26:41.142917782 -0800
-+++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:27:25.141917472 -0800
-@@ -52,13 +52,13 @@
- #	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
- #fi
- 
--if [ -n "`which dvips`" ]; then
--	echo "   + dvips" >&2
--	dvips -t letter -o ./guide.ps ./guide.dvi
--	if [ -n "`which gzip`" -a -f ./guide.ps ]; then
--		gzip -fN ./guide.ps
--	fi
--fi
-+#if [ -n "`which dvips`" ]; then
-+#	echo "   + dvips" >&2
-+#	dvips -t letter -o ./guide.ps ./guide.dvi
-+#	if [ -n "`which gzip`" -a -f ./guide.ps ]; then
-+#		gzip -fN ./guide.ps
-+#	fi
-+#fi
- 
- 
- echo "- Building info docs" >&2
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
deleted file mode 100644
index 50c8a8f..0000000
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 756f20e70a97ee2dea9b32c0955eabfc27f29be1 Mon Sep 17 00:00:00 2001
-From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
-Date: Wed, 29 May 2013 16:50:17 +0300
-Subject: [PATCH] The build of sgml2rtf is problematic due to the way it wants
- to link to a shared library version of flex. Flex only
- ships with a static lib. Rather than diverging from
- upstream flex, simply skip building this un-needed utility.
-
-Upstream-Status: Inappropriate [Other]
-Workaround which disables a feature.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
----
- Makefile.in |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 359f14e..fc04020 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -40,7 +40,7 @@ perl5lib_ddir      = $(DESTDIR)$(perl5libdir)
- pkgdata_ddir       = $(DESTDIR)$(pkgdatadir)
- tex_ddir           = $(DESTDIR)$(texdir)
- 
--progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2rtf sgml2txt sgmlcheck
-+progs    := sgml2html sgml2info sgml2latex sgml2lyx sgml2txt sgmlcheck
- 
- PROFILE  =
- INCLUDE  =
-@@ -71,9 +71,9 @@ endif
- 	( cd sgmlpre ; \
- 	  $(MAKE)  CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" LEX=flex sgmlpre || exit -1 )
- 
--	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
--	( cd rtf-fix ; \
--	  $(MAKE) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" || exit -1 )
-+#	@echo "Compiling RTF conversion tools (in rtf-fix/)..."
-+#	( cd rtf-fix ; \
-+#	  $(MAKE) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" || exit -1 )
- 
- 	@echo "making man pages in genman ..."
- 	if [ ! -d genman ]; then mkdir genman ; fi
-@@ -117,7 +117,7 @@ endif
- 
- #    -- Install auxiliary programs
- 	mkdir -p $(auxbin_ddir)
--	for ii in sgmlpre/sgmlpre rtf-fix/rtf2rtf; do \
-+	for ii in sgmlpre/sgmlpre; do \
- 	  bn=`basename $$ii`; \
- 	  $(INSTALL_PROGRAM) $$ii $(auxbin_ddir)/$$bn; \
- 	done
-@@ -206,7 +206,7 @@ bin/linuxdoc:: Makefile bin/linuxdoc.in
- 
- clean::
- 	-rm -f *~ bin/*~ bin/linuxdoc
--	for d in $(DDIRS) $(MDIRS) rtf-fix; do $(MAKE) -C $$d clean; done
-+	for d in $(DDIRS) $(MDIRS); do $(MAKE) -C $$d clean; done
- 	(cd sgmlpre ; rm -f sgmlpre.o sgmlpre)
- 	-rm -rf genman/
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
deleted file mode 100644
index b62895c..0000000
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Disable building documentation which requires the latex utility.
-This patch should be dropped once we include a native version of
-latex.
-
-Upstream-Status: Inappropriate [Other]
-Temporary workaround which disables documentation.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
---- linuxdoc-tools-0.9.66.orig/doc/Makedoc.sh	2009-11-09 11:58:25.000000000 -0800
-+++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-02-25 15:23:58.610016114 -0800
-@@ -46,11 +46,11 @@
- 	$TMPDIR/sgml2txt -b 1 ./guide
- fi
- 
--if [ -n "`which latex`" ]; then
--	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2latex
--	echo "- Building latex docs" >&2
--	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
--fi
-+#if [ -n "`which latex`" ]; then
-+#	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2latex
-+#	echo "- Building latex docs" >&2
-+#	$TMPDIR/sgml2latex --pass="\usepackage{times}" -o dvi ./guide
-+#fi
- 
- if [ -n "`which dvips`" ]; then
- 	echo "   + dvips" >&2
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
deleted file mode 100644
index 8d78411..0000000
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Disable building txt documentation. This is a temporary workaround,
-as I have found an Ubuntu 10.10 system which throws errors during
-building this that I'd like to ultimately fix. The error manifests
-itself from the end of LinuxDocTools.pm with the following messages
-during do_install:
-
-| - Building txt docs
-| Processing file ./guide
-| troff: fatal error: can't find macro file s
-|  fmt_txt::postASP: Empty output file, error when calling groff. Aborting...
-
-Upstream-Status: Inappropriate [Other]
-Temporary workaround which disables documentation.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN linuxdoc-tools-0.9.66.orig//doc/Makedoc.sh linuxdoc-tools-0.9.66/doc/Makedoc.sh
---- linuxdoc-tools-0.9.66.orig//doc/Makedoc.sh	2009-11-09 11:58:25.000000000 -0800
-+++ linuxdoc-tools-0.9.66/doc/Makedoc.sh	2011-03-04 17:37:24.788923998 -0800
-@@ -40,11 +40,11 @@
- 
- chmod u+x $TMPDIR/linuxdoc
- 
--if [ -n "`which groff`" ]; then
--	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2txt
--	echo "- Building txt docs" >&2
--	$TMPDIR/sgml2txt -b 1 ./guide
--fi
-+#if [ -n "`which groff`" ]; then
-+#	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2txt
-+#	echo "- Building txt docs" >&2
-+#	$TMPDIR/sgml2txt -b 1 ./guide
-+#fi
- 
- if [ -n "`which latex`" ]; then
- 	ln -s $TMPDIR/linuxdoc $TMPDIR/sgml2latex
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
deleted file mode 100644
index 6b40afd..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 55f6fd8f1958aa36584eefeecce782a505963c88 Mon Sep 17 00:00:00 2001
-From: benvm <benvm@yow-gmoffatt-lx2.wrs.com>
-Date: Wed, 9 Jan 2013 12:14:06 -0500
-Subject: [PATCH] Fix Makefile regular expression
-
-This patch modifies a regular expression within a Makefile to stop builds
-from failing in the case where the path contains the characters ".a".
-
-Upstream-Status: Submitted
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- Makefile.prog.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.prog.in b/Makefile.prog.in
-index 76310c9..44c3534 100644
---- a/Makefile.prog.in
-+++ b/Makefile.prog.in
-@@ -12,7 +12,7 @@ LINKFLAGS = @LINKFLAGS@
- 
- ALL_LIBS = $(XLIBS) $(LIBS)
- Makefile.lt:
--	echo 'LT_LIBS='`echo $(ALL_LIBS)|sed 's/\.a/.la/g'` >Makefile.lt
-+	echo 'LT_LIBS='`echo $(ALL_LIBS) | sed 's/\.a\s/\.la /g' | sed s/\.a$$/\.la/` > Makefile.lt
- 
- PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
- 
--- 
-1.7.0.4
-
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
deleted file mode 100644
index 968b9b4..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-This patch fixes libtool QA issues with WORKDIR creeping in to
-libospgrove.la and libostyle.la. Patch obtained from OpenEmbedded.
-
-Upstream-Status: Inappropriate [Other]
-Workaround is specific to our build system.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: openjade-1.3.2/spgrove/Makefile.sub
-===================================================================
---- openjade-1.3.2.orig/spgrove/Makefile.sub
-+++ openjade-1.3.2/spgrove/Makefile.sub
-@@ -1,8 +1,8 @@
- LTVERSION=0:1:0
- LIB=ospgrove
- INCLUDE=-I$(srcdir)/../grove
--DEPLIBS=-lm -L$(TOP)/grove -L$(TOP)/grove/.libs \
--	-L$(TOP)/lib -L$(TOP)/lib/.libs \
-+DEPLIBS=-lm $(TOP)/grove \
-+	$(TOP)/lib \
- 	$(LIB_THREADS)
- OBJS=GroveApp.o GroveBuilder.o SdNode.o
- GENSRCS=grove_inst.cxx
-Index: openjade-1.3.2/style/Makefile.sub
-===================================================================
---- openjade-1.3.2.orig/style/Makefile.sub
-+++ openjade-1.3.2/style/Makefile.sub
-@@ -1,8 +1,8 @@
- LTVERSION=0:1:0
- LIB=ostyle
--DEPLIBS=-lm -L$(TOP)/grove -L$(TOP)/grove/.libs \
--  -L$(TOP)/lib -L$(TOP)/lib/.libs \
--  -L$(TOP)/spgrove -L$(TOP)/spgrove/.libs 
-+DEPLIBS=-lm $(TOP)/grove \
-+  $(TOP)/lib  \
-+  $(TOP)/spgrove
- OBJS=LangObj.o \
-   Collector.o \
-   DssslApp.o \
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
deleted file mode 100644
index b47fd46..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-commit fcc5b94f118495b1a467edcda6c6f631691c3f69
-Author: Dennis Lan <dennis.yxun@gmail.com>
-Date:   Tue Jul 3 09:25:42 2012 +0800
-
-    openjade: fix undefined Getopts error, use std namespace
-    
-    Using Gentoo Linux as the build host, it fails without this patch
-    Use Getopt::Std in place of getopts.pl.
-    
-    Upstream-Status: Inappropriate [no upstream]
-    Original-Author-By: Mike Gilbert <floppym@gentoo.org>
-    Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
-
-diff --git a/msggen.pl b/msggen.pl
-index 0c33968..2ee3f66 100644
---- a/msggen.pl
-+++ b/msggen.pl
-@@ -4,6 +4,7 @@
- # See the file COPYING for copying permission.
- 
- use POSIX;
-+use Getopt::Std;
- 
- # Package and version.
- $package = 'openjade';
-@@ -18,8 +19,7 @@ $gen_c = 0;
- undef $opt_l;
- undef $opt_p;
- undef $opt_t;
--do 'getopts.pl';
--&Getopts('l:p:t:');
-+getopts('l:p:t:');
- $module = $opt_l;
- $pot_file = $opt_p;
- 
-@@ -72,7 +72,7 @@ while (<DEF>) {
-     else {
- 	$field[0] =~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
- 	$type[$num] = substr($field[0], 0, 1);
--	$argc = int(substr($field[0], 1, 1));
-+	$argc = substr($field[0], 1, 1);
-     }
-     $nargs[$num] = $argc;
-     $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
deleted file mode 100644
index 2f57c00..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The openjade build is fairly unique in auto-generating explicit dependencies to
-installed .la files.  As some distributions may delete these files unless
-clearly required, change the Makefile fragment to depend on the .so instead.
-
-Patch originally by Phil Blundell <philb@brightsign.biz>.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Inappropriate
-
---- openjade-1.3.2/Makefile.prog.in~	2013-05-14 11:42:02.646782318 +0100
-+++ openjade-1.3.2/Makefile.prog.in	2013-05-14 11:54:55.051728343 +0100
-@@ -12,7 +12,7 @@
- 
- ALL_LIBS = $(XLIBS) $(LIBS)
- Makefile.lt:
--	echo 'LT_LIBS='`echo $(ALL_LIBS) | sed 's/\.a\s/\.la /g' | sed s/\.a$$/\.la/` > Makefile.lt
-+	echo 'LT_LIBS='`for d in $(ALL_LIBS); do case $$d in ../*) echo $$d | sed s/\.a$$/.la/g ;; *) echo $$d | sed s/\.a$$/.so/g ;; esac ; done` >Makefile.lt
- 
- PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
- 
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
deleted file mode 100644
index 1a23a4a..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Ensure we reautoconf the packag
-
-Currently since configure.in in is in a subdirectory, we don't reautoconf the 
-recipe. We really need to do this, to update things like the libtool script used
-and fix various issues such as those that could creep in if a reautoconf is 
-triggered for some reason. Since this source only calls AM_INIT_AUTOMAKE to 
-gain the PACKAGE and VERSION definitions and that macro now errors if Makefile.am 
-doesn't exist, we need to add these definitions manually. 
-
-These changes avoid failures like: 
----- 
-| ... 
-| DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope 
-| DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope 
-| make[2]: *** [DssslApp.lo] Error 1 ----
-
-Upstream-Status: Pending
-
-RP 2012/6/12
-
-Index: openjade-1.3.2/acinclude.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openjade-1.3.2/acinclude.m4	2012-06-12 12:48:54.871365344 +0000
-@@ -0,0 +1,39 @@
-+dnl Configure-time switch with default
-+dnl
-+dnl Each switch defines an --enable-FOO and --disable-FOO option in
-+dnl the resulting configure script.
-+dnl
-+dnl Usage:
-+dnl smr_SWITCH(name, description, default, pos-def, neg-def)
-+dnl
-+dnl where:
-+dnl
-+dnl name        name of switch; generates --enable-name & --disable-name
-+dnl             options
-+dnl description help string is set to this prefixed by "enable" or
-+dnl             "disable", whichever is the non-default value
-+dnl default     either "on" or "off"; specifies default if neither
-+dnl             --enable-name nor --disable-name is specified
-+dnl pos-def     a symbol to AC_DEFINE if switch is on (optional)
-+dnl neg-def     a symbol to AC_DEFINE if switch is off (optional)
-+dnl
-+AC_DEFUN(smr_SWITCH, [
-+    AC_MSG_CHECKING(whether to enable $2)
-+    AC_ARG_ENABLE(
-+        $1,
-+        ifelse($3, on,
-+            [  --disable-[$1]    disable [$2]],
-+            [  --enable-[$1]     enable [$2]]),
-+        [ if test "$enableval" = yes; then
-+            AC_MSG_RESULT(yes)
-+            ifelse($4, , , AC_DEFINE($4))
-+        else
-+            AC_MSG_RESULT(no)
-+            ifelse($5, , , AC_DEFINE($5))
-+        fi ],
-+        ifelse($3, on,
-+           [ AC_MSG_RESULT(yes)
-+             ifelse($4, , , AC_DEFINE($4)) ],
-+           [ AC_MSG_RESULT(no)
-+            ifelse($5, , , AC_DEFINE($5))]))])
-+
-Index: openjade-1.3.2/config/configure.in
-===================================================================
---- openjade-1.3.2.orig/config/configure.in	2012-06-12 12:47:20.735365445 +0000
-+++ openjade-1.3.2/config/configure.in	2012-06-12 12:48:17.507364080 +0000
-@@ -12,9 +12,12 @@
- dnl  Credits: this autoconf script was largely "inspired" <g> by the
- dnl  autoconf script around SP made by Henry Thompson.
- dnl
--AC_INIT(dsssl)
-+AC_INIT([openjade], [1.3.2])
- AC_CONFIG_AUX_DIR(config)
--AM_INIT_AUTOMAKE( openjade, 1.3.2)
-+AC_SUBST([PACKAGE], [openjade])
-+AC_SUBST([VERSION], [1.3.2])
-+AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE")
-+AC_DEFINE_UNQUOTED(VERSION, "$VERSION")
- TOP=`pwd`
- AC_SUBST(TOP)
- dnl
diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
deleted file mode 100644
index 073af46..0000000
--- a/meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-In GCC 4.6 the compiler no longer allows objects of const-qualified type to
-be default initialized unless the type has a user-declared default
-constructor.
-
-Patch from Gentoo bugzilla: http://bugs.gentoo.org/show_bug.cgi?id=358021
-
-Gentoo Bugzilla description follows:
-"If a class or struct has no user-defined default constructor, C++ doesn't
-allow you to default construct a const instance of it.
-
-https://bugs.gentoo.org/358021
-http://clang.llvm.org/compatibility.html#default_init_const
-http://gcc.gnu.org/PR44499"
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- a/jade/TeXFOTBuilder.cxx
-+++ b/jade/TeXFOTBuilder.cxx
-@@ -88,6 +88,8 @@ public:
-       value.convertString(nic_.placement);
-       }
-     ExtensionFlowObj *copy() const { return new PageFloatFlowObj(*this); }
-+  public:
-+    PageFloatFlowObj() {}
-   private:
-     PageFloatNIC nic_;
-     StringC name_;
-@@ -101,6 +103,8 @@ public:
-       fotb.endPageFootnote();
-     }
-     ExtensionFlowObj *copy() const { return new PageFootnoteFlowObj(*this); }
-+  public:
-+    PageFootnoteFlowObj() {}
-   private:
-   };
-   //////////////////////////////////////////////////////////////////////
---- a/jade/TransformFOTBuilder.cxx
-+++ b/jade/TransformFOTBuilder.cxx
-@@ -41,6 +41,7 @@ public:
-   };
-   class EntityRefFlowObj : public TransformExtensionFlowObj {
-   public:
-+    EntityRefFlowObj() {}
-     void atomic(TransformFOTBuilder &fotb, const NodePtr &) const {
-       fotb.entityRef(name_);
-     }
-@@ -56,6 +57,7 @@ public:
-   };
-   class ProcessingInstructionFlowObj : public TransformExtensionFlowObj {
-   public:
-+    ProcessingInstructionFlowObj() {}
-     void atomic(TransformFOTBuilder &fotb, const NodePtr &) const {
-       fotb.processingInstruction(data_);
-     }
-@@ -98,6 +100,8 @@ public:
-       }
-     }
-     ExtensionFlowObj *copy() const { return new EmptyElementFlowObj(*this); }
-+  public:
-+    EmptyElementFlowObj() {}
-   private:
-     ElementNIC nic_;
-   };
-@@ -133,6 +137,8 @@ public:
-       }
-     }
-     ExtensionFlowObj *copy() const { return new ElementFlowObj(*this); }
-+  public:
-+    ElementFlowObj() {}
-   private:
-     ElementNIC nic_;
-   };
-@@ -150,6 +156,8 @@ public:
-       value.convertString(systemId_);
-     }
-     ExtensionFlowObj *copy() const { return new EntityFlowObj(*this); }
-+  public:
-+    EntityFlowObj() {}
-   private:
-     StringC systemId_;
-   };
-@@ -174,6 +182,8 @@ public:
-       }
-     }
-     ExtensionFlowObj *copy() const { return new DocumentTypeFlowObj(*this); }
-+  public:
-+    DocumentTypeFlowObj() {}
-   private:
-     DocumentTypeNIC nic_;
-   };
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
deleted file mode 100644
index 8b15b0c..0000000
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ /dev/null
@@ -1,121 +0,0 @@
-SUMMARY = "Tools for working with DSSSL stylesheets for SGML and XML documents"
-DESCRIPTION = "OpenJade is a suite of tools for validating, \
-processing, and applying DSSSL (Document Style Semantics and \
-Specification Language) stylesheets to SGML and XML documents."
-HOMEPAGE = "http://openjade.sourceforge.net"
-SECTION = "base"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
-
-PR = "r5"
-
-DEPENDS = "opensp-native sgml-common-native"
-RDEPENDS_${PN} = "sgml-common-native"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
-           file://makefile.patch \
-           file://msggen.pl.patch \
-           file://reautoconf.patch \
-	   file://user-declared-default-constructor.patch \
-           file://fix-regex.patch \
-	   file://no-libtool.patch"
-
-SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
-SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
-
-UPSTREAM_CHECK_URI = "http://openjade.sourceforge.net/download.html"
-
-inherit autotools-brokensep native
-
-# Statically link local libs to avoid gold link issue [YOCTO #2972]
-PACKAGECONFIG ?= "static-only-libs"
-PACKAGECONFIG[static-only-libs] = "--enable-static --disable-shared,--enable-static --enable-shared,,"
-
-EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
-                --enable-splibdir=${STAGING_LIBDIR}"
-
-# We need to set datadir explicitly, but adding it to EXTRA_OECONF
-# results in it being specified twice when configure is run.
-CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadir}', '--datadir=${STAGING_DATADIR}/sgml/openjade-${PV}')}"
-
-# CONFIGUREOPTS has hard coded paths so we need to ignore it's vardeps
-# there are other bits in there too but they are picked up by other variable
-# dependencies so it all works out
-oe_runconf[vardepsexclude] += "CONFIGUREOPTS"
-
-CFLAGS =+ "-I${S}/include"
-CXXFLAGS += "-fno-tree-dse"
-
-SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
-SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
-
-# configure.in needs to be reloacted to trigger reautoconf
-do_extraunpack () {
-	cp ${S}/config/configure.in ${S}/
-}
-addtask extraunpack after do_patch before do_configure
-
-# We need to do this else the source interdependencies aren't generated and
-# build failures can result (e.g. zero size style/Makefile.dep file)
-do_compile_prepend () {
-	oe_runmake depend
-}
-
-do_install() {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/openjade.html
-	# for details.
-	install -d ${D}${bindir} ${D}${libdir}
-	if ${@bb.utils.contains('PACKAGECONFIG', 'static-only-libs', 'true', 'false', d)}; then
-		install -m 0755 jade/openjade ${D}${bindir}/openjade
-		oe_libinstall -a -C style libostyle ${D}${libdir}
-		oe_libinstall -a -C spgrove libospgrove ${D}${libdir}
-		oe_libinstall -a -C grove libogrove ${D}${libdir}
-	else
-		install -m 0755 jade/.libs/openjade ${D}${bindir}/openjade
-		oe_libinstall -a -so -C style libostyle ${D}${libdir}
-		oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
-		oe_libinstall -a -so -C grove libogrove ${D}${libdir}
-	fi
-	ln -sf openjade ${D}${bindir}/jade
-
-	install -d ${D}${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/*.dtd ${D}${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/*.dsl ${D}${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/*.sgm ${D}${datadir}/sgml/openjade-${PV}
-
-	install -d ${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}/catalog
-
-	install -d ${D}${sysconfdir}/sgml
-	echo "CATALOG ${datadir}/sgml/openjade-${PV}/catalog" > \
-		${D}${sysconfdir}/sgml/openjade-${PV}.cat
-}
-
-openjade_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Ensure that the catalog file sgml-docbook.cat is properly
-		# updated when the package is installed from sstate cache.
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
-			--add ${sysconfdir}/sgml/sgml-docbook.bak \
-			${sysconfdir}/sgml/openjade-${PV}.cat
-		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
-			--add ${sysconfdir}/sgml/sgml-docbook.cat \
-			${sysconfdir}/sgml/openjade-${PV}.cat
-		cat << EOF > ${SSTATE_INST_POSTRM}
-#!/bin/sh
-# Ensure that the catalog file sgml-docbook.cat is properly
-# updated when the package is removed from sstate cache.
-files="${sysconfdir}/sgml/sgml-docbook.bak ${sysconfdir}/sgml/sgml-docbook.cat"
-for f in \$files; do
-	[ ! -f \$f ] || sed -i '/\/sgml\/openjade-${PV}.cat/d' \$f
-done
-EOF
-	fi
-}
-
-openjade_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
-}
diff --git a/meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch b/meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
deleted file mode 100644
index 42218a6..0000000
--- a/meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3599291&group_id=2115&atid=102115]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd OpenSP-1.5.2/configure.in OpenSP-1.5.2/configure.in
---- OpenSP-1.5.2/configure.in	2005-12-23 16:15:21.000000000 +0200
-+++ OpenSP-1.5.2/configure.in	2013-01-03 09:04:51.922645689 +0200
-@@ -16,7 +16,7 @@
- AM_INIT_AUTOMAKE(OpenSP, 1.5.2, no-define)
- AM_MAINTAINER_MODE
- AC_PREREQ(2.53)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AM_SANITY_CHECK
-
- dnl Autoheader definitions
diff --git a/meta/recipes-devtools/opensp/opensp_1.5.2.bb b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
deleted file mode 100644
index 60a7d2e..0000000
--- a/meta/recipes-devtools/opensp/opensp_1.5.2.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "An SGML parser"
-DESCRIPTION = "An SGML parser used by the OpenJade suite of utilities."
-HOMEPAGE = "http://openjade.sourceforge.net"
-SECTION = "libs"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
-
-PR = "r1"
-
-# At -Os it encounters calls to some inline functions which are then
-# not found in any other objects with gcc 4.5
-FULL_OPTIMIZATION += "-O2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/OpenSP-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "670b223c5d12cee40c9137be86b6c39b"
-SRC_URI[sha256sum] = "57f4898498a368918b0d49c826aa434bb5b703d2c3b169beb348016ab25617ce"
-
-S = "${WORKDIR}/OpenSP-${PV}"
-
-inherit autotools gettext
-
-EXTRA_OECONF = "--disable-doc-build"
-
-EXTRA_OECONF_class-native = "\
-	--disable-doc-build \
-	--enable-default-catalog=${sysconfdir}/sgml/catalog \
-	--enable-default-search-path=${datadir}/sgml \
-	"
-
-do_install_append() {
-	# Set up symlinks to often-used alternate names. See
-	# http://www.linuxfromscratch.org/blfs/view/stable/pst/opensp.html
-	cd ${D}${libdir}
-	ln -sf libosp.so libsp.so
-
-	cd ${D}${bindir}
-	for util in nsgmls sgmlnorm spam spcat spent sx; do
-		ln -sf o$util $util	
-	done
-	ln -sf osx sgml2xml
-}
-
-do_install_append_class-native() {
-	for util in nsgmls sgmlnorm spam spcat spent sx; do
-		create_cmdline_wrapper ${D}/${bindir}/$util \
-		    -D ${sysconfdir}/sgml
-	done
-}
-
-FILES_${PN} += "${datadir}/OpenSP/"
-
-BBCLASSEXTEND = "native"
-
-# http://errors.yoctoproject.org/Errors/Details/20489/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
deleted file mode 100644
index 1f39b03..0000000
--- a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Patch obtained from OpenEmbedded.
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- sgml-common-0.6.3/bin/Makefile.am~autohell.patch	2001-01-30 15:42:21.000000000 +0100
-+++ sgml-common-0.6.3/bin/Makefile.am	2004-06-17 11:51:11.000000000 +0200
-@@ -1,6 +1,5 @@
- primitive_scripts = sgmlwhich
- 
--bindir = $(prefix)/bin
- bin_SCRIPTS = install-catalog $(primitive_scripts)
- 
- EXTRA_DIST =  install-catalog.in $(primitive_scripts)
---- /dev/null	2003-09-23 19:59:22.000000000 +0200
-+++ sgml-common-0.6.3/bin/sgmlwhich.in	2004-06-17 11:51:11.000000000 +0200
-@@ -0,0 +1,7 @@
-+#!/bin/sh
-+# Location of the main configuration file for consistency with non-LSB platforms
-+# Send any comments to Eric Bischoff <eric@caldera.de>
-+# This program is under GPL license. See LICENSE file for details.
-+
-+echo "@sysconfdir@/sgml/sgml.conf"
-+# Simple, isn't it? ;-)
---- /dev/null	2003-09-23 19:59:22.000000000 +0200
-+++ sgml-common-0.6.3/config/sgml.conf.in	2004-06-17 11:51:11.000000000 +0200
-@@ -0,0 +1,2 @@
-+SGML_BASE_DIR=@datadir@/sgml
-+SGML_CATALOGS_DIR=@sysconfdir@/sgml
---- sgml-common-0.6.3/configure.in~autohell.patch	2001-05-25 18:40:54.000000000 +0200
-+++ sgml-common-0.6.3/configure.in	2004-06-17 11:53:22.000000000 +0200
-@@ -3,11 +3,6 @@
- 
- AM_INIT_AUTOMAKE(sgml-common, 0.6.3)
- 
--docdir='$(prefix)/doc'
--AC_SUBST(docdir)
--
--dnl Checks for programs.
--
- dnl Checks for libraries.
- 
- dnl Checks for header files.
-@@ -18,6 +13,5 @@
- 
- AC_OUTPUT(Makefile \
-           bin/Makefile bin/install-catalog \
--          config/Makefile \
--          doc/Makefile doc/HTML/Makefile doc/man/Makefile doc/refentry/Makefile \
-+          config/Makefile config/sgml.conf bin/sgmlwhich \
-           sgml-iso-entities/Makefile xml-iso-entities/Makefile)
-
---- sgml-common-0.6.3/Makefile.am~no-docs	2001-05-25 18:22:01.000000000 +0200
-+++ sgml-common-0.6.3/Makefile.am	2004-06-17 11:49:09.000000000 +0200
-@@ -1,4 +1,4 @@
--SUBDIRS = bin config doc sgml-iso-entities xml-iso-entities
-+SUBDIRS = bin config sgml-iso-entities xml-iso-entities
- 
- sgmlcodir = $(prefix)/share/sgml
- sgmlco_DATA = xml.dcl
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
deleted file mode 100644
index 54b3f54..0000000
--- a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-The COPYING file sgml-common ships with is just a symlink to
-/usr/share/automake/COPYING, which means we can't verify it
-using our normal means. We workaround this by using this patch
-to create our own license file. 
-
-Upstream was notified about this on 2011-01-24. When upgrading
-this recipe, this should be fixed and you should remove this
-patch.
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN sgml-common-0.6.3.orig/LICENSE-GPLv2 sgml-common-0.6.3/LICENSE-GPLv2
---- sgml-common-0.6.3.orig/LICENSE-GPLv2	1969-12-31 16:00:00.000000000 -0800
-+++ sgml-common-0.6.3/LICENSE-GPLv2	2011-01-28 17:05:17.299528001 -0800
-@@ -0,0 +1,12 @@
-+Copyright (C) 1997 Christian Schwarz <schwarz@debian.org>.
-+Copyright (C) 2001-2004 Ardo van Rangelrooij <ardo@debian.org>
-+
-+This is free software; you may redistribute it and/or modify it under
-+the terms of the GNU General Public License as published by the Free
-+Software Foundation; either version 2, or (at your option) any later
-+version.
-+
-+This is distributed in the hope that it will be useful, but without
-+any warranty; without even the implied warranty of merchantability or
-+fitness for a particular purpose.  See the GNU General Public License
-+for more details.
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
deleted file mode 100644
index 97b308a..0000000
--- a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-SUMMARY = "Base utilities for working with SGML and XML"
-DESCRIPTION = "The sgml-common package gathers very basic \
-stuff necessary to work with SGML and XML, such as xml.dcl, \
-a SGML declaration of XML; iso-entities, a list of the basic \
-SGML ISO entities; and install-catalog, a script used to \
-add entries to (or remove entries from) centralized catalogs \
-whose entries are pointers to SGML open catalogs, \
-as defined by OASIS."
-HOMEPAGE = "http://sources.redhat.com/docbook-tools/"
-LICENSE = "GPLv2+"
-# See the comments in license.patch when upgrading this recipe.
-# This is inteded to be a temporary workaround.
-LIC_FILES_CHKSUM = "file://LICENSE-GPLv2;md5=ab8a50abe86dfc859e148baae043c89b"
-SECTION = "base"
-
-PR = "r1"
-
-require sgml-common_${PV}.bb
-inherit native
-
-S = "${WORKDIR}/sgml-common-${PV}"
-
-SYSROOT_PREPROCESS_FUNCS += "sgml_common_native_mangle"
-SSTATEPOSTINSTFUNCS += "sgml_common_sstate_postinst"
-
-do_install_append() {
-	# install-catalog script contains hard-coded references to
-	# {sysconfdir}. Change it to ${D}${sysconfdir}.
-	sed -i -e "s|${sysconfdir}/sgml|${D}${sysconfdir}/sgml|g" ${D}${bindir}/install-catalog
-
-	${D}${bindir}/install-catalog \
-		--add ${D}${sysconfdir}/sgml/sgml-ent.cat \
-		${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
-
-	# The sgml-docbook.cat will be regenerated by sstate_postinst
-	rm -f ${D}${sysconfdir}/sgml/sgml-docbook.cat
-}
-
-sgml_common_native_mangle () {
-	# Revert back to ${sysconfdir} path in install-catalog
-	sed -i -e "s|${D}${sysconfdir}/sgml|${sysconfdir}/sgml|g" ${SYSROOT_DESTDIR}${STAGING_BINDIR}/install-catalog
-	# Change path from ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog to ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog in sgml-ent.cat
-	sed -i -e "s|${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-ent.cat
-	# Remove ${D} path from catalog file created by install-catalog script
-	sed -i -e "s|${D}||g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/catalog
-}
-
-sgml_common_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		${bindir}/install-catalog --add ${sysconfdir}/sgml/sgml-docbook.cat ${sysconfdir}/sgml/sgml-ent.cat
-		if [ -e ${sysconfdir}/sgml/sgml-docbook.bak ]; then
-			for catalog in `awk '{print $2}' ${sysconfdir}/sgml/sgml-docbook.bak`; do
-				if [ ! `grep $catalog ${sysconfdir}/sgml/sgml-docbook.cat 1> /dev/null 2>&1` ]; then
-					${bindir}/install-catalog \
-						--add ${sysconfdir}/sgml/sgml-docbook.cat $catalog
-				fi
-			done
-		fi
-		cat << EOF > ${SSTATE_INST_POSTRM}
-#!/bin/sh
-
-# Ensure that the catalog file sgml-docbook.cat is properly
-# updated when the package is removed from sstate cache.
-if [ -f ${sysconfdir}/sgml/sgml-docbook.cat ]; then
-	sed -i '/\/sgml\/sgml-ent.cat/d' ${sysconfdir}/sgml/sgml-docbook.cat
-fi
-EOF
-	fi
-}
diff --git a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
deleted file mode 100644
index 6098673..0000000
--- a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-SUMMARY = "Base utilities for working with SGML and XML"
-DESCRIPTION = "The sgml-common package gathers very basic \
-stuff necessary to work with SGML and XML, such as xml.dcl, \
-a SGML declaration of XML; iso-entities, a list of the basic \
-SGML ISO entities; and install-catalog, a script used to \
-add entries to (or remove entries from) centralized catalogs \
-whose entries are pointers to SGML open catalogs, \
-as defined by OASIS."
-HOMEPAGE = "http://sources.redhat.com/docbook-tools/"
-LICENSE = "GPLv2+"
-# See the comments in license.patch when upgrading this recipe.
-# This is inteded to be a temporary workaround.
-LIC_FILES_CHKSUM = "file://LICENSE-GPLv2;md5=ab8a50abe86dfc859e148baae043c89b"
-SECTION = "base"
-
-PR = "r1"
-
-SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/sgml-common-${PV}.tgz \
-           file://autohell.patch \
-           file://license.patch"
-
-SRC_URI[md5sum] = "103c9828f24820df86e55e7862e28974"
-SRC_URI[sha256sum] = "7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959"
-
-inherit autotools
-
-do_compile_append() {
-	# install-catalog script contains hardcoded references to /etc/sgml
-	sed -i -e 's|\([ "]\+\)/etc/sgml|\1${sysconfdir}/sgml|g' bin/install-catalog
-}
-
-FILES_${PN} += "${datadir}/sgml"
-
-pkg_postinst_${PN}() {
-    if [ "x$D" = "x" ]; then
-	install-catalog \
-		--add ${sysconfdir}/sgml/sgml-ent.cat \
-		${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
-
-	install-catalog \
-		--add ${sysconfdir}/sgml/sgml-docbook.cat \
-		${sysconfdir}/sgml/sgml-ent.cat
-    else
-	if ! grep -q ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog $D${sysconfdir}/sgml/sgml-ent.cat; then
-	    echo "CATALOG ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog" >> $D${sysconfdir}/sgml/sgml-ent.cat
-	fi
-	if ! grep -q ${sysconfdir}/sgml/sgml-ent.cat $D${sysconfdir}/sgml/catalog; then
-	    echo "CATALOG ${sysconfdir}/sgml/sgml-ent.cat" >> $D${sysconfdir}/sgml/catalog
-	fi
-
-	if ! grep -q ${sysconfdir}/sgml/sgml-ent.cat $D${sysconfdir}/sgml/sgml-docbook.cat; then
-	    echo "CATALOG ${sysconfdir}/sgml/sgml-ent.cat" >> $D${sysconfdir}/sgml/sgml-docbook.cat
-	fi
-	if ! grep -q ${sysconfdir}/sgml/sgml-docbook.cat $D${sysconfdir}/sgml/catalog; then
-	    echo "CATALOG ${sysconfdir}/sgml/sgml-docbook.cat" >> $D${sysconfdir}/sgml/catalog
-	fi
-    fi
-}
-
-pkg_postrm_${PN}() {
-	install-catalog \
-		--remove ${sysconfdir}/sgml/sgml-ent.cat \
-		${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
-
-	install-catalog \
-		--remove ${sysconfdir}/sgml/sgml-docbook.cat \
-		${sysconfdir}/sgml/sgml-ent.cat
-}
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
deleted file mode 100644
index 01581c1..0000000
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A simple post-processor for SGMLS and NSGMLS"
-HOMEPAGE = "https://github.com/gitpan/SGMLSpm"
-SECTION = "libs"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://github.com/gitpan/SGMLSpm \
-          "
-
-SRCREV = "71595b9b5e36bfc00046995e058926bd27793fef"
-
-PV = "1.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit native cpan
-
-do_install_append() {
-    ln -s sgmlspl.pl ${D}${bindir}/sgmlspl
-}
-- 
2.9.3


