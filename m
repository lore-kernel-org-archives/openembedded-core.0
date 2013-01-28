Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1Tzo2h-000623-K6
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 13:42:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 04:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="253552497"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 04:26:51 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:27:46 +0200
Message-Id: <1359376066-20756-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] mtools : upgrade to 4.0.18
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
X-List-Received-Date: Mon, 28 Jan 2013 12:42:47 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb}  |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb} (86%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.17.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
similarity index 86%
rename from meta/recipes-devtools/mtools/mtools_4.0.17.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 5ce6c09..0f99685 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.17.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -5,7 +5,7 @@ SECTION = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r0"
 
 RDEPENDS_${PN} = "glibc-gconv-ibm850"
 RRECOMMENDS_${PN} = "\
@@ -24,13 +24,13 @@ RRECOMMENDS_${PN} = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
+SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
+SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
            file://no-x11.gplv3.patch"
 
-SRC_URI[md5sum] = "15571c615d8f75f5f6d294272f80c7fa"
-SRC_URI[sha256sum] = "0ecc358e30a72d215b1d4c625b27e67121cd6f6075370dfb791ef2a8b980ecb6"
 
 inherit autotools
 
-- 
1.7.9.5



