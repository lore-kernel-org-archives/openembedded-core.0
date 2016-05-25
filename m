Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BDE756FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:10:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 03:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,363,1459839600"; 
	d="scan'208,217";a="984323454"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2016 03:10:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:10:39 +0300
Message-Id: <1464171039-13080-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464101969.9570.61.camel@linuxfoundation.org>
References: <1464101969.9570.61.camel@linuxfoundation.org>
Subject: [PATCHv2] docbook-xsl-stylesheets: Upgrade 1.78.1 -> 1.79.1
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
X-List-Received-Date: Wed, 25 May 2016 10:10:49 -0000

* Use $PV at appropriate places in do_install
* Install some new files, avoid installing 25M of java archives
* License checksum change is just copyright years changing
* Fix the URI delegation file (that prevents fetches from
  http://docbook.sourceforge.net/ during build) to refer to a
  non-versioned directory

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since V1:
* URI delegation file was still referring to
  /usr/share/xml/docbook/xsl-stylesheets-1.78.1/: fixed this to refer
  to the non-versioned symlink

I couldn't reproduce the issue but this seems very likely to be the
right fix (and I've checked that the paths look correct for both target
and native builds)


  - Jussi


 .../docbook-xsl-stylesheets/docbook-xsl.xml        |  4 ++--
 ...1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/docbook-xml/{docbook-xsl-stylesheets_1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} (76%)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
index a1a576a..c60555a 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
 <!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
 <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets-1.78.1/catalog.xml"/>
-<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets-1.78.1/catalog.xml"/>
+<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets/catalog.xml"/>
+<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets/catalog.xml"/>
 </catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
similarity index 76%
rename from meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
rename to meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 52de3ab..aa03a82 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -1,15 +1,15 @@
 SUMMARY = "XSL stylesheets for processing DocBook XML to various output formats"
 HOMEPAGE = "http://docbook.sourceforge.net"
 LICENSE = "XSL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6eeeed43d498c22a835382533356462"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6beadd98f9c54ab0c387e14211ee4d0e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
            file://docbook-xsl.xml \
            file://docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch \
 "
 
-SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
-SRC_URI[sha256sum] = "c98f7296ab5c8ccd2e0bc07634976a37f50847df2d8a59bdb1e157664700b467"
+SRC_URI[md5sum] = "b48cbf929a2ad85e6672f710777ca7bc"
+SRC_URI[sha256sum] = "725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
 # Reject versions ending in .0 as those are release candidates
@@ -37,18 +37,18 @@ do_install () {
 	install -v -m755 -d ${D}${datadir}/xml/docbook/xsl-stylesheets-${PV}
 	ln -s xsl-stylesheets-${PV} ${D}${datadir}/xml/docbook/xsl-stylesheets
 
-	cp -v -R VERSION common eclipse epub extensions fo highlighting html \
-		htmlhelp images javahelp lib manpages params profiling \
-		roundtrip slides template tests tools webhelp website \
-		xhtml xhtml-1_1 catalog.xml \
-	${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
+	cp -v -R VERSION assembly common eclipse epub epub3 fo \
+		highlighting html htmlhelp images javahelp lib manpages \
+		params profiling roundtrip slides template webhelp website \
+		xhtml xhtml-1_1 xhtml5 catalog.xml \
+		${D}${datadir}/xml/docbook/xsl-stylesheets-${PV}
 
-	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-1.78.1/VERSION.xsl
+	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-${PV}/VERSION.xsl
 
 	install -v -m644 -D README \
-		${D}${datadir}/doc/docbook-xsl-1.78.1/README.txt
+		${D}${datadir}/doc/docbook-xsl-${PV}/README.txt
 	install -v -m644    RELEASE-NOTES* NEWS* \
-		${D}${datadir}/doc/docbook-xsl-1.78.1
+		${D}${datadir}/doc/docbook-xsl-${PV}
 
 	install -d ${D}${sysconfdir}/xml/
 	install -m 755  ${WORKDIR}/docbook-xsl.xml ${D}${sysconfdir}/xml/docbook-xsl.xml
-- 
2.1.4


