Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyr-0007oB-Oo
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328353"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:58 +0300
Message-Id: <1343108218-7108-6-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 5/5] byacc: upgrade to ver. 20120526
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
X-List-Received-Date: Tue, 24 Jul 2012 05:48:26 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../byacc/{byacc_20120115.bb => byacc_20120526.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20120115.bb => byacc_20120526.bb} (75%)

diff --git a/meta/recipes-extended/byacc/byacc_20120115.bb b/meta/recipes-extended/byacc/byacc_20120526.bb
similarity index 75%
rename from meta/recipes-extended/byacc/byacc_20120115.bb
rename to meta/recipes-extended/byacc/byacc_20120526.bb
index 4549ca4..8721b1c 100644
--- a/meta/recipes-extended/byacc/byacc_20120115.bb
+++ b/meta/recipes-extended/byacc/byacc_20120526.bb
@@ -9,5 +9,5 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "3061c62c47ec0f43255afd8fc3f7e3ab"
-SRC_URI[sha256sum] = "4034efc9b59646fc61e29b1a87472cccf1d1aaf45435f9d3bf58dec2b5f0831c"
+SRC_URI[md5sum] = "d8a9959f784205092762eb29426bdf23"
+SRC_URI[sha256sum] = "be05856b039bc9eb95a93cf89ac381de4fc6bb91d236c6b130e8b1daeb6075d6"
-- 
1.7.9.5



