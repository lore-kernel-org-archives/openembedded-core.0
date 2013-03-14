Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCde-0003Yd-Tm
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773813"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:31 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:02 +0200
Message-Id: <18b7c1383eb754d5f87df5b8de0191758c4134b4.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 03/17] gawk: Upgrade to v4.0.2
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
X-List-Received-Date: Thu, 14 Mar 2013 18:12:29 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb} (86%)

diff --git a/meta/recipes-extended/gawk/gawk_4.0.1.bb b/meta/recipes-extended/gawk/gawk_4.0.2.bb
similarity index 86%
rename from meta/recipes-extended/gawk/gawk_4.0.1.bb
rename to meta/recipes-extended/gawk/gawk_4.0.2.bb
index 38ad25b..d5cc52d 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.2.bb
@@ -13,12 +13,12 @@ DEPENDS += "readline"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bab2bda483e9f32be65b43b8dab39fa5"
-SRC_URI[sha256sum] = "476dee8bea8bc3b04af5cae502b83ea16edd5b703d20418918f8773889d78c80"
+SRC_URI[md5sum] = "4d505dc2c9f1eb3e9f8d6cac87d4bd1a"
+SRC_URI[sha256sum] = "6e0de117c3713aa8d7fa347fc9fd645b10038ae49d8cf947d8c1d51cbb76141a"
 
 inherit autotools gettext update-alternatives
 
-- 
1.7.9.5



