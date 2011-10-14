Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUZ-0002Sz-Lw
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540461"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:15 -0700
Message-Id: <ca6b8d762c4f40475fc776caa53afa565d6b189c.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/28] libtiff: Update to 3.9.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2011 05:39:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libtiff/files/libtool2.patch                   |   18 ++++++++----------
 .../libtiff/{tiff_3.8.2.bb => tiff_3.9.5.bb}       |    6 +++---
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_3.8.2.bb => tiff_3.9.5.bb} (82%)

diff --git a/meta/recipes-multimedia/libtiff/files/libtool2.patch b/meta/recipes-multimedia/libtiff/files/libtool2.patch
index 2ee8309..457202e 100644
--- a/meta/recipes-multimedia/libtiff/files/libtool2.patch
+++ b/meta/recipes-multimedia/libtiff/files/libtool2.patch
@@ -4,18 +4,16 @@ Upstream-Status: Inappropriate [configuration]
  configure.ac |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- tiff-3.8.2.orig/configure.ac
-+++ tiff-3.8.2/configure.ac
-@@ -25,11 +25,11 @@ dnl OF THIS SOFTWARE.
- dnl Process this file with autoconf to produce a configure script.
- 
- AC_PREREQ(2.59)
- AC_INIT([LibTIFF Software], 3.8.2, [tiff@lists.maptools.org], tiff)
+Index: tiff-3.9.5/configure.ac
+===================================================================
+--- tiff-3.9.5.orig/configure.ac
++++ tiff-3.9.5/configure.ac
+@@ -27,7 +27,7 @@ dnl Process this file with autoconf to p
+ AC_PREREQ(2.64)
+ AC_INIT([LibTIFF Software],[3.9.5],[tiff@lists.maptools.org],[tiff])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR(m4)
 +dnl AC_CONFIG_MACRO_DIR(m4)
  AC_LANG(C)
  
- dnl Compute the canonical target-system type variable
- AC_CANONICAL_TARGET
- 
+ dnl Compute the canonical host (run-time) system type variable
diff --git a/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
similarity index 82%
rename from meta/recipes-multimedia/libtiff/tiff_3.8.2.bb
rename to meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
index 0a0367a..c646c15 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.8.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
@@ -3,13 +3,13 @@ LICENSE = "${PN}"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
 
-SRC_URI[md5sum] = "fbb6f446ea4ed18955e2714934e5b698"
-SRC_URI[sha256sum] = "be88f037080b93ce0a337b2b3ca5e8195f76885deb6c558cc3aa872ee848fc76"
+SRC_URI[md5sum] = "8fc7ce3b4e1d0cc8a319336967815084"
+SRC_URI[sha256sum] = "ecf2e30582698dbc61d269203bbd1e701a1a50fb26c87d709e10d89669badb33"
 
 inherit autotools
 
-- 
1.7.6.2



