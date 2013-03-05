Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UCtz3-0003EX-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 16:41:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Mar 2013 07:24:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="295103158"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2013 07:24:21 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 17:27:37 +0200
Message-Id: <1362497257-23984-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] gmp: updated to 5.1.0a
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
X-List-Received-Date: Tue, 05 Mar 2013 15:41:18 -0000

---
 .../gmp/{gmp-5.1.0 => gmp-5.1.0a}/187b7b1646ee.patch            |    0
 .../gmp/{gmp-5.1.0 => gmp-5.1.0a}/configure.patch               |    0
 .../{gmp-5.1.0 => gmp-5.1.0a}/obsolete_automake_macros.patch    |    0
 meta/recipes-support/gmp/{gmp_5.1.0.bb => gmp_5.1.0a.bb}        |    7 +++----
 4 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gmp/{gmp-5.1.0 => gmp-5.1.0a}/187b7b1646ee.patch (100%)
 rename meta/recipes-support/gmp/{gmp-5.1.0 => gmp-5.1.0a}/configure.patch (100%)
 rename meta/recipes-support/gmp/{gmp-5.1.0 => gmp-5.1.0a}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-support/gmp/{gmp_5.1.0.bb => gmp_5.1.0a.bb} (71%)

diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch b/meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
rename to meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch b/meta/recipes-support/gmp/gmp-5.1.0a/configure.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-5.1.0/configure.patch
rename to meta/recipes-support/gmp/gmp-5.1.0a/configure.patch
diff --git a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch b/meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
rename to meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.patch
diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0a.bb
similarity index 71%
rename from meta/recipes-support/gmp/gmp_5.1.0.bb
rename to meta/recipes-support/gmp/gmp_5.1.0a.bb
index 6591ebe..b5d6842 100644
--- a/meta/recipes-support/gmp/gmp_5.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.0a.bb
@@ -3,13 +3,12 @@ LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
 
-PR = "r1"
-
 SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
                    file://187b7b1646ee.patch \
                    file://obsolete_automake_macros.patch \
                    "
+S = "${WORKDIR}/gmp-5.1.0"
 
-SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
-SRC_URI[sha256sum] = "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"
+SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
+SRC_URI[sha256sum] = "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"
-- 
1.7.10.4



