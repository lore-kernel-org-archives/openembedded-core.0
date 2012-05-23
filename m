Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SX5wO-0004tI-3l
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 09:25:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 May 2012 00:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143633674"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 00:14:52 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 10:20:50 +0300
Message-Id: <1337757650-14163-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gawk: update to 4.0.1
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
X-List-Received-Date: Wed, 23 May 2012 07:25:04 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../gawk/{gawk_4.0.0.bb => gawk_4.0.1.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_4.0.0.bb => gawk_4.0.1.bb} (86%)

diff --git a/meta/recipes-extended/gawk/gawk_4.0.0.bb b/meta/recipes-extended/gawk/gawk_4.0.1.bb
similarity index 86%
rename from meta/recipes-extended/gawk/gawk_4.0.0.bb
rename to meta/recipes-extended/gawk/gawk_4.0.1.bb
index 977feb9..b986ebd 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.0.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.1.bb
@@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "51e417b71287629940051e6f652c6492"
-SRC_URI[sha256sum] = "c3a7cf7d976e05c6a1d8a9b3f14fa55d4304707408ddafb1396212653ea00be5"
+SRC_URI[md5sum] = "bab2bda483e9f32be65b43b8dab39fa5"
+SRC_URI[sha256sum] = "476dee8bea8bc3b04af5cae502b83ea16edd5b703d20418918f8773889d78c80"
 
 inherit autotools gettext update-alternatives
 
-- 
1.7.9.5



