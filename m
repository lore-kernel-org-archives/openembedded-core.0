Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UCuej-0004jP-Qd
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 17:24:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Mar 2013 08:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="299341541"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2013 08:07:04 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 18:10:27 +0200
Message-Id: <1362499827-24634-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gmp: fix missing PR after update to 5.1.0a
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
X-List-Received-Date: Tue, 05 Mar 2013 16:24:00 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-support/gmp/gmp_5.1.0.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
index 73a4336..3c3d985 100644
--- a/meta/recipes-support/gmp/gmp_5.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
@@ -9,5 +9,7 @@ SRC_URI_append = " file://use-includedir.patch \
                    file://obsolete_automake_macros.patch \
                    "
 
+PR = "r2"                   
+
 SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
 SRC_URI[sha256sum] = "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"
-- 
1.7.10.4



