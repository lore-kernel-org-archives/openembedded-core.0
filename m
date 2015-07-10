Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51B9D6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:12:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A9CsWa005507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:12:54 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Jul 2015 02:12:54 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 17:07:15 +0800
Message-ID: <1436519235-30329-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-perl] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Fri, 10 Jul 2015 09:12:57 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libxml/libxml-libxml-perl_2.0116.bb            | 47 ----------------------
 .../libxml/libxml-libxml-perl_2.0121.bb            | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 47 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
deleted file mode 100644
index 2a6dbc2..0000000
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "Perl interface to the libxml2 library"
-DESCRIPTION = "This module is an interface to libxml2, providing XML and HTML parsers \ 
-with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
-interface and a XML::XPath-like interface to XPath API of libxml2. \
-The module is split into several packages which are not described in this \
-section; unless stated otherwise, you only need to use XML::LibXML; in \
-your programs."
-
-HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0|GPLv1+"
-DEPENDS += "libxml2 \
-        libxml-sax-perl-native \
-        zlib \
-"
-RDEPENDS_${PN} += "libxml2 \
-        libxml-sax-perl \
-        libxml-sax-base-perl \
-        zlib \
-"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
-	file://disable-libxml2-check.patch \
-	file://fix-CATALOG-conditional-compile.patch \
-	file://using-DOCB-conditional.patch \
-"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
-			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
-SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
-SRC_URI[libxml.sha256sum] = "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
-
-S = "${WORKDIR}/XML-LibXML-${PV}"
-
-inherit cpan
-
-EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
-
-BBCLASSEXTEND = "native"
-
-CFLAGS += " -D_GNU_SOURCE "
-BUILD_CFLAGS += " -D_GNU_SOURCE "
-
-do_configure_prepend() {
-	rm -rf ${S}/.pc/*
-}
-
-FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
new file mode 100644
index 0000000..9066000
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Perl interface to the libxml2 library"
+DESCRIPTION = "This module is an interface to libxml2, providing XML and HTML parsers \ 
+with DOM, SAX and XMLReader interfaces, a large subset of DOM Layer 3 \
+interface and a XML::XPath-like interface to XPath API of libxml2. \
+The module is split into several packages which are not described in this \
+section; unless stated otherwise, you only need to use XML::LibXML; in \
+your programs."
+
+HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0|GPLv1+"
+DEPENDS += "libxml2 \
+        libxml-sax-perl-native \
+        zlib \
+"
+RDEPENDS_${PN} += "libxml2 \
+        libxml-sax-perl \
+        libxml-sax-base-perl \
+        zlib \
+"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
+	file://disable-libxml2-check.patch \
+	file://fix-CATALOG-conditional-compile.patch \
+	file://using-DOCB-conditional.patch \
+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
+			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
+SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
+SRC_URI[libxml.sha256sum] = "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
+
+S = "${WORKDIR}/XML-LibXML-${PV}"
+
+inherit cpan
+
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR}/libxml2 LIBS=-L${STAGING_LIBDIR}"
+
+BBCLASSEXTEND = "native"
+
+CFLAGS += " -D_GNU_SOURCE "
+BUILD_CFLAGS += " -D_GNU_SOURCE "
+
+do_configure_prepend() {
+	rm -rf ${S}/.pc/*
+}
+
+FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
-- 
1.9.1


