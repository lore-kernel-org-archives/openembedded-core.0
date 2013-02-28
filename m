Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UB581-0002Up-4z
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 16:10:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Feb 2013 06:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="291834178"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2013 06:54:12 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 16:57:35 +0200
Message-Id: <1362063455-9980-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gmp: updated to 5.1.0a
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
X-List-Received-Date: Thu, 28 Feb 2013 15:10:37 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-support/gmp/gmp.inc      |    4 +++-
 meta/recipes-support/gmp/gmp_5.1.0.bb |    6 ++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 823811f..709d8c4 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -3,7 +3,9 @@ DESCRIPTION = "GNU multiprecision arithmetic library"
 HOMEPAGE = "http://gmplib.org/"
 LICENSE = "GPLv3 LGPLv3"
 
-SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}.tar.bz2 \
+REVISION = "a"
+
+SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}${REVISION}.tar.bz2 \
 	   file://configure.patch \
 	   file://amd64.patch "
 
diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
index 6591ebe..73a4336 100644
--- a/meta/recipes-support/gmp/gmp_5.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
@@ -3,13 +3,11 @@ LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
 
-PR = "r1"
-
 SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
                    file://187b7b1646ee.patch \
                    file://obsolete_automake_macros.patch \
                    "
 
-SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
-SRC_URI[sha256sum] = "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"
+SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
+SRC_URI[sha256sum] = "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"
-- 
1.7.10.4



