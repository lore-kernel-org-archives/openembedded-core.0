Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TWlbV-0006eT-D0
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:14:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2012 02:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,744,1344236400"; d="scan'208";a="166314555"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.49])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Nov 2012 02:00:29 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2012 12:00:41 +0200
Message-Id: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/2] libxslt: upgrade to 1.1.27
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
X-List-Received-Date: Fri, 09 Nov 2012 10:14:25 -0000

pkgconfig_fix.patch: adapted to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../libxslt/libxslt/pkgconfig_fix.patch            | 22 +++++++++++-----------
 .../{libxslt_1.1.26.bb => libxslt_1.1.27.bb}       |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.26.bb => libxslt_1.1.27.bb} (86%)

diff --git a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
index 6386889..16a8010 100644
--- a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
+++ b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
@@ -1,24 +1,24 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: libxslt-1.1.22/libexslt.pc.in
+Index: libxslt-1.1.27/libexslt.pc.in
 ===================================================================
---- libxslt-1.1.22.orig/libexslt.pc.in	2008-03-19 16:52:20.000000000 +0000
-+++ libxslt-1.1.22/libexslt.pc.in	2008-03-19 16:55:49.000000000 +0000
-@@ -8,5 +8,5 @@
+--- libxslt-1.1.27.orig/libexslt.pc.in
++++ libxslt-1.1.27/libexslt.pc.in
+@@ -8,5 +8,5 @@ Name: libexslt
  Version: @LIBEXSLT_VERSION@
  Description: EXSLT Extension library
  Requires: libxml-2.0
 -Libs: @EXSLT_LIBDIR@ @EXSLT_LIBS@
-+Libs: -lexslt @EXSLT_LIBDIR@ @M_LIBS@
++Libs: -lexslt @EXSLT_LIBDIR@ @EXSLT_LIBS@
  Cflags: @EXSLT_INCLUDEDIR@
-Index: libxslt-1.1.22/libxslt.pc.in
+Index: libxslt-1.1.27/libxslt.pc.in
 ===================================================================
---- libxslt-1.1.22.orig/libxslt.pc.in	2008-03-19 16:52:20.000000000 +0000
-+++ libxslt-1.1.22/libxslt.pc.in	2008-03-19 16:55:38.000000000 +0000
-@@ -8,5 +8,5 @@
+--- libxslt-1.1.27.orig/libxslt.pc.in
++++ libxslt-1.1.27/libxslt.pc.in
+@@ -8,5 +8,5 @@ Name: libxslt
  Version: @VERSION@
  Description: XSLT library version 2.
  Requires: libxml-2.0
--Libs: @XSLT_LIBDIR@ @XSLT_LIBS@
-+Libs: -lxslt @XSLT_LIBDIR@ @M_LIBS@
+-Libs: @XSLT_LIBDIR@ @XSLT_LIBS@ @EXTRA_LIBS@
++Libs: -lxslt @XSLT_LIBDIR@ @XSLT_LIBS@ @EXTRA_LIBS@
  Cflags: @XSLT_INCLUDEDIR@
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.27.bb
similarity index 86%
rename from meta/recipes-support/libxslt/libxslt_1.1.26.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.27.bb
index e4cc214..925c860 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.27.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r8"
+PR = "r0"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
-SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
+SRC_URI[md5sum] = "4d01ff464b9ea7236925a1adf147c7f8"
+SRC_URI[sha256sum] = "b6a8d9a421f2630999ca91d9f8c091ee8ea2d580e6be84c1d21b2a45e11e7e26"
 S = "${WORKDIR}/libxslt-${PV}"
 
 inherit autotools pkgconfig binconfig lib_package
-- 
1.7.11.7



