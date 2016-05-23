Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4E160796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:44:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 05:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="960442756"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 05:44:11 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 15:44:04 +0300
Message-Id: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464004128.git.jussi.kukkonen@intel.com>
References: <cover.1464004128.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/5] docbook-xsl-stylesheets: Upgrade 1.78.1 -> 1.79.1
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
X-List-Received-Date: Mon, 23 May 2016 12:44:14 -0000

* Use $PV at appropriate places in do_install
* Install some new files, avoid installing 25M of java archives
* License checksum change is just copyright years changing

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/docbook-xml/{docbook-xsl-stylesheets_1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} (76%)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
similarity index 76%
rename from meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
rename to meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 52de3ab..a29fe00 100644
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


