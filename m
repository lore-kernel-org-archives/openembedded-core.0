Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhT-0006t0-DS
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443359"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:28 -0700
Message-Id: <9c8000fdf696e234301a67d51dfeccc9bd1fcace.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/30] gmp: upgrade to 5.0.5
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:09 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gmp/{gmp_5.0.4.bb => gmp_5.0.5.bb}             |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gmp/{gmp_5.0.4.bb => gmp_5.0.5.bb} (72%)

diff --git a/meta/recipes-support/gmp/gmp_5.0.4.bb b/meta/recipes-support/gmp/gmp_5.0.5.bb
similarity index 72%
rename from meta/recipes-support/gmp/gmp_5.0.4.bb
rename to meta/recipes-support/gmp/gmp_5.0.5.bb
index f794438..2058868 100644
--- a/meta/recipes-support/gmp/gmp_5.0.4.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.5.bb
@@ -2,7 +2,6 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r1"
 
 SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
@@ -11,5 +10,5 @@ SRC_URI_append = " file://use-includedir.patch \
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-SRC_URI[md5sum] = "50c3edcb7c9438e04377ee9a1a061b79"
-SRC_URI[sha256sum] = "35d4aade3e4bdf0915c944599b10d23f108ffedf6c3188aeec52221c5cf9a06f"
+SRC_URI[md5sum] = "041487d25e9c230b0c42b106361055fe"
+SRC_URI[sha256sum] = "1f588aaccc41bb9aed946f9fe38521c26d8b290d003c5df807f65690f2aadec9"
-- 
1.7.7.6



