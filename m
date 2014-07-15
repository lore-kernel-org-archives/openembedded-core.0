Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA9A570392
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:36:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FCa2I8011841
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 05:36:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 05:36:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 20:35:46 +0800
Message-ID: <b0eae7b5a933338a464420f52cad3608e8502b7a.1405427541.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405427541.git.hongxu.jia@windriver.com>
References: <cover.1405427541.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/8] docbook-xml: add docbook-xsl-stylesheets 1.78.1
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
X-List-Received-Date: Tue, 15 Jul 2014 12:36:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

About the config files (docbook-xsl.xml), we refered what Ubuntu 13.04 did,
so the xmlto could correctly search the xsl stylesheets.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/licenses.conf                            |  2 +-
 meta/files/common-licenses/XSL                     | 48 ++++++++++++++++
 .../docbook-xsl-stylesheets/docbook-xsl.xml        |  6 ++
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  | 67 ++++++++++++++++++++++
 4 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/XSL
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index c378a41..b1d5480 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -36,7 +36,7 @@ SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
 SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
 SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 Simple-2.0 Sleepycat"
 SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
-SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet YPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet XSL YPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 
 # Standards are great! Everyone has their own. In an effort to standardize licensing
diff --git a/meta/files/common-licenses/XSL b/meta/files/common-licenses/XSL
new file mode 100644
index 0000000..0a82d60
--- /dev/null
+++ b/meta/files/common-licenses/XSL
@@ -0,0 +1,48 @@
+Copyright
+---------
+Copyright (C) 1999-2007 Norman Walsh
+Copyright (C) 2003 Jiří Kosek
+Copyright (C) 2004-2007 Steve Ball
+Copyright (C) 2005-2008 The DocBook Project
+Copyright (C) 2011-2012 O'Reilly Media
+
+Permission is hereby granted, free of charge, to any person
+obtaining a copy of this software and associated documentation
+files (the ``Software''), to deal in the Software without
+restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following
+conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+Except as contained in this notice, the names of individuals
+credited with contribution to this software shall not be used in
+advertising or otherwise to promote the sale, use or other
+dealings in this Software without prior written authorization
+from the individuals in question.
+
+Any stylesheet derived from this Software that is publically
+distributed will be identified with a different name and the
+version strings in any derived Software will be changed so that
+no possibility of confusion between the derived package and this
+Software will exist.
+
+Warranty
+--------
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT.  IN NO EVENT SHALL NORMAN WALSH OR ANY OTHER
+CONTRIBUTOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+Contacting the Author
+---------------------
+The DocBook XSL stylesheets are maintained by Norman Walsh,
+<ndw@nwalsh.com>, and members of the DocBook Project,
+<docbook-developers@sf.net>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
new file mode 100644
index 0000000..a1a576a
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
@@ -0,0 +1,6 @@
+<?xml version="1.0"?>
+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets-1.78.1/catalog.xml"/>
+<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets-1.78.1/catalog.xml"/>
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
new file mode 100644
index 0000000..39528c8
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -0,0 +1,67 @@
+SUMMARY = "XSL stylesheets for processing DocBook XML to various output formats"
+HOMEPAGE = "http://docbook.sourceforge.net"
+LICENSE = "XSL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6eeeed43d498c22a835382533356462"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
+           file://docbook-xsl.xml \
+"
+
+SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
+SRC_URI[sha256sum] = "c98f7296ab5c8ccd2e0bc07634976a37f50847df2d8a59bdb1e157664700b467"
+
+S = "${WORKDIR}/docbook-xsl-${PV}"
+
+inherit allarch
+BBCLASSEXTEND = "native"
+
+SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xsl_stylesheets_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xsl_stylesheets_sysroot_preprocess"
+
+do_configre (){
+	:
+}
+
+do_compile (){
+	:
+}
+
+do_install () {
+	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-xsl.html
+	# for details.
+	install -v -m755 -d ${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
+
+	cp -v -R VERSION common eclipse epub extensions fo highlighting html \
+		htmlhelp images javahelp lib manpages params profiling \
+		roundtrip slides template tests tools webhelp website \
+		xhtml xhtml-1_1 catalog.xml \
+	${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
+
+	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-1.78.1/VERSION.xsl
+
+	install -v -m644 -D README \
+		${D}${datadir}/doc/docbook-xsl-1.78.1/README.txt
+	install -v -m644    RELEASE-NOTES* NEWS* \
+		${D}${datadir}/doc/docbook-xsl-1.78.1
+
+	install -d ${D}${sysconfdir}/xml/
+	install -m 755  ${WORKDIR}/docbook-xsl.xml ${D}${sysconfdir}/xml/docbook-xsl.xml
+
+}
+
+docbook_xsl_stylesheets_sstate_postinst () {
+    if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+    then
+        # Ensure that the catalog file sgml-docbook.cat is properly
+        # updated when the package is installed from sstate cache.
+        sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
+    fi
+}
+
+docbook_xsl_stylesheets_sysroot_preprocess () {
+    # Update the hardcode dir in docbook-xml.xml
+    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
+}
+
+FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
+FILES_${PN}-doc = "${datadir}/doc/*"
-- 
1.8.1.2


