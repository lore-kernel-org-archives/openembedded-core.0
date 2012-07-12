Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SpFbz-0005ti-VB
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 11:23:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2012 02:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164786666"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2012 02:11:49 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 12:13:57 +0300
Message-Id: <1342084437-15520-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gmp: upgrade to 5.0.5
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
X-List-Received-Date: Thu, 12 Jul 2012 09:23:04 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../gmp/{gmp_5.0.4.bb => gmp_5.0.5.bb}             |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
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
1.7.9.5



