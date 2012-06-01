Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SaQPa-0006HU-06
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 13:52:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 04:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106677873"
Received: from unknown (HELO lpalcu-laptop.ger.corp.intel.com)
	([10.252.120.35])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 04:41:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 14:41:25 +0300
Message-Id: <1338550885-4165-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] directfb-examples: upgrade to 1.5.3
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
X-List-Received-Date: Fri, 01 Jun 2012 11:52:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...xamples_1.2.0.bb => directfb-examples_1.5.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.2.0.bb => directfb-examples_1.5.3.bb} (77%)

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb
similarity index 77%
rename from meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
rename to meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb
index 215426e..8eec7ba 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.5.3.bb
@@ -16,5 +16,5 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools
 
-SRC_URI[md5sum] = "ce018f681b469a1d72ffc32650304b98"
-SRC_URI[sha256sum] = "830a1bd6775d8680523596a88a72fd8e4c6a74bf886d3e169b06d234a5cf7e3e"
+SRC_URI[md5sum] = "f2a5dac3bf1eb8bc0f766525831ac467"
+SRC_URI[sha256sum] = "7ceb9539a39e4221d838a3b8e8a3834c0c254ecdb34afc27e9bbcf55027cbbb1"
-- 
1.7.9.5



